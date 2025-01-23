<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản Lý Tài Khoản</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <!-- Thanh Menu -->
    <jsp:include page="Form/managerBar.jsp"></jsp:include>

    <div class="container mt-5">
        <h1 class="text-center">Quản Lý Tài Khoản</h1>
        <hr>

        <!-- Bảng danh sách tài khoản -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tên Tài Khoản</th>
                        
                        <th>Vai Trò</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Giả sử 'accountList' là danh sách các tài khoản lấy từ database -->
                    <c:forEach var="account" items="${accountList}">
                        <tr>
                            <td>${account.account_id}</td>
                            <td>${account.username}</td>
                           
                            <td>
                                <c:choose>
                                    <c:when test="${account.role == 'admin'}">Admin</c:when>
                                    <c:otherwise>Khách Hàng</c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <c:if test="${account.role == 'admin'}">
                                    <!-- Chỉ tài khoản Admin mới có các quyền dưới đây -->
                                    <a href="EditAccount.jsp?id=${account.account_id}" class="btn btn-primary btn-sm">Sửa</a>
                                    <a href="DeleteAccount?id=${account.account_id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                                </c:if>
                                <c:if test="${account.role != 'admin'}">
                                    <button class="btn btn-secondary btn-sm" disabled>Chỉ Xem</button>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- Nút thêm tài khoản admin mới -->
        <div class="text-right mt-3">
            <a href="AddAccount.jsp" class="btn btn-success">Thêm Tài Khoản Mới</a>
        </div>
    </div>



    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
