<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<c:if test="${empty listOrders.content}"><div class="alert alert-danger">Không có đơn hàng nào</div></c:if>
<c:if test="${!empty listOrders.content}">
<table class="table table-secondary table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th><input type="checkbox" id="check" name="check" class="form-check-input"></th>
				<th>Chủ đơn</th>
				<th>Tài khoản</th>
				<th>Địa chỉ</th>
				<th>Trạng thái</th>
				<th>Thao tác</th>
			</tr>
		</thead>
		<tbody>
		
		
		<c:forEach items="${listOrders.content}" var="list">
			<tr>
				<td><input type="checkbox" id="check"name="check" class="form-check-input"></td>
				<td>${list.userId.name}</td>
				<td>${list.userId.email}</td>
				<td>${list.address}</td>
				<td>${list.status==0 ?"Đang giao":"Đã giao"}</td>
				<td>
					<a href="/admin/order/update?id=${list.id}" class="btn btn-warning">Xong</a>
					<!-- Button trigger modal -->
					<button type="button" data-bs-target="#id${list.id}" class="btn btn-danger" data-bs-toggle="modal">
					  Hủy
					</button>
					
					<!-- Modal -->
					<div class="modal fade text-dark" id="id${list.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">Bạn có muốn hủy?</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					        Hủy không thể khôi phục lại!
					      </div>
					      <div class="modal-footer"> 
					      	<a href="/admin/order/delete?id=${list.id}" class="btn btn-primary">Xác nhận!</a>
					     
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
	${ listCategories.getNumber() + 1} / ${listCategories.getTotalPages() }
	  <ul class="pagination justify-content-center">
	    <li class="page-item"><a class="page-link" href="/admin/orders/get-all?page=0">First</a></li>
	    <c:if test="${page.getNumber() > 0 }">
	    <li class="page-item"><a class="page-link" href="/admin/orders/get-all?page=${listCategories.number-1}">Prev</a></li>
        </c:if>
	    <li class="page-item"><a class="page-link" href="/admin/orders/get-all?page=${listCategories.number+1}">Next</a></li>
	    <c:if test="${page.getNumber() < listCategories.getTotalPages()}">
	    <li class="page-item"><a class="page-link" href="/admin/orders/get-all?page=${listCategories.totalPages-1}">Last</a></li>
        </c:if>
	  </ul>
	</nav>
	</c:if>	
	