<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sản Phẩm</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styles.css"/>
    </head>
    <body>
        <!-- Menu -->
        <jsp:include page="Form/menuFrom.jsp"></jsp:include>
        
        <div class="container mt-5">
            <!-- Đề mục sản phẩm + Banner -->
            <div class="text-center mb-4">
                <h1 class="display-4">Sản Phẩm</h1>
                <p class="lead">Khám phá các sản phẩm đa dạng của chúng tôi.</p>
                <hr class="my-4"> <!-- Thanh ngang -->
            </div>

            <!-- Danh mục sản phẩm -->
            <div class="row mb-4 justify-content-center">
                <div class="col-auto">
                    <a href="category?gender=Male" class="btn btn-outline-primary">Thời Trang Nam</a>
                </div>
                <div class="col-auto">
                    <a href="category?gender=Female" class="btn btn-outline-primary">Thời Trang Nữ</a>
                </div>
            </div>

            <div class="row">
                <!-- Cột trái: Thương Hiệu -->
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="font-weight-bold">Thương Hiệu</h5>
                        </div>
                        <div class="list-group">
                            <c:forEach items="${listB}" var="p">
                                <a class="list-group-item list-group-item-action" href="category?brand=${p.brand}">${p.brand}</a>
                            </c:forEach>
                        </div>
                    </div>
                    <hr class="my-4"> <!-- Thanh ngang -->

                    <!-- Cột trái: Loại Kiểu Dáng -->
                    <div class="card">
                        <div class="card-header">
                            <h5 class="font-weight-bold">Loại Kiểu Dáng</h5>
                        </div>
                        <div class="list-group">
                            <c:forEach items="${listC}" var="c">
                                <a class="list-group-item list-group-item-action" href="category?categoryID=${c.category_id}">${c.name}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>

                <!-- Cột phải: Sản Phẩm -->
                <div class="col-md-9">
                    <div class="row">
                        <c:forEach var="p" items="${listP}">
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
            </div>
        </div>

        <!-- Footer -->
        <jsp:include page="Form/footer.jsp"></jsp:include>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
