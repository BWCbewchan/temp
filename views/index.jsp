<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quản Lý Sản Phẩm</title>
    <!-- Tailwind CSS -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mx-auto my-10">
        <!-- Header -->
        <h1 class="text-4xl font-bold mb-10">Quản Lý Sản Phẩm</h1>

        <!-- Navbar -->
        <nav class="mb-6 flex space-x-4">
            <a href="dsdtncc" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Danh Sách Sản Phẩm</a>
            <a href="DienThoaiFormServlet" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-600">Thêm Mới Sản Phẩm</a>
            <a href="QuanLyFormServlet" class="bg-teal-500 text-white px-4 py-2 rounded hover:bg-teal-600">Chức Năng Quản Lý</a>
        </nav>

        <!-- Footer -->
        <footer class="mt-10 text-center">
            <small class="text-gray-500">Nguyễn Tiến Phát - 21032191</small>
        </footer>
    </div>

    <!-- Optional JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
</body>
</html>
