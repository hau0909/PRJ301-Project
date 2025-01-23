<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Chi Tiết Sản Phẩm</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/styles.css"/>
        <style>
            .stars {
                cursor: pointer;
                font-size: 2rem;
            }
            .star {
                color: #ccc;
            }
            .star:hover,
            .star:hover ~ .star {
                color: #ffcc00;
            }
            .alert {
                display: none;
            }
            .review-stars {
                color: #ffcc00;
            }
        </style>
    </head>
    <body>
        <!-- Menu -->
        <jsp:include page="Form/menuFrom.jsp"></jsp:include>

        <div class="container mt-5">
            <!-- Product Detail Section -->
            <div class="text-center mb-4">
                <h1 class="display-4">Chi Tiết Sản Phẩm</h1>
                <p class="lead">Tìm hiểu thêm về sản phẩm của chúng tôi.</p>
                <hr class="my-4">
            </div>

            <div class="row">
                <!-- Left Column: Product Image -->
                <div class="col-md-6">
                    <div class="card">
                        <img src="${product.image}" class="card-img-top" alt="Hình ảnh sản phẩm">
                    </div>
                </div>

                <!-- Right Column: Product Information -->
                <div class="col-md-6">
                    <h2 class="card-title">${product.name}</h2>
                    <h5>Loại: <span id="productType">${product.cName}</span></h5>
                    <h5>Thương Hiệu: <span id="productBrand">${product.brand}</span></h5>

                    <!-- Rating and Comment Form -->
                    <form action="detail" method="POST" onsubmit="return validateForm()">
                        <input type="hidden" name="productID" value="${product.product_id}">
                        <input type="hidden" id="ratingValue" name="rating" value="0">
                        
                        
                        <div class="rating">
                            <h5>Đánh Giá: </h5>
                            <div class="stars">
                                <span class="star" data-value="1">&#9733;</span>
                                <span class="star" data-value="2">&#9733;</span>
                                <span class="star" data-value="3">&#9733;</span>
                                <span class="star" data-value="4">&#9733;</span>
                                <span class="star" data-value="5">&#9733;</span>
                            </div>
                        </div>

                        <div class="form-group mt-3">
                            <textarea class="form-control" id="commentText" name="comment" rows="4" placeholder="Viết bình luận của bạn..."></textarea>
                        </div>

                        <button type="submit" class="btn btn-primary">Gửi Đánh Giá</button>
                    </form>

                    <hr class="my-4">

                    <!-- Add to Cart Button -->
                    <form action="cart?source=addToCart" method="POST">
                        <input type="hidden" name="productID" value="${product.product_id}">
                        <input type="hidden" name="quantity" value="1">
                        <button type="submit" class="btn btn-primary mt-2" id="addToCart">Thêm vào giỏ hàng</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Review Section -->
        <div class="container mt-5">
            <c:if test="${empty listReview}">
                <h5 class="text-center">Chưa Có Đánh Giá</h5>
            </c:if>
            <c:if test="${not empty listReview}">
                <h5 class="text-center">Danh Sách Đánh Giá</h5>
                <div class="list-group">
                    <c:forEach var="r" items="${listReview}">
                        <div class="list-group-item">
                            <div>
                                <span class="review-stars">
                                    <c:forEach begin="1" end="${r.rating}" var="i">
                                        &#9733;
                                    </c:forEach>
                                    <c:forEach begin="1" end="${5 - r.rating}" var="j">
                                        &#9734;
                                    </c:forEach>
                                </span>
                            </div>
                            <p>${r.comment}</p>
                            <small class="text-muted">Thời gian: ${r.date}</small>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>

        <!-- Footer -->
        <jsp:include page="Form/footer.jsp"></jsp:include>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            // Handle star rating click
            document.querySelectorAll('.star').forEach(function (star) {
                star.addEventListener('click', function () {
                    const rating = this.getAttribute('data-value');
                    document.getElementById('ratingValue').value = rating;

                    // Update star colors
                    document.querySelectorAll('.star').forEach(function (s) {
                        s.style.color = s.getAttribute('data-value') <= rating ? '#ffcc00' : '#ccc';
                    });
                });
            });

            // Form validation
            function validateForm() {
                const rating = document.getElementById('ratingValue').value;
                const comment = document.getElementById('commentText').value.trim();

                if (rating === "0") {
                    alert("Vui lòng chọn số sao.");
                    return false;
                }

                if (comment === "") {
                    alert("Vui lòng nhập bình luận.");
                    return false;
                }

                return true;
            }
        </script>
    </body>
</html>
