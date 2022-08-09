<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>Tên</th>
				<th>Giá</th>
				<th>Màu sắc</th>
				<th>Số lượng</th>
				<th>Chất liệu</th>
				<th>Ngày</th>
				<th>Kích thước</th>
				<th>Loại</th>
				<th>NSX</th>
				<th>Ảnh</th>
				<th>Tổng</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${listPro}" var="list">
			<tr>
				<td>${list.towelId.name }</td>
				<td><fmt:formatNumber value="${list.towelId.price}"></fmt:formatNumber></td>
				<td>${list.towelId.color }</td>
				<td>${list.quantity }</td>
				<td>${list.towelId.matter }</td>
				<td><fmt:formatDate value="${list.orderId.createDate}"/></td>
				<td>${list.towelId.size }</td>
				<td>${list.towelId.category.name}</td>
				<td>${list.towelId.brand}</td>			
				<td class=""><img alt="" src="/img/${list.towelId.img}" class="img-fluid" style="height: 100px; width: 100px"></td>
				<td><fmt:formatNumber value="${list.price}"></fmt:formatNumber></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>	