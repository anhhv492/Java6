<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" %>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 

<div class="container card">
	<div class="row offset-1 mt-3">
		<h2 class="form-title text-success mt-3">Đăng ký</h2>
		<!-- form -->
		<c:if test="${!empty sessionScope.createError }">
			<div class="alert alert-danger">
				${sessionScope.createError }
			</div> 
			<c:remove var="createError" scope="session"/>
		</c:if>
		<form:form method="POST" class="col-6" modelAttribute="userModel" name="form_create" action="/user/insert">
			<div class="form-group mt-3">
				<label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
				<form:input path="name" placeholder="Họ tên" cssClass="form-control" required="required"/>
			
			</div>
			<div class="form-group mt-3">
				<label for="email"><i class="zmdi zmdi-email"></i></label>
				<form:input path="email" type="email" placeholder="Email" cssClass="form-control" required="required"/>
			</div>
			<div class="form-group mt-3">
				<label for="re-pass"><i class="zmdi zmdi-phone"></i></label>
				<form:input path="phone" placeholder="Số điện thoại" cssClass="form-control" required="required"/>
			</div>
			<div class="form-group mt-3">
				<label for="pass"><i class="zmdi zmdi-lock"></i></label>
				<form:password path="password" placeholder="Mật khẩu" cssClass="form-control" minlength="5" required="required"/>
			</div>
			<div class="mt-3">
				<button class="btn btn-dark" type="submit">Đăng ký</button>
			</div>
		</form:form>
		<div class="col-4 container">
			<img src="/img/signup-image.jpg"
				alt="sing up image">
		</div>
		<div class="offset-4">
			<a href="#">I Forget Password?</a>
		</div>
	</div>
</div>