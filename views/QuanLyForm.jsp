<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Điện Thoại</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <!-- Header -->
        <h1 class="text-center mb-4">Quản Lý Điện Thoại</h1>

        <!-- Navbar -->
        <nav class="mb-4">
            <a href="listdt" class="btn btn-primary me-2">Danh Sách Sản Phẩm</a>
            <a href="DienThoaiFormServlet" class="btn btn-secondary me-2">Thêm Mới Sản Phẩm</a>
            <a href="QuanLyFormServlet" class="btn btn-info">Chức Năng Quản Lý</a>
        </nav>

        <!-- Search Form -->
        <form action="QuanLyFormServlet" method="get" class="d-flex mb-4">
            <input type="text" name="search" class="form-control me-2" placeholder="Tìm kiếm theo Mã ĐT hoặc Tên Điện Thoại" />
            <input type="submit" value="Tìm Kiếm" class="btn btn-primary">
        </form>

        <!-- Display messages -->
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <!-- Table of phones -->
        <table class="table table-bordered table-hover bg-white shadow rounded">
            <thead class="table-dark">
                <tr>
                    <th>Mã ĐT</th>
                    <th>Tên Điện Thoại</th>
                    <th>Năm Sản Xuất</th>
                    <th>Thông Tin Cấu Hình</th>
                    <th>Hành Động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="dienThoai" items="${listDienThoai}">
                    <tr>
                        <td><c:out value="${dienThoai.maDT}" /></td>
                        <td><c:out value="${dienThoai.tenDT}" /></td>
                        <td><c:out value="${dienThoai.namSanXuat}" /></td>
                        <td><c:out value="${dienThoai.cauHinh}" /></td>
                        <td>
                            <form action="QuanLyFormServlet" method="post" class="d-inline" onsubmit="return confirm('Bạn có chắc chắn muốn xóa không?');">
                                <input type="hidden" name="maDT" value="${dienThoai.maDT}">
                                <input type="submit" value="Xóa" class="btn btn-danger">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Footer -->
        <footer class="mt-5 text-center">
            <small class="text-muted"></small>
        </footer>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
