<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!-- Start Featured Product -->
<section class="bg-light">
<div class="container">
	<div class="container py-5">

			<div class="col-lg-6 m-auto">
				<h1 class="h1">Featured Product</h1>
				<p>Reprehenderit in voluptate velit esse cillum dolore eu fugiat
					nulla pariatur. Excepteur sint occaecat cupidatat non proident.</p>
			</div>
		</div>
		<div class="row">
	<c:if test="${empty listTowel }"><div class="alert alert-warning">Sản phẩm này đã hết hàng</div></c:if>
	<c:if test="${!empty listTowel }">
	<c:forEach items="${listTowel }" var="pro">
		<div class="col-12 col-md-4 mt-1 mb-3">
			<div class="card">
				<a href="/cart/detail?id=${pro.id}" class="text-center"> <img
					src="/img/${pro.img}"style="width: 300px;height: 320px" 
					class="card-img-top img-fluid"
					alt="...">
				</a>
				<div class="card-body">
					<ul class="list-unstyled d-flex justify-content-between">
						
						<li class="text-muted text-dark">$ 
					<fmt:formatNumber value="${pro.price}" type="number"></fmt:formatNumber></li>
					</ul>
					<h5
						class="h2 text-decoration-none text-dark">${pro.name}</h5>
					
					<a class="btn btn-dark" href="/cart/detail?id=${pro.id}">
						Chi tiết
					</a>
				</div>
			</div>
		</div>
	</c:forEach>
	</c:if>
	</div>
	</div>
</section>
<!-- End Featured Product -->