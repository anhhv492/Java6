<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row d-flex justify-content-center align-items-center">
      <div class="col">
        <div class="card shopping-cart" style="border-radius: 15px;">
          <div class="card-body text-black">

            <div class="row">
              <div class="col-lg-12 col-12 px-5 py-4">

                <h3 class="mb-5 pt-2 text-center fw-bold text-uppercase">Sản phẩm đã mua</h3>
			
               <table class="table table-borderd">
               		<thead>
						<th>Tên</th>
						<th>Đơn giá</th>
						<th>Màu sắc</th>
						<th>Thể loại</th>
						<th>Ngày mua</th>
						<th>Hình ảnh</th>
					</thead>
					<tbody>
					<c:if test="${!empty sessionScope.listHistory }">
					<c:forEach items="${sessionScope.listHistory}" var="list">
						<tr>
							<td>${list.product.ten}</td>
							<td><fmt:formatNumber>${list.product.donGia}</fmt:formatNumber></td>
							<td>${list.product.mauSac}</td>
							<td>${list.product.category.ten}</td>
							<td><fmt:formatDate value="${list.time}" pattern="dd-MM-yyyy"/></td>
							<td><img class="img-fluid" style="width: 140px" src="/PH14045_HaVietAnh_Assignment/img/${list.product.img}"></td>
						</tr>
					</c:forEach>
					</c:if>
               </table>

			<!-- Modal -->
				</div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<style>
	@media (min-width: 1025px) {
	  .h-custom {
	    height: 100vh !important;
	  }
	}
	
	.number-input input[type="number"] {
	  -webkit-appearance: textfield;
	  -moz-appearance: textfield;
	  appearance: textfield;
	}
	
	.number-input input[type=number]::-webkit-inner-spin-button,
	.number-input input[type=number]::-webkit-outer-spin-button {
	  -webkit-appearance: none;
	}
	
	.number-input button {
	  -webkit-appearance: none;
	  background-color: transparent;
	  border: none;
	  align-items: center;
	  justify-content: center;
	  cursor: pointer;
	  margin: 0;
	  position: relative;
	}
	
	.number-input button:before,
	.number-input button:after {
	  display: inline-block;
	  position: absolute;
	  content: '';
	  height: 2px;
	  transform: translate(-50%, -50%);
	}
	
	.number-input button.plus:after {
	  transform: translate(-50%, -50%) rotate(90deg);
	}
	
	.number-input input[type=number] {
	  text-align: center;
	}
	
	.number-input.number-input {
	  border: 1px solid #ced4da;
	  width: 10rem;
	  border-radius: .25rem;
	}
	
	.number-input.number-input button {
	  width: 2.6rem;
	  height: .7rem;
	}
	
	.number-input.number-input button.minus {
	  padding-left: 10px;
	}
	
	.number-input.number-input button:before,
	.number-input.number-input button:after {
	  width: .7rem;
	  background-color: #495057;
	}
	
	.number-input.number-input input[type=number] {
	  max-width: 4rem;
	  padding: .5rem;
	  border: 1px solid #ced4da;
	  border-width: 0 1px;
	  font-size: 1rem;
	  height: 2rem;
	  color: #495057;
	}
	
	@media not all and (min-resolution:.001dpcm) {
	  @supports (-webkit-appearance: none) and (stroke-color:transparent) {
	
	    .number-input.def-number-input.safari_only button:before,
	    .number-input.def-number-input.safari_only button:after {
	      margin-top: -.3rem;
	    }
	  }
	}
	
	.shopping-cart .def-number-input.number-input {
	  border: none;
	}
	
	.shopping-cart .def-number-input.number-input input[type=number] {
	  max-width: 2rem;
	  border: none;
	}
	
	.shopping-cart .def-number-input.number-input input[type=number].black-text,
	.shopping-cart .def-number-input.number-input input.btn.btn-link[type=number],
	.shopping-cart .def-number-input.number-input input.md-toast-close-button[type=number]:hover,
	.shopping-cart .def-number-input.number-input input.md-toast-close-button[type=number]:focus {
	  color: #212529 !important;
	}
	
	.shopping-cart .def-number-input.number-input button {
	  width: 1rem;
	}
	
	.shopping-cart .def-number-input.number-input button:before,
	.shopping-cart .def-number-input.number-input button:after {
	  width: .5rem;
	}
	
	.shopping-cart .def-number-input.number-input button.minus:before,
	.shopping-cart .def-number-input.number-input button.minus:after {
	  background-color: #9e9e9e;
	}
	
	.shopping-cart .def-number-input.number-input button.plus:before,
	.shopping-cart .def-number-input.number-input button.plus:after {
	  background-color: #4285f4;
	}
</style>