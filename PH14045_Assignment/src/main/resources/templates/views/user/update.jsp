<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<div class="container card">
	<div class="row offset-1 mt-3">
		<h2 class="form-title text-success mt-3">Cập nhật thông tin</h2>
		<!-- form -->
		
		<c:if test="${!empty sessionScope.updateFalse }">
			<div class="alert alert-danger">
				${ sessionScope.updateFalse }
			</div>
			<c:remove var="updateFalse" scope="session"/>
		</c:if>
		
		<form:form method="POST" class="col-6" modelAttribute="userModel" name="form_create" action="/user/updateInfo">
			<div class="form-group mt-3">
				<label>Tài khoản: ${sessionScope.account.email }</label>
			</div>
			<div class="form-group mt-3">
				<label for="name"><i class="zmdi zmdi-account material-icons-name"></i> ${sessionScope.account.name }</label>
				<form:input path="name" placeholder="Họ tên" cssClass="form-control" required="required"/>
			
			</div>
			<div class="form-group mt-3">
				<label for="re-pass"><i class="zmdi zmdi-phone"></i> ${sessionScope.account.phone }</label>
				<form:input path="phone" placeholder="Số điện thoại" cssClass="form-control" required="required"/>
			</div>
			<div class="form-group mt-3">
				<label for="re-pass"><i class="zmdi zmdi-pin"></i> ${sessionScope.account.location }</label>
				<form:input path="location" placeholder="Địa chỉ" cssClass="form-control" required="required"/>
			</div>
			<div class="form-group mt-3">
				<label for="re-pass"><i class="zmdi zmdi-aspect-ratio-alt"></i> ${sessionScope.account.avatar }</label>
				<form:input path="avatar" type="file" placeholder="Hình ảnh" cssClass="form-control" />
			</div>
			<div class="form-group mt-3">
				Giới tính: ${sessionScope.account.gender==0 ?"Nam":"Nữ"}
				<br>
				<label for=""><i class="zmdi zmdi-male"></i></label>
				
				<form:radiobutton path="gender" value="0" label="`Nam" />
				<label><i class="zmdi zmdi-female"></i></label>
				<form:radiobutton path="gender" value="1" label="`Nữ" />
			</div>
			<div class="mt-3">
				<button class="btn btn-dark" type="submit">Xác nhận</button>
				<a class="btn btn-primary" href="/home">Back</a>
			</div>
			
		</form:form>
		<div class="col-4 container">
			<img src="/img/signup-image.jpg"
				alt="sing up image">
		</div>
	</div>
</div>