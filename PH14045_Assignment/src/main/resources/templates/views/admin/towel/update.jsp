<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
	<div class="container">
		<form:form action="/admin/towel/store" method="post" cssClass="form-group" modelAttribute="towelModel">
			<div class="col-10">
				<div class="form-group mt-3">
					<label for="name">Thể loại</label> 
					<form:select path="category" cssClass="form-select">
						<form:options items="${listCate}" itemValue="id" itemLabel="name" />
					</form:select>
				</div>
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-apps"></i></label> 
						<form:input path="name"  placeholder="Tên sản phẩm" cssClass="form-control" />
				</div>
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-filter-list"></i></label>
						<form:input path="count" type="number" placeholder="Số lượng" cssClass="form-control" />
				</div>	
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-card"></i></label>
						<form:input path="price" type="number" placeholder="Đơn giá" cssClass="form-control" />
				</div>	
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-compare"></i></label>
						<form:input path="matter" placeholder="Chất vải" cssClass="form-control" />
				</div>	
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-flower"></i></label>
						<form:input path="color" placeholder="Màu sắc" cssClass="form-control" />
				</div>	
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-grid"></i></label>
						<form:input path="size" placeholder="Kích thước" cssClass="form-control" />
				</div>
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-airline-seat-flat"></i></label>
						<form:input path="brand" placeholder="Nhà sản xuất" cssClass="form-control" required="required" />
				</div>
				<div class="form-group mt-3">
					<button type="submit" class="btn btn-dark">Update</button>
					<a href="/home" class="btn btn-primary">Back</a>
				</div>
			</div>
		</form:form>
	</div>	
