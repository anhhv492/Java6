var app=angular.module('account_app',[]);
app.controller('account_ctrl',function($scope,$http){
    var url = `http://localhost:8080/auth`;
    $scope.form={};
    $scope.signup=function(){
        $scope.form=angular.copy($scope.account);
        if(($scope.form.username!=null&&$scope.form.password!=null&&$scope.form.email!=null&&$scope.form.fullname!=null)) {
            $http.post(`${url}` + `/signup`, $scope.form).then(res => {
                if(res.data){
                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 2000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.addEventListener('mouseenter', Swal.stopTimer)
                            toast.addEventListener('mouseleave', Swal.resumeTimer)
                        }
                    })

                    Toast.fire({
                        icon: 'success',
                        title: 'Đăng ký thành công: ' + $scope.form.username + '!'
                    })
                }else{
                    const Toast = Swal.mixin({
                        toast: true,
                        position: 'top-end',
                        showConfirmButton: false,
                        timer: 3000,
                        timerProgressBar: true,
                        didOpen: (toast) => {
                            toast.addEventListener('mouseenter', Swal.stopTimer)
                            toast.addEventListener('mouseleave', Swal.resumeTimer)
                        }
                    })
                    Toast.fire({
                        icon: 'error',
                        title: 'Tài khoản:'+ $scope.form.username +' đã tồn tại!'
                    })

                }
            }).catch(err=>{
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                })
                Toast.fire({
                    icon: 'error',
                    title: 'Đăng ký thất bại!'
                })
            })
        }else{
            Swal.fire({
                icon: 'error',
                title: 'Vui lòng điền đầy đủ thông tin!',
                text: 'Nhấn ok để tiếp tục!'
            })
        }
    }
})