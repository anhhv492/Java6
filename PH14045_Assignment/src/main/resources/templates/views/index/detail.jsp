<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<c:if test="${!empty detail }">
	<div class="row offset-2">
		<div class="col-12 col-md-4 mt-1 mb-3">
			<div class="card">
				<a href="shop-single.html" class="text-center mt-4"> <img
					src="/img/${detail.img}"style="width: 300px;height: 320px" 
					class="card-img-top img-fluid">
				</a>
				<div class="card-body">					
					
				</div>
			</div>
		</div>
		<div class="col-12 col-md-4 mt-1 mb-3">
			<div class="card">
				<div class="card-body">
					<ul class="form-group">
						<li class="h3">Tên: ${detail.name}</li>
						<li class="h3">Màu: ${detail.color}</li>
						<li class="h3">Còn: ${detail.count} cái</li>
						<li class="h3">Size: ${detail.size}</li>
						<li class="h3">Chất liệu: ${detail.matter}</li>
						<li class="h3">Giá:
						<fmt:formatNumber value="${detail.price}" type="number">
						</fmt:formatNumber> VNĐ</li>
						<li class="h3">Hãng: ${detail.brand}</li>
						
					</ul>
					<a class="btn btn-warning" href="/cart/addCart">
							Thêm giỏ hàng
						</a>
					<br>
				</div>
			</div>
		</div>
	</div>
</c:if>