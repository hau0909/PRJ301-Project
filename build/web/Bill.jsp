<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hóa Đơn</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/styles.css"/>
</head>
<body>
    <!-- Menu -->
    <jsp:include page="Form/menuFrom.jsp"></jsp:include>

    <div class="container mt-5">
        <!-- Đề mục -->
        <h1 class="display-4 text-center">Hóa Đơn Đặt Hàng</h1>
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
                <p><strong>Tên:</strong> <c:out value="${param.customerName}"/></p>
                <p><strong>Email:</strong> <c:out value="${param.customerEmail}"/></p>
                <p><strong>Số Điện Thoại:</strong> <c:out value="${param.customerPhone}"/></p>
                <p><strong>Địa Chỉ:</strong> <c:out value="${param.customerAddress}"/></p>
                <p><strong>Phương Thức Thanh Toán:</strong> <c:out value="${param.paymentMethod}"/></p>
            </div>
        </div>

        <div class="mt-5 text-center">
            <h4>Đơn Hàng Đã Được Ghi Nhận!</h4>
            <p>Chờ xử lý. Cảm ơn bạn đã đặt hàng!</p>
            <a href="Home.jsp" class="btn btn-primary">Quay Lại Trang Chủ</a>
            <a href="Cart.jsp" class="btn btn-secondary">Quay Lại Giỏ Hàng</a>
        </div>
    </div>

    <!-- Footer -->
    <jsp:include page="Form/footer.jsp"></jsp:include>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
