<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Hàng</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css"/>
</head>
<body>
    <!-- Menu -->
    <jsp:include page="Form/menuFrom.jsp"></jsp:include>

    <div class="container mt-5">
        <!-- Đề mục -->
        <h1 class="display-4 text-center">Thông Tin Đặt Hàng</h1>
        <hr class="my-4"> <!-- Thanh ngang -->

        <div class="row">
            <!-- Danh sách sản phẩm -->
            <div class="col-md-6">
                <h5>Danh Sách Sản Phẩm</h5>
                <c:forEach var="item" begin="1" end="3"> <!-- Giả sử cartItems chứa danh sách sản phẩm trong giỏ -->
                    <div class="row align-items-center border-bottom pb-2 mb-2">
                        <div class="col-md-3">
                            <img src="image/male/ao/AoSoMi/1.jpg" class="img-fluid" alt="Hình ảnh sản phẩm" style="max-width: 80px;">
                        </div>
                        <div class="col-md-7">
                            <h6>Áo Sơ Mi</h6>
                            <small>Thương Hiệu: Nike</small><br>
                            <span>Số lượng: 1</span>
                        </div>
                        <div class="col-md-2 text-right">
                            <h6 class="price">77 VNĐ</h6>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Thông tin khách hàng -->
            <div class="col-md-6">
                <h5>Thông Tin Khách Hàng</h5>
                <form action="Bill.jsp" method="post"> <!-- Chuyển đến Bill.jsp -->
                    <div class="form-group">
                        <label for="customerName">Tên:</label>
                        <input type="text" class="form-control" id="customerName" name="customerName" required>
                    </div>
                    <div class="form-group">
                        <label for="customerEmail">Email:</label>
                        <input type="email" class="form-control" id="customerEmail" name="customerEmail" required>
                    </div>
                    <div class="form-group">
                        <label for="customerPhone">Số Điện Thoại:</label>
                        <input type="tel" class="form-control" id="customerPhone" name="customerPhone" required>
                    </div>
                    <div class="form-group">
                        <label for="customerAddress">Địa Chỉ:</label>
                        <input type="text" class="form-control" id="customerAddress" name="customerAddress" required>
                    </div>

                    <h6>Phương Thức Thanh Toán:</h6>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="payment1" value="Chuyển khoản" checked>
                        <label class="form-check-label" for="payment1">Chuyển Khoản</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="payment2" value="Tiền mặt">
                        <label class="form-check-label" for="payment2">Tiền Mặt</label>
                    </div>

                    <button type="submit" class="btn btn-success mt-3">Thanh Toán</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="Form/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
