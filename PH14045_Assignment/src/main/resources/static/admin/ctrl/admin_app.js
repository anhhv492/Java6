const app = angular.module("admin_app", ['ngRoute']);
app.config(function ($routeProvider, $locationProvider) {
	$locationProvider.hashPrefix('');
	$routeProvider
	.when("/admin/product", {
		templateUrl:'/admin/product/form.html',
		controller: 'rest_product_ctrl'
	})
	.when("/admin/category", {
		templateUrl:'/admin/category/form.html',
		controller: 'rest_category_ctrl'
	});
});