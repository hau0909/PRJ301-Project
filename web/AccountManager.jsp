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
        ${status}
        ${accountId}
        <!-- Bảng danh sách tài khoản -->
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Tên Tài Khoản</th>
                        <th>Password</th>
                        <th>Vai Trò</th>
                        <th>Trạng Thái</th>
                        <th>Hành Động</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Giả sử 'accountList' là danh sách các tài khoản lấy từ database -->
                <c:forEach var="a" items="${requestScope.accountList}">
                        <tr>
                            <td>${a.account_id}</td>
                            <td>${a.username}</td>
                            <td>${a.password}</td>
                            <td>
                                Khách Hàng
                            </td>
                            <td>
                                <c:if test="${a.status == 1 }">
                                    Hoạt Động
                                    ${a.status}
                                </c:if>
                                <c:if test="${a.status == 0 }">
                                    Ngưng Hoạt Động
                                </c:if>
                            </td>
                            <td >
                                <div style="display: flex; justify-content: space-evenly">
                                    <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#accountModal" 
                                       data-id="${a.account_id}" 
                                       data-username="${a.username}" 
                                       data-password="${a.password}" 
                                       data-action="edit">Sửa</button>
                                   <form action="ManageAcount" method="post">
                                       <input type="hidden" name="account_id" value="${a.account_id}" />
                                       <input type="hidden" name="status" value="${a.status}" />
                                       <input type="hidden" name="action" value="delete" />
                                       <button class="btn btn-danger btn-sm" 
                                      onclick="return confirm('Bạn có chắc chắn muốn xóa?')">
                                           <c:if test="${a.status == 1 }">
                                                Xoá
                                            </c:if>
                                            <c:if test="${a.status == 0 }">
                                                Kích Hoạt
                                            </c:if>
                                       </button>
                                   </form>
                                </div>
                            </td>
                        </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <!-- Nút thêm tài khoản admin mới -->
        <div class="text-right mt-3">
            <button class="btn btn-success" data-toggle="modal" data-target="#accountModal" data-action="add">Thêm Tài Khoản Mới</button>
        </div>
        </div>
    </div>
        
      <!-- Modal Chung cho Thêm và Chỉnh Sửa -->
      <div class="modal fade" id="accountModal"  style="top: 20%" tabindex="-1" role="dialog" aria-labelledby="accountModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="accountModalLabel">Chỉnh Sửa Tài Khoản</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="ManageAcount" method="post" id="accountForm">
                        <input type="hidden" name="account_id" id="account_id" />
                         <input type="hidden" name="action" id="action" />
                        <div class="form-group">
                            <label for="username">Tên Tài Khoản</label>
                            <input type="text" class="form-control" id="username" name="username" required />
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="text" class="form-control" id="password" name="password" required />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-primary">Lưu Thay Đổi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    
    
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        $('#accountModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget); // Button that triggered the modal
            var action = button.data('action'); // Kiểm tra xem là thêm hay chỉnh sửa
            var modal = $(this);

            if (action === 'edit') {
                // Nếu là chỉnh sửa
                var id = button.data('id');
                var username = button.data('username');
                var password = button.data('password');

                // Cập nhật nội dung của modal
                modal.find('.modal-title').text('Chỉnh Sửa Tài Khoản');
                modal.find('#account_id').val(id);
                modal.find('#username').val(username);
                modal.find('#password').val(password);
                modal.find('#action').val('edit');
            } else {
                // Nếu là thêm mới
                modal.find('.modal-title').text('Thêm Tài Khoản Mới');
                modal.find('#account_id').val(''); 
                modal.find('#username').val('');
                modal.find('#password').val('');
                modal.find('#action').val('add');
            }
        });
    </script>
</body>
</html>
