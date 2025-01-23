<%-- 
    Document   : managerBar
    Created on : Oct 29, 2024, 1:18:55 PM
    Author     : Dinh_Hau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Thanh điều hướng quản lý -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="Manager.jsp">Quản Lý</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="ManageAcount">Quản Lý Tài Khoản</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ManageProduct">Quản Lý Sản Phẩm</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="ManageOrder">Quản Lý Đơn Hàng</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Revenue">Doanh Thu</a>
                </li>
            </ul>
        </div>
    </nav>