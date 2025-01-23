<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Báo Cáo Doanh Thu</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
          .table-responsive {
            max-height: 500px; 
            overflow-y: auto;  
            overflow-x: auto;  
        }
        
         .table-responsive th {
            position: sticky;
            top: 0; 
            z-index: 10; 
        }
        
        .table-responsive::-webkit-scrollbar {
            width: 8px; 
        }

        .table-responsive::-webkit-scrollbar-thumb {
            background-color: #888;
            border-radius: 4px;
        }

        .table-responsive::-webkit-scrollbar-thumb:hover {
            background-color: #555; 
        }
    </style>
</head>
<body>
    <jsp:include page="Form/managerBar.jsp"></jsp:include>
    <div class="container mt-5">
        <h1 class="text-center">Báo Cáo Doanh Thu</h1>

        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card text-white bg-primary mb-3">
                    <div class="card-header">Số Lượng Đơn Hàng Đã Giao</div>
                    <div class="card-body">
                        <h5 class="card-title">${requestScope.totalOrder} Đơn Hàng</h5>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-success mb-3">
                    <div class="card-header">Số Lượng Khách Hàng Đã Mua</div>
                    <div class="card-body">
                        <h5 class="card-title">${requestScope.totalBuyer} Người</h5>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-white bg-warning mb-3">
                    <div class="card-header">Doanh Thu</div>
                    <div class="card-body">
                        <h5 class="card-title">${requestScope.totalIncome} VNĐ</h5>
                    </div>
                </div>
            </div>
        </div>

        <h2 class="mt-4">Phản Hồi Của Khách Hàng</h2>
        <div class="mt-3 table-responsive">
            <c:forEach var="r" items="${reviews}" varStatus="status">
                    <div class="alert alert-info">
                        <div>
                            ${r.comment}
                        </div>
                        <div>
                            <c:choose>
                                <c:when test="${r.rating >= 1}"><i class="fa fa-star" style="color: yellow"></i></c:when>
                                <c:otherwise><i class="fa fa-star-o"></i></c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${r.rating >= 2}"><i class="fa fa-star" style="color: yellow"></i></c:when>
                                <c:otherwise><i class="fa fa-star-o"></i></c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${r.rating >= 3}"><i class="fa fa-star" style="color: yellow"></i></c:when>
                                <c:otherwise><i class="fa fa-star-o"></i></c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${r.rating >= 4}"><i class="fa fa-star" style="color: yellow"></i></c:when>
                                <c:otherwise><i class="fa fa-star-o"></i></c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${r.rating == 5}"><i class="fa fa-star" style="color: yellow"></i></c:when>
                                <c:otherwise><i class="fa fa-star-o"></i></c:otherwise>
                            </c:choose>
                        </div>
                        <div>
                            ${r.date}
                        </div>
                    </div>
            </c:forEach>
        </div>

        <h2 class="mt-4">Biểu Đồ Doanh Thu</h2>
        <div class="mt-3">
            <canvas id="revenueChart" width="400" height="200"></canvas>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            var ctx = document.getElementById('revenueChart').getContext('2d');
            var revenueChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5'],
                    datasets: [{
                        label: 'Doanh Thu (VNĐ)',
                        data: [1000000, 1200000, 800000, 1500000, 2000000],
                        backgroundColor: 'rgba(54, 162, 235, 0.6)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: 'VNĐ'
                            }
                        }
                    }
                }
            });
        </script>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
