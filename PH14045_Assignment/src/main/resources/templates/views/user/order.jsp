<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr>
				<th>Họ tên</th>
				<th>Ngày mua</th>
				<th>Tổng tiền</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${listOrder}" var="list">
			<tr>
				<td>${sessionScope.account.name}</td>
				<td><fmt:formatDate value="${list.createDate}"/></td>
				<td>${list.cartDetails.price}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>	