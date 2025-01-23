<%-- 
    Document   : menuFrom
    Created on : Oct 24, 2024, 4:29:08 PM
    Author     : Dinh_Hau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>


<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="home">Shop</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <!--lấy cusomerID-->
    <input type="hidden" name="empID" value="customerID.......">


    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="product">Sản Phẩm</a> <!-- Category page -->
            </li>
            <%
                Integer customerId = (Integer) session.getAttribute("customer_id");
            %>
            <li class="nav-item">
                <a class="nav-link" href="cart?customerID=<%= customerId != null ? customerId : "" %>">Giỏ Hàng</a>
            </li>
            <li class="nav-item">
                <% if (customerId == null) { %>
                <a class="nav-link" href="/login">Đăng Nhập</a>
                <% } else { %>
                <a class="nav-link" href="/logout">Đăng Xuất</a>
                <% } %>
            </li>
        </ul> 
    </div>
</nav>