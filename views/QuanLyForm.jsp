<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Điện Thoại</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <!-- Header -->
        <h1 class="text-3xl font-bold mb-6">Quản Lý Điện Thoại</h1>

        <!-- Navbar -->
        <nav class="mb-6">
            <a href="dsdtncc" class="bg-blue-500 text-white px-4 py-2 rounded mr-2">Danh Sách Sản Phẩm</a>
            <a href="DienThoaiFormServlet" class="bg-gray-500 text-white px-4 py-2 rounded mr-2">Thêm Mới Sản Phẩm</a>
            <a href="QuanLyFormServlet" class="bg-teal-500 text-white px-4 py-2 rounded">Chức Năng Quản Lý</a>
        </nav>

        <!-- Search Form -->
        <form action="QuanLyFormServlet" method="get" class="flex mb-6">
            <input type="text" name="search" class="flex-grow border border-gray-300 p-2 rounded mr-2"
                placeholder="Tìm kiếm theo Mã ĐT hoặc Tên Điện Thoại" />
            <input type="submit" value="Tìm Kiếm" class="bg-blue-500 text-white px-4 py-2 rounded">
        </form>

        <!-- Display messages -->
        <c:if test="${not empty message}">
            <div class="bg-green-500 text-white p-4 mb-6 rounded">${message}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="bg-red-500 text-white p-4 mb-6 rounded">${error}</div>
        </c:if>

        <!-- Table of phones -->
        <table class="table-auto w-full bg-white shadow-md rounded-lg overflow-hidden">
            <thead class="bg-gray-800 text-white">
                <tr>
                    <th class="px-4 py-2">Mã ĐT</th>
                    <th class="px-4 py-2">Tên Điện Thoại</th>
                    <th class="px-4 py-2">Năm Sản Xuất</th>
                    <th class="px-4 py-2">Thông Tin Cấu Hình</th>
                    <th class="px-4 py-2">Hành Động</th>
                </tr>
            </thead>
            <tbody class="text-gray-700">
                <c:forEach var="dienThoai" items="${listDienThoai}">
                    <tr class="border-t">
                        <td class="px-4 py-2"><c:out value="${dienThoai.maDT}" /></td>
                        <td class="px-4 py-2"><c:out value="${dienThoai.tenDT}" /></td>
                        <td class="px-4 py-2"><c:out value="${dienThoai.namSanXuat}" /></td>
                        <td class="px-4 py-2"><c:out value="${dienThoai.cauHinh}" /></td>
                        <td class="px-4 py-2">
                            <form action="QuanLyFormServlet" method="post" class="inline" onsubmit="return confirm('Bạn có chắc chắn muốn xóa không?');">
                                <input type="hidden" name="maDT" value="${dienThoai.maDT}">
                                <input type="submit" value="Xóa" class="bg-red-500 text-white px-4 py-2 rounded">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Footer -->
        <footer class="mt-6 text-center">
            <small class="text-gray-500">Nguyễn Tiến Phát - 21032191</small>
        </footer>
    </div>
</body>
</html>
