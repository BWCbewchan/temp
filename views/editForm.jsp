<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sửa Điện Thoại</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container my-4">
        <h1>Sửa Điện Thoại</h1>

        <!-- Display messages -->
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <form action="${pageContext.request.contextPath}/EditDienThoaiServlet" method="post">
            <input type="hidden" name="maDT" value="${dienThoai.maDT}" />
            <div class="form-group">
                <label for="tenDT">Tên Điện Thoại</label>
                <input type="text" class="form-control" name="tenDT" value="${dienThoai.tenDT}" required>
            </div>
            <div class="form-group">
                <label for="namSanXuat">Năm Sản Xuất</label>
                <input type="number" class="form-control" name="namSanXuat" value="${dienThoai.namSanXuat}" required>
            </div>
            <div class="form-group">
                <label for="cauHinh">Thông Tin Cấu Hình</label>
                <textarea class="form-control" name="cauHinh" required>${dienThoai.cauHinh}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">Cập Nhật</button>
        </form>
    </div>
    
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
