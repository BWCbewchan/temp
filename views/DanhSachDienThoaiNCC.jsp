<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Điện Thoại</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

    <div class="container mx-auto my-10">
        <!-- Header and Navbar from index.jsp -->
        <h1 class="text-4xl font-bold mb-10">Quản Lý Sản Phẩm</h1>
        <nav class="mb-6 flex space-x-4">
            <a href="dsdtncc" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Danh Sách Sản Phẩm</a>
            <a href="DienThoaiFormServlet" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Thêm Mới Sản Phẩm</a>
            <a href="QuanLyFormServlet" class="bg-teal-500 text-white px-4 py-2 rounded hover:bg-teal-600">Chức Năng Quản Lý</a>
        </nav>

        <!-- Search Form -->
        <h2 class="text-2xl font-semibold mb-6">Danh Sách Điện Thoại</h2>
        <form action="dsdtncc" method="get" class="flex space-x-4 mb-6">
            <input type="text" name="search" class="form-input border border-gray-300 rounded px-4 py-2 w-2/3" placeholder="Tìm kiếm theo Mã NCC hoặc Tên Điện Thoại" />
            <input type="submit" value="Tìm Kiếm" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600 cursor-pointer" />
        </form>

        <!-- Nhà Cung Cấp Table -->
        <h3 class="text-xl font-semibold mb-4">Danh Sách Nhà Cung Cấp</h3>
        <table class="min-w-full bg-white shadow-md rounded overflow-hidden">
            <thead class="bg-gray-800 text-white">
                <tr>
                    <th class="text-left py-2 px-4">Mã NCC</th>
                    <th class="text-left py-2 px-4">Tên Nhà Cung Cấp</th>
                    <th class="text-left py-2 px-4">Địa Chỉ</th>
                    <th class="text-left py-2 px-4">Số Điện Thoại</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                <c:forEach var="ncc" items="${listNCC}">
                    <tr>
                        <td class="py-2 px-4"><c:out value="${ncc.maNCC}" /></td>
                        <td class="py-2 px-4"><c:out value="${ncc.tenNCC}" /></td>
                        <td class="py-2 px-4"><c:out value="${ncc.diaChi}" /></td>
                        <td class="py-2 px-4"><c:out value="${ncc.soDienThoai}" /></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Điện Thoại Table -->
        <h3 class="text-xl font-semibold my-6">Danh Sách Điện Thoại</h3>
        <table class="min-w-full bg-white shadow-md rounded overflow-hidden">
            <thead class="bg-gray-800 text-white">
                <tr>
                    <th class="text-left py-2 px-4">Mã Điện Thoại</th>
                    <th class="text-left py-2 px-4">Tên Điện Thoại</th>
                    <th class="text-left py-2 px-4">Năm Sản Xuất</th>
                    <th class="text-left py-2 px-4">Cấu Hình</th>
                    <th class="text-left py-2 px-4">Mã NCC</th>
                    <th class="text-left py-2 px-4">Hình Ảnh</th>
                </tr>
            </thead>
            <tbody class="divide-y divide-gray-200">
                <c:forEach var="dienThoai" items="${listDienThoai}">
                    <tr>
                        <td class="py-2 px-4">${dienThoai.maDT}</td>
                        <td class="py-2 px-4">${dienThoai.tenDT}</td>
                        <td class="py-2 px-4">${dienThoai.namSanXuat}</td>
                        <td class="py-2 px-4">${dienThoai.cauHinh}</td>
                        <td class="py-2 px-4">${dienThoai.nhaCungCap.tenNCC}</td>
                        <td class="py-2 px-4">
                            <img src="${pageContext.request.contextPath}/uploads/${dienThoai.hinhAnh}" width="100" height="100" alt="Hình Ảnh" class="rounded-lg" />
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Footer from index.jsp -->
        <footer class="mt-10 text-center">
            <small class="text-gray-500">Nguyễn Tiến Phát - 21032191</small>
        </footer>
    </div>

    <!-- Optional JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</body>
</html>
