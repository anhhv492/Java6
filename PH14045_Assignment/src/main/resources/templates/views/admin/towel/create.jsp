<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
	<div class="container">
		<form:form action="/admin/towel/insert" method="post" class="form-group" modelAttribute="towelModel">
			<div class="col-10">
				<div class="form-group mt-3">
					<label for="name">Thể loại</label> 
					<select name="category" class="form-select">
						<c:forEach items="${listCate}" var="listCate">
							<option value="${listCate.id}">
								${listCate.name}
							</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-apps"></i></label> 
						<form:input path="name"  placeholder="Tên sản phẩm" cssClass="form-control" required="required" />
				</div>
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-filter-list"></i></label>
						<form:input path="count" type="number" placeholder="Số lượng" cssClass="form-control" required="required" />
				</div>	
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-card"></i></label>
						<form:input path="price" type="number" placeholder="Đơn giá" cssClass="form-control" required="required" />
				</div>	
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-compare"></i></label>
						<form:input path="matter" placeholder="Chất vải" cssClass="form-control" required="required" />
				</div>	
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-flower"></i></label>
						<form:input path="color" placeholder="Màu sắc" cssClass="form-control" required="required" />
				</div>	
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-grid"></i></label>
						<form:input path="size" placeholder="Kích thước" cssClass="form-control" required="required" />
				</div>
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-grid"></i></label>
						<form:input path="brand" placeholder="Nhà sản xuất" cssClass="form-control" required="required" />
				</div>
				<div class="form-group mt-3">
					<label for="name"><i
						class="zmdi zmdi-grid"></i></label>
						<form:input path="img" type="file" placeholder="Hình ảnh" cssClass="form-control" required="required" />
				</div>
				<div class="form-group mt-3">
					<button type="submit" class="btn btn-dark">Insert</button>
					<a href="/home" class="btn btn-primary">Back</a>
				</div>
			</div>
		</form:form>
	</div>	
