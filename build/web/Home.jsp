<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="DAO.HomeDAO"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styles.css"/>
    </head>
    <body>
        <jsp:include page="Form/menuFrom.jsp"></jsp:include>
       
         
         
            <div class="container mt-5">
                <div class="jumbotron text-center">
                    <h1 class="display-4">Welcome to Our Store!</h1>
                    <p class="lead">Explore our newest products and enjoy shopping.</p>
                    <img src="./image/main-home-image.jpg" alt="alt"/>
                </div>
                <!-- Displaying Recent Products -->    
                <h2>Sản Phẩm Mới!</h2>
                <div class="row">
                <c:forEach items="${listP}" var="p">
                    <div class="col-md-4 mb-4">
                        <div class="card h-100">
                            <img src="${p.image}" class="card-img-top fixed-size-image" alt="${p.name}">
                            <div class="card-body">
                                <h5 class="card-title">${p.name}</h5>
                                <p class="card-text">${p.price} VND</p>
                                <a href="detail?id=${p.product_id}" class="btn btn-primary">View Details</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        
        <div class="fixed-footer">
        <jsp:include page="Form/footer.jsp"></jsp:include>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
