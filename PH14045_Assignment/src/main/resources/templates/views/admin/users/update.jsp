<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>

<div class="container card">
	<div class="row offset-1 mt-3">
		<h2 class="form-title text-success mt-3">Quản lý tài khoản (Update)</h2>
		<!-- form -->
		<c:if test="${!empty sessionScope.udUserSuccess }">
		<div class="alert alert-success">
			${ sessionScope.udUserSuccess }
		</div>
		<c:remove var="udUserSuccess" scope="session"/>
		</c:if>
		<c:if test="${!empty sessionScope.udUserFail }">
			<div class="alert alert-danger">
				${ sessionScope.udUserFail }
			</div>
			<c:remove var="udUserFail" scope="session"/>
		</c:if>
		<form method="POST" class="col-6" name="form_create"
			action="/PH14045_HaVietAnh_Assignment/admin/update?id=${user.id}">
			<div class="form-group mt-3">
				<label for="name"><i
					class="zmdi zmdi-account material-icons-name"></i></label> <input
					type="text" name="hoTen" value="${user.hoTen}" placeholder="Họ tên" class="form-control"
					required />

			</div>
			<div class="form-group mt-3">
				<label for="re-pass"><i class="zmdi zmdi-pin"></i></label> <input
					type="text" name="diaChi" value="${user.diaChi}" placeholder="Địa chỉ"
					class="form-control" required />
			</div>
			<div class="form-group mt-3">
			<label>Giới tính: </label>
				<input type="radio" name="gioiTinh" value="0"${user.gioiTinh==0?"checked":"" } class="form-check-input"> Nam
				<input type="radio" name="gioiTinh" value="1"${user.gioiTinh==1?"checked":"" } class="form-check-input"> Nữ
				
			</div>
			<div class="form-group mt-3">
				<label for="re-pass"><i class="zmdi zmdi-phone"></i></label> <input
					type="text" name="sdt" value="${user.sdt}" placeholder="Số điện thoại"
					class="form-control" required />
			</div>
			
			<div class="form-group mt-3">
			<label>Vai trò: </label>
				<input type="radio" name="role" value="0"${user.role==0?"checked":"" } class="form-check-input"> Người dùng
				<input type="radio" name="role" value="1"${user.role==1?"checked":"" } class="form-check-input"> Quản lý
				
			</div>
			<div class="mt-3">
				<button class="btn btn-dark" type="submit">Update</button>
				<a class="btn btn-primary" href="/PH14045_HaVietAnh_Assignment/admin/create">Back</a>
			</div>

		</form>
		<div class="col-4 container">
			<img src="/Assignment/img/signup-image.jpg"
				alt="sing up image">
		</div>
	</div>
</div>