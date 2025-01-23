<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản Lý Sản Phẩm</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .my-container {
                margin: 0 30px;
            }
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
        <div class="my-container mt-5">
            <h1 class="text-center">Quản Lý Sản Phẩm</h1>

            <h2 class="mt-4">Danh Sách Sản Phẩm</h2>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th>ID</th>
                            <th style="width: 250px">Tên Sản Phẩm</th>
                            <th>Giá</th>
                            <th>Tồn Kho</th>
                            <th>Hình Ảnh</th>
                            <th>Size</th>
                            <th>Giới Tính</th>
                            <th>Thương Hiệu</th>
                            <th>Danh Mục</th>
                            <th>Trạng Thái</th>
                            <th style="width: 160px">Thao Tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="product" items="${requestScope.products}">
                            <tr>
                                <td>${product.product_id}</td>
                                <td>${product.name}</td>
                                <td>${product.price}</td>
                                <td>${product.stock}</td>
                                <td><img src="${product.image}" width="200" /></td>
                                <td>${product.size}</td>
                                <td>${product.gender}</td>
                                <td>${product.brand}</td>
                                <td>
                                    <c:forEach var="cates" items="${requestScope.cates}">
                                        <c:if test="${product.category_id == cates.category_id}">
                                            ${cates.name}
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${product.status == 1}">Hoạt Động</c:when>
                                        <c:otherwise>Ngưng Hoạt Động</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <div style="display: flex; justify-content: space-evenly">
                                        <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#editProductModal"
                                                data-id="${product.product_id}" 
                                                data-name="${product.name}" 
                                                data-price="${product.price}" 
                                                data-stock="${product.stock}" 
                                                data-size="${product.size}"
                                                data-gender="${product.gender}"
                                                data-brand="${product.brand}"
                                                data-cate="${product.category_id}">
                                            Sửa
                                        </button>
                                        <form action="ManageProduct" method="post" enctype="multipart/form-data" 
                                              onsubmit="return confirm('${product.status == 1 ? 'Bạn có chắc chắn muốn xóa sản phẩm ' : 'Bạn có chắc chắn muốn kích hoạt sản phẩm '} ${product.name}?')">
                                            <input type="hidden" name="product_id" value="${product.product_id}" />
                                            <input type="hidden" name="status" value="${product.status}" />
                                            <input type="hidden" name="action" value="delete" />
                                            <button class="btn ${product.status == 1 ? 'btn-danger' : 'btn-success'} btn-sm">
                                                <c:choose>
                                                    <c:when test="${product.status == 1}">Xóa</c:when>
                                                    <c:otherwise>Kích Hoạt</c:otherwise>
                                                </c:choose>
                                            </button>
                                        </form>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <h2 class="mt-4">Thêm Sản Phẩm Mới</h2>
            <form action="ManageProduct" method="post" enctype="multipart/form-data" class="mt-3">
                <input type="hidden" name="action" value="add" />
                <div class="form-group">
                    <label for="name">Tên Sản Phẩm:</label>
                    <input type="text" id="name" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="price">Giá:</label>
                    <input type="number" id="price" name="price" min="10000" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="stock">Tồn Kho:</label>
                    <input type="number" id="stock" name="stock" min="0" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="image">Hình Ảnh:</label>
                    <input type="file" id="image" name="image" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="gender">Giới Tính:</label>
                    <select id="gender" name="gender" class="form-control" required>
                        <option value="Male">Nam</option>
                        <option value="Female">Nữ</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="size">Kích Cỡ:</label>
                    <select class="form-control" id="size" name="size">
                        <option value="XS">XS</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="L">L</option>
                        <option value="XL">XL</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="brand">Thương Hiệu:</label>
                    <input type="text" id="brand" name="brand" class="form-control" required>
                </div>
                <div class="form-group">
                    <label for="category">Danh Mục:</label>
                    <select class="form-control" id="category" name="category">
                        <c:forEach items="${cates}" var="c">
                            <option value="${c.category_id}">${c.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Thêm Sản Phẩm</button>
            </form>
        </div>

        <!-- Edit Product Modal -->
        <div class="modal fade" id="editProductModal" tabindex="-1" role="dialog" aria-labelledby="editProductModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editProductModalLabel">Sửa Sản Phẩm</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="editProductForm" action="ManageProduct" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="product_id" id="editProductId" />
                            <input type="hidden" name="action" value="edit" />
                            <div class="form-group">
                                <label for="editName">Tên Sản Phẩm:</label>
                                <input type="text" id="editName" name="name" class="form-control" required>
                            </div>
                            <div class="d-flex justify-content-between">
                                <div class="form-group">
                                    <label for="editPrice">Giá:</label>
                                    <input type="number" id="editPrice" name="price" min="10000" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label for="editStock">Tồn Kho:</label>
                                    <input type="number" id="editStock" name="stock" min="0" class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="editImage">Hình Ảnh:</label>
                                <input type="file" id="editImage" name="image" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="editGender">Giới Tính:</label>
                                <select id="editGender" name="gender" class="form-control" required>
                                    <option value="Male">Nam</option>
                                    <option value="Female">Nữ</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="editSize">Kích Cỡ:</label>
                                <select class="form-control" id="editSize" name="size">
                                    <option value="XS">XS</option>
                                    <option value="S">S</option>
                                    <option value="M">M</option>
                                    <option value="L">L</option>
                                    <option value="XL">XL</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="editBrand">Thương Hiệu:</label>
                                <input type="text" id="editBrand" name="brand" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label for="editCategory">Danh Mục:</label>
                                <select class="form-control" id="editCategory" name="category">
                                    <c:forEach items="${cates}" var="c">
                                        <option value="${c.category_id}">${c.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary">Cập Nhật</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            $('#editProductModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);
                $('#editProductId').val(button.data('id'));
                $('#editName').val(button.data('name'));
                $('#editPrice').val(button.data('price'));
                $('#editStock').val(button.data('stock'));
                $('#editGender').val(button.data('gender'));
                $('#editSize').val(button.data('size'));
                $('#editBrand').val(button.data('brand'));
                $('#editCategory').val(button.data('cate'));
            });
        </script>
    </body>
</html>
