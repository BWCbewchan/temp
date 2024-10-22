<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thêm Điện Thoại</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        function validateForm() {
            const maDT = document.forms["dienThoaiForm"]["maDT"].value;
            const tenDT = document.forms["dienThoaiForm"]["tenDT"].value;
            const namSanXuat = document.forms["dienThoaiForm"]["namSanXuat"].value;
            const cauHinh = document.forms["dienThoaiForm"]["cauHinh"].value;
            const hinhAnh = document.forms["dienThoaiForm"]["hinhAnh"].value;
            const nhaCungCap = document.forms["dienThoaiForm"]["mancc"].value;

            const yearPattern = /^\d{4}$/;
            const configPattern = /^.{1,255}$/;
            const allowedExtensions = /(\.jpg|\.jpeg|\.png)$/i;

            if (!maDT || !tenDT || !namSanXuat || !cauHinh || !nhaCungCap) {
                alert("Mã ĐT, Tên điện thoại, Năm sản xuất, Cấu hình và Nhà cung cấp là bắt buộc!");
                return false;
            }

            if (!yearPattern.test(namSanXuat)) {
                alert("Năm sản xuất phải là số nguyên 4 chữ số!");
                return false;
            }

            if (!configPattern.test(cauHinh)) {
                alert("Cấu hình không được quá 255 ký tự!");
                return false;
            }

            if (hinhAnh && !allowedExtensions.exec(hinhAnh)) {
                alert("Vui lòng chọn một hình ảnh hợp lệ (jpg, jpeg, png).");
                return false;
            }

            return true;
        }
    </script>
</head>
<body class="bg-gray-100">
    <div class="container mx-auto p-6">
        <!-- Header -->
        <h1 class="text-3xl font-bold mb-6">Quản Lý Sản Phẩm</h1>

        <!-- Navbar -->
        <nav class="mb-6">
            <a href="listdt" class="bg-blue-500 text-white px-4 py-2 rounded mr-2">Danh Sách Sản Phẩm</a>
            <a href="DienThoaiFormServlet" class="bg-gray-500 text-white px-4 py-2 rounded mr-2">Thêm Mới Sản Phẩm</a>
            <a href="QuanLyFormServlet" class="bg-teal-500 text-white px-4 py-2 rounded">Chức Năng Quản Lý</a>
        </nav>

        <!-- Form Section -->
        <div class="bg-white p-8 rounded-lg shadow-lg">
            <h2 class="text-2xl font-semibold mb-4">Thêm Điện Thoại</h2>

            <!-- Error Message -->
            <c:if test="${not empty error}">
                <div class="bg-red-500 text-white p-3 mb-4 rounded">${error}</div>
            </c:if>

            <!-- Success Message -->
            <c:if test="${not empty successMessage}">
                <div class="bg-green-500 text-white p-3 mb-4 rounded">${successMessage}</div>
            </c:if>

            <form name="dienThoaiForm" action="DienThoaiFormServlet" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
                <div class="mb-4">
                    <label for="maDT" class="block text-gray-700">Mã ĐT:</label>
                    <input type="text" id="maDT" name="maDT" class="w-full border border-gray-300 p-2 rounded" value="${param.maDT}">
                </div>

                <div class="mb-4">
                    <label for="tenDT" class="block text-gray-700">Tên Điện Thoại:</label>
                    <input type="text" id="tenDT" name="tenDT" class="w-full border border-gray-300 p-2 rounded" value="${param.tenDT}">
                </div>

                <div class="mb-4">
                    <label for="namSanXuat" class="block text-gray-700">Năm Sản Xuất:</label>
                    <input type="text" id="namSanXuat" name="namSanXuat" class="w-full border border-gray-300 p-2 rounded" value="${param.namSanXuat}">
                </div>

                <div class="mb-4">
                    <label for="cauHinh" class="block text-gray-700">Cấu Hình:</label>
                    <textarea id="cauHinh" name="cauHinh" class="w-full border border-gray-300 p-2 rounded">${param.cauHinh}</textarea>
                </div>

                <div class="mb-4">
                    <label for="nhaCungCap" class="block text-gray-700">Nhà Cung Cấp:</label>
                    <select id="nhaCungCap" name="mancc" class="w-full border border-gray-300 p-2 rounded">
                        <option value="">-- Chọn Nhà Cung Cấp --</option>
                        <c:forEach var="nhaCungCap" items="${nhaCungCapList}">
                            <option value="${nhaCungCap.maNCC}" ${nhaCungCap.maNCC == param.mancc ? 'selected' : ''}>${nhaCungCap.tenNCC}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="mb-4">
                    <label for="hinhAnh" class="block text-gray-700">Hình Ảnh (png, jpg, jpeg):</label>
                    <input type="file" id="hinhAnh" name="hinhAnh" accept=".png,.jpg,.jpeg" class="block w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 cursor-pointer">
                </div>

                <button type="submit" class="bg-green-500 text-white px-4 py-2 rounded">Thêm</button>
            </form>
        </div>

        <!-- Footer -->
        <footer class="mt-6 text-center">
            <small class="text-gray-500"></small>
        </footer>
    </div>
</body>
</html>
