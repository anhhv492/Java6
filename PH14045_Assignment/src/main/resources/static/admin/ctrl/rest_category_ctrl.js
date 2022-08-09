app.controller('rest_category_ctrl',function($scope,$http,$interval){
    var urlCategory=`http://localhost:8080/rest/admin/category`;
    $scope.categories=[];
    $scope.form={};
    $scope.check=true;
    $http.get(urlCategory).then(res=>{
        $scope.categories = res.data;
        console.log('res',res)
    });
    $scope.create=function () {
        const cate = {
            'name':$scope.form.name
        };
        $http.post(urlCategory,cate).then(res=>{
            if(res.data){
                let timerInterval
                Swal.fire({
                    title: 'Vui lòng chờ một lát!',
                    html: 'I will close in <b></b> milliseconds.',
                    timer: 500,
                    timerProgressBar: true,
                    didOpen: () => {
                        Swal.showLoading()
                        const b = Swal.getHtmlContainer().querySelector('b')
                        timerInterval = setInterval(() => {
                            b.textContent = Swal.getTimerLeft()
                        }, 100)
                    },
                    willClose: () => {
                        clearInterval(timerInterval)
                    }
                }).then((result) => {
                    /* Read more about handling dismissals below */
                    if (result.dismiss === Swal.DismissReason.timer) {
                        const Toast = Swal.mixin({
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 2000,
                            timerProgressBar: true

                        })

                        Toast.fire({
                            icon: 'success',
                            title: 'Thêm thành công: '+$scope.form.name+'!'
                        })
                        $scope.load();
                    }
                })
            }else if(!res.data){
                console.log("create failse!",err );
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 2000,
                    timerProgressBar: true

                })

                Toast.fire({
                    icon: 'error',
                    title: 'Thể loại: '+cate.name+'đã có sẵn!'
                })
            }
        }).catch(err=>{
            console.log("create failse!",err );
            const Toast = Swal.mixin({
                toast: true,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000,
                timerProgressBar: true

            })

            Toast.fire({
                icon: 'error',
                title: 'Thêm thất bại: '+cate.name+'!'
            })
        });
    }
    $scope.update=function (item) {
        const cate = item;
        $http.put(urlCategory,item).then(res=>{
            console.log("update success!",res );
        }).catch(err=>{
            console.log("update failse!",err );
        });
    }
    $scope.load=function () {
        $http.get(urlCategory).then(res=>{
            $scope.categories = res.data;
            console.log('res',res)
        });
    }
    $scope.delete=function (item) {
        var cate=item;
        Swal.fire({
            title: 'Xóa: '+cate.name+"?",
            text: "You won't be able to revert this!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
                $http.delete(`${urlCategory}/${cate.id}`).then(res=>{
                    Swal.fire(
                        'Deleted!',
                        'Xóa thành công!',
                        'success'
                    )
                    $scope.load();
                }).catch(res=>{
                    Swal.fire(
                        'Deleted!',
                        cate.name+' còn chứa sản phẩm không thể xóa!',
                        'error'
                    )
                })
            }
        })
    }
})