<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
	
<div class="container card">
	<div class="row offset-1 mt-3">
		<h2 class="form-title text-success mt-3">Đăng nhập</h2>
		<!-- form -->
		<c:if test="${!empty sessionScope.loginFalse }">
			<div class="alert alert-danger">
				${ sessionScope.loginFalse}
			</div>
			<c:remove var="loginFalse" scope="session"/>
		</c:if>
		
		<form:form method="POST" class="col-6" name="form_create"
			action="/user/checklogin" modelAttribute="userModel">
			<div class="form-group mt-3">
				<label for="email"><i class="zmdi zmdi-email"></i></label>
				<form:input path="email" placeholder="Tài khoản" cssClass="form-control" required="required" />
			</div>
			<div class="form-group mt-3">
				<label for="pass"><i class="zmdi zmdi-lock"></i></label>
				<form:password path="password" placeholder="Mật khẩu" cssClass="form-control" minlength="5" required="required"/>
			</div>
			<div class="mt-3">
				<button class="btn btn-dark" type="submit">Đăng nhập</button>
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