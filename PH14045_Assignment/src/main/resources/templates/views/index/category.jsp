<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<div class="me-3 ms-3 row" >
<div class="offset-2 col-8">
	<form:form action="/admin/category/insert" method="post" class="form-group" modelAttribute="cateModel">
		<div class="col-10">
			<div class="form-group mt-3">
			<label for="name"><i
				class="zmdi zmdi-apps"></i></label> 
				<form:input path="name" placeholder="Tên sản phẩm" cssClass="form-control" required="required" />
			</div>
			<div class="form-group mt-3">
				<button type="submit" class="btn btn-dark">Insert</button>
				<a href="/home" class="btn btn-primary">Back</a>
			</div>
		</div>
	</form:form>
	<c:if test="${!empty sessionScope.cateFalse }">
				<div class="alert alert-danger">
					${sessionScope.cateFalse }
				</div> 
				<c:remove var="cateFalse" scope="session"/>
	</c:if>
	<table class="table table-secondary table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th><input type="checkbox" id="check" name="check" class="form-check-input"></th>
				<th>STT</th>
				<th>Tên</th>
				<th>Thao tác</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${listCategories.content}" var="list">
			<tr>
				<td><input type="checkbox" id="check"name="check" class="form-check-input"></td>
				<td>${list.id}</td>
				<td>${list.name}</td>
				<td>
					<a href="/admin/category/update?id=${list.id}" class="btn btn-warning">Chọn</a>
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
					      	<a href="/admin/category/delete?id=${list.id}" class="btn btn-primary">Xác nhận!</a>
					     
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
	    <li class="page-item"><a class="page-link" href="/admin/categories/get-all?page=0">First</a></li>
	    <li class="page-item"><a class="page-link" href="/admin/categories/get-all?page=${listCategories.number-1}">Prev</a></li>
	    <li class="page-item"><a class="page-link" href="/admin/categories/get-all?page=${listCategories.number+1}">Next</a></li>
	    <li class="page-item"><a class="page-link" href="/admin/categories/get-all?page=${listCategories.totalPages-1}">Last</a></li>
	  </ul>
	</nav>
	</div>
</div>