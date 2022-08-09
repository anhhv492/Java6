<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<div class="me-3 ms-3" >
	<nav class="navbar navbar-expand-lg navbar-dark bg-secondary ">
		<div class="container-fluid">
			<a href="/admin/towel/new" class="btn btn-primary navbar-brand">Thêm mới</a>
			<a href="/admin/towel/read-excel" class="btn btn-success navbar-brand">Add Excel</a>
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
	<c:if test="${!empty sessionScope.towelSuccess }">
		<div class="alert alert-success">
			${sessionScope.towelSuccess }
		</div> 
		<c:remove var="towelSuccess" scope="session"/>
	</c:if>
	<table class="table table-secondary table-bordered table-striped table-hover">
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
				<th>Ảnh</th>
				<th>NSX</th>
				<th>Thao tác</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${listPro.content}" var="list">
			<tr>
				<td>${list.name }</td>
				<td><fmt:formatNumber value="${list.price}" type="number"></fmt:formatNumber></td>
				<td>${list.color }</td>
				<td>${list.count }</td>
				<td>${list.matter }</td>
				<td>${list.size }</td>
				<td><fmt:formatDate value="${list.createdDate}" pattern="dd/MM/yyyy"/></td>
				<td>${list.category.name}</td>
				<td class=""><img alt="" src="/img/${list.img}" class="img-fluid" style="height: 100px; width: 100px"></td>
				<td>${list.brand}</td>
				<td>
					<a href="/admin/towel/update?id=${list.id}" class="btn btn-warning">Chọn</a>
					<!-- Button trigger modal -->
					<button type="button" data-bs-target="#id${list.id}" class="btn btn-danger" data-bs-toggle="modal">
					  Xóa
					</button>
					
					<!-- Modal -->
					<div class="modal fade text-dark" id="id${list.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Bạn có muốn xóa?</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        Xóa không thể khôi phục lại!
					      </div>
					      <div class="modal-footer"> 
					      	<a href="/admin/towel/delete?id=${list.id}" class="btn btn-primary">Xác nhận!</a>
					     
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>		
					      </div>
					    </div>
					  </div>
					</div>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>	
	<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item"><a class="page-link" href="/admin/towels/get-all?page=0">First</a></li>
    <li class="page-item"><a class="page-link" href="/admin/towels/get-all?page=${listPro.number-1}">Prev</a></li>
    <li class="page-item"><a class="page-link" href="/admin/towels/get-all?page=${listPro.number+1}">Next</a></li>
    <li class="page-item"><a class="page-link" href="/admin/towels/get-all?page=${listPro.totalPages-1}">Last</a></li>
  </ul>
</nav>
</div>
