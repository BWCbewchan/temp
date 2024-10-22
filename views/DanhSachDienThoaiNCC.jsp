<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh Sách Điện Thoại</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 40px auto;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .list-group {
            margin-bottom: 20px;
        }
        .list-group-item {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }
        .list-group-item:last-child {
            border-bottom: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Danh Sách Điện Thoại</h1>
        <div class="row">
            <div class="col-md-6">
                <h2>Danh Sách Nhà Cung Cấp</h2>
                <ul class="list-group">
                    <c:forEach items="${listNCC}" var="ncc">
                        <li class="list-group-item">${ncc.tenNCC}</li>
                    </c:forEach>
                </ul>
            </div>
            <div class="col-md-6">
                <h2>Tìm Kiếm Điện Thoại</h2>
                <form action="${pageContext.request.contextPath}/listdt" method="get">
                    <input type="text" name="search" placeholder="Tìm kiếm điện thoại...">
                    <button type="submit" class="btn btn-primary">Tìm kiếm</button>
                </form>
            </div>
        </div>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Mã Điện Thoại</th>
                    <th>Tên Điện Thoại</th>
                    <th>Năm Sản Xuất</th>
                    <th>Cấu Hình</th>
                    <th>Nhà Cung Cấp</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listDienThoai}" var="dienThoai">
                    <tr>
                        <td>${dienThoai.maDT}</td>
                        <td>${dienThoai.tenDT}</td>
                        <td>${dienThoai.namSanXuat}</td>
                        <td>${dienThoai.cauHinh}</td>
                        <td>${dienThoai.nhaCungCap.tenNCC}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>