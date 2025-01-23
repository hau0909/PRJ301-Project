<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Giỏ Hàng</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styles.css"/>
    </head>
    <body>
        <!-- Menu -->
        <jsp:include page="Form/menuFrom.jsp"></jsp:include>

            <div class="container mt-5">
                <h1 class="display-4 text-center">Giỏ Hàng Của Bạn</h1>
                <hr class="my-4">
            <c:if test="${empty listCart}">
                <div class="mt-3 text-center">
                    <h4 style="color: #ccc">Chưa Có Sản Phẩm Nào Trong Giỏ Hàng</h4>
                     <hr class="my-4">
                    <a href="home" class="btn btn-primary">Quay Lại Trang Chủ</a>
                </div>
            </c:if>
            <div class="row">
                <c:forEach items="${listCart}" var="cart" varStatus="status">
                    <div class="col-md-12 mb-3 border-bottom pb-3 product-item">
                        <div class="row align-items-center">
                            <div class="col-md-2">
                                <img src="${cart.product.image}" class="img-fluid" alt="" style="max-width: 100px;">
                            </div>
                            <div class="col-md-6">
                                <h5>${cart.product.name}</h5>
                                <small>Thương Hiệu: ${cart.product.brand}</small>
                            </div>
                            <c:if test="${cart.product.status == 1 && cart.product.stock > 0}">
                                <div class="col-md-2">
                                    <input type="number" class="form-control text-center quantity" value="${cart.quantity}" min="1" max="${cart.product.stock}" data-index="${status.index}">
                                </div>
                                <div class="col-md-2 text-right">
                                    <form action="cart?source=removeProduct" method="POST">
                                        <input type="hidden" name="cusID" value="${cart.customer_id}">
                                        <input type="hidden" name="productID" value="${cart.product.product_id}">
                                        <h6 class="price">${cart.product.price} VNĐ</h6>
                                        <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                                    </form>
                                </div>
                            </c:if>
                            <c:if test="${cart.product.status != 1 || cart.product.stock <= 0}">
                                <div class="col-md-2">
                                    <h6 class="text-danger">Sản phẩm không khả dụng</h6>
                                </div>
                                <div class="col-md-2 text-right">
                                    <form action="cart?source=removeProduct" method="POST">
                                        <input type="hidden" name="cusID" value="${cart.customer_id}">
                                        <input type="hidden" name="productID" value="${cart.product.product_id}">
                                        <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                                    </form>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${not empty listCart}">
                <c:set var="hasAvailableProducts" value="false"/>
                <c:forEach items="${listCart}" var="cart">
                    <c:if test="${cart.product.status == 1 && cart.product.stock > 0}">
                        <c:set var="hasAvailableProducts" value="true"/>
                    </c:if>
                </c:forEach>

                <c:if test="${hasAvailableProducts}">
                    <form action="Order.jsp" method="post" id="cartForm">
                        <c:forEach items="${listCart}" var="cart" varStatus="status">
                            <c:if test="${cart.product.status == 1 && cart.product.stock > 0}">
                                <!-- Input hidden cho product_id của sản phẩm -->
                                <input type="hidden" name="product_id_${status.index}" value="${cart.product.product_id}">
                                <input type="hidden" name="price_${status.index}" value="${cart.product.price}">
                                <input type="hidden" id="hidden_quantity_${status.index}" name="quantity_${status.index}" value="${cart.quantity}">
                            </c:if>
                        </c:forEach>

                        <div class="text-right mt-4">
                            <h4>Tổng Tiền: <span id="totalPrice">0 VNĐ</span></h4>
                            <button type="submit" class="btn btn-success">Tiến Hành Thanh Toán</button>
                        </div>
                    </form>
                </c:if>
            </c:if>
        </div>

        <!-- Footer -->
        <div class="fixed-footer">
            <jsp:include page="Form/footer.jsp"></jsp:include>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            function updateTotalPrice() {
                let total = 0;
                $('.product-item').each(function () {
                    const price = parseFloat($(this).find('.price').text().replace(" VNĐ", ""));
                    const quantity = parseInt($(this).find('.quantity').val()) || 0;
                    total += price * quantity;
                });
                $('#totalPrice').text(total + ' VNĐ');
            }

            $(document).ready(function () {
                // Cập nhật khi số lượng thay đổi
                $('.quantity').on('change', function () {
                    const index = $(this).data('index');
                    $('#hidden_quantity_' + index).val($(this).val());
                    updateTotalPrice();
                });

                // Cập nhật tổng tiền khi trang được tải
                updateTotalPrice();
            });
        </script>
    </body>
</html>
