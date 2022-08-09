app.controller('rest_product_ctrl',function($scope,$http){
  var urlProduct=`http://localhost:8080/rest/admin/product`;
  var urlCategory=`http://localhost:8080/rest/admin/category`;
    $scope.products=[];
    $scope.categories=[];
    $scope.form={};
    $scope.check=true;
    $scope.index=0;
    //find categories
    $http.get(urlCategory).then(res=>{
      $scope.categories = res.data;
        console.log('res',res)
    });
    $scope.next=function () {
      $scope.index++;
      $scope.loadProducts();
    }
    $scope.prev=function () {
      $scope.index--;
      $scope.loadProducts();
    }
  $scope.first=function () {
    $scope.index=0;
    $scope.loadProducts();
  }
  $scope.last=function () {
    $scope.index--;
    $scope.loadProducts();
  }
    $scope.create = function(){
      const product=angular.copy($scope.form);
      product.category={'id':product.category}
      $http.post(urlProduct,product).then(res=>{
        const Toast = Swal.mixin({
          toast: true,
          position: 'top-end',
          showConfirmButton: false,
          timer: 3000,
          timerProgressBar: true
        })
        Toast.fire({
          icon: 'success',
          title: 'Thêm thành công!'
        })
        console.log('insert success',res)
      }).catch(err=>{
        const Toast = Swal.mixin({
          toast: true,
          position: 'top-end',
          showConfirmButton: false,
          timer: 3000,
          timerProgressBar: true
        })
        Toast.fire({
          icon: 'error',
          title: 'Thêm thất bại!'
        })
        console.log('insert failse',err)
      })
    }
    $scope.edit = function(item){
      $scope.form=angular.copy(item);
      $scope.check=false;
    }
    $scope.update=function () {
      var item =angular.copy($scope.form);
      $http.put(urlProduct,item).then(res=>{
        var index=$scope.products.findIndex(pro=>pro.id==item.id);
        $scope.products[index] = item;
        const Toast = Swal.mixin({
          toast: true,
          position: 'top-end',
          showConfirmButton: false,
          timer: 2000,
          timerProgressBar: true
        })
        Toast.fire({
          icon: 'success',
          title: 'Cập nhật thành công!'
        });

        $scope.refresh();
      }).catch(err=>{
        const Toast = Swal.mixin({
          toast: true,
          position: 'top-end',
          showConfirmButton: false,
          timer: 2000,
          timerProgressBar: true
        })
        Toast.fire({
          icon: 'error',
          title: 'Cập nhật thất bại!'
        });
      })
    }
    $scope.refresh=function(){
      $scope.form={};
      $scope.check=true;
    }
    $scope.delete=function(item){
        Swal.fire({
            title: 'Xóa: '+item.name+'?',
            text: "Xóa không thể khôi phục lại!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Xác nhận!'
          }).then((result) => {
            if (result.isConfirmed) {
              $http.delete(`${urlProduct}/${item.id}`).then(response => {
                console.log('res',response)
                Swal.fire({
                  title: 'Xóa thành công?',
                  text: "Nhấn ok để tiếp tục!",
                  icon: 'success',
                  confirmButtonColor: '#3085d6',
                  cancelButtonColor: '#d33',
                  confirmButtonText: 'OK!'
                }).then((result) => {
                  if (result.isConfirmed) {
                    location.reload();
                  }
                })
              }).catch(error=>{
                Swal.fire({
                  title: 'Xóa thất ba!',
                  text: "Sản phẩm chứa thông tin lịch sử của người dùng!",
                  icon: 'error'
                })
                console.log('error',error)
              })
            }
          })
    }
    var url=`http://localhost:8080/rest/files/images`;
    $scope.url = function(fileName){
      return `${url}/`+`${fileName}`;
    }
    $scope.fileNames=[];
    $scope.listFile = function(){
      $http.get(url).then(res=>{
        $scope.fileNames = res.data;
        console.log('ok',res);
      }).catch(err=>{
        console.log('Load files failse',err);
      })
    }
    $scope.uploadFile = function(files){
         var form = new FormData();
          form.append('file',files[0]);
         $http.post(url,form,{
          transformRequest: angular.identity,
          headers: {'Content-Type': undefined}
         }).then(res=>{
          $scope.form.image=res.data.name;
          console.log('image',res);
         }).catch(err=>{
          console.log('err',err);
         })
    }
    $scope.loadProducts = function(){
      $http.get(urlProduct+`/page/`+$scope.index).then(res=>{
        $scope.products = res.data;
        console.log('Load products success',res.data)
      }).catch(err=>{
        console.log('Load products failse',err.data);
      });
    }
    // find products
    $scope.loadProducts();
    $scope.listFile();
})