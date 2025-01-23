<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Đơn Hàng</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Thanh Menu -->
    <jsp:include page="Form/managerBar.jsp" />

    <div class="container mt-5">
        <h1 class="text-center">Quản Lý Đơn Hàng</h1>
        <hr>

        <!-- Bảng danh sách đơn hàng -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID Đơn Hàng</th>
                        <th>ID khách Hàng</th>
                        <th>Tổng Tiền</th>
                        <th>Trạng Thái</th>
                        <th>Phuong thức thanh toán</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${requestScope.orders}">
                       <tr>
                            <td>${order.orderId}</td> 
                            <td>${order.customerId}</td> 
                            <td>${order.totalPrice}</td> 
                            <td>${order.status}</td>
                            <td>${order.paymentMethod}</td> 
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
