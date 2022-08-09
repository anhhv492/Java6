<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
		<div class="container-fluid">
			<a href="/admin/towel/new" class="btn btn-primary navbar-brand">Thêm mới</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarScroll"
				aria-controls="navbarScroll" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarScroll">
				<ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"
					style="-bs-scroll-height: 100px;">
					<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#"
						id="navbarScrollingDropdown" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">Thể loại</a>
						<ul class="dropdown-menu"
							aria-labelledby="navbarScrollingDropdown">
							<c:forEach items="${listCate}" var="listCate">
								<li><a class="dropdown-item" href="/admin/towel/select/${listCate.id}">${listCate.name}</a></li>
							</c:forEach>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<form:form action="/admin/towel/search" cssClass="navbar" modelAttribute="towelSeach" method="post">
	Tìm kiếm:<form:input path="name" cssClass="form-control"/>
	</form:form>
		<c:if test="${!empty listPro}">
		<table class="table table-secondary table-bordered">
			<thead>
				<tr>
					<th>Tên</th>
					<th>Giá</th>
					<th>Màu sắc</th>
					<th>Số lượng</th>
					<th>Chất liệu</th>
					<th>Kích thước</th>
					<th>Ngày tạo</th>
					<th>Loại</th>
					<th>Thao tác</th>
				</tr>
			</thead>
			<tbody>
		<c:forEach items="${listPro}" var="list">
			<tr>
				<td>${list.name }</td>
				<td>${list.price }</td>
				<td>${list.color }</td>
				<td>${list.count }</td>
				<td>${list.matter }</td>
				<td>${list.size }</td>
				<td><fmt:formatDate value="${list.createdDate}" pattern="dd/MM/yyyy"/></td>
				<td>${list.category.name}</td>
				<td>
					<a href="/admin/towel/update?id=${list.id}" class="btn btn-warning">Chọn</a>
					<a href="/admin/towel/delete?id=${list.id}" class="btn btn-danger">Xóa</a>
				</td>
			</tr>
			
		</c:forEach>
			</tbody>
		</table>	
		</c:if>
		<c:if test="${empty listPro}">
			<div class="alert alert-warning">Không có sản phẩm nào</div>
		</c:if>
		
	<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    
  </ul>
</nav>