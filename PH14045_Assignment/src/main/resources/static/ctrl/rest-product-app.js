app.controller('rest-product-ctrl',function($scope,$http){
    $scope.products=[];
    $scope.categories=[];
    $scope.form={};
    $http.get(`http://localhost:8080/rest/admin/product`).then(res=>{
        $scope.products = res.data; 
    });
    $http.get(`http://localhost:8080/rest/admin/category`).then(res=>{
        $scope.categories = res.data; 
    });
    
})