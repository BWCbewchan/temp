<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Kết Quả</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Nếu bạn có file CSS -->
</head>
<body>
    <h1>Kết Quả Thêm Điện Thoại</h1>
    
    <h2>Thông Tin Điện Thoại:</h2>
    <ul>
        <li>Mã Điện Thoại: ${dienThoai.maDT}</li>
        <li>Tên Điện Thoại: ${dienThoai.tenDT}</li>
        <li>Năm Sản Xuất: ${dienThoai.namSanXuat}</li>
        <li>Thông Tin Cấu Hình: ${dienThoai.cauHinh}</li>
        <li>Nhà Cung Cấp: ${dienThoai.nhaCungCap.tenNCC} (Mã NCC: ${dienThoai.nhaCungCap.maNCC})</li>
        <li>Hình Ảnh: <img src="${pageContext.request.contextPath}/uploads/${dienThoai.hinhAnh}" alt="Hình Ảnh" /></li>
    </ul>
    
    <a href="DienThoaiForm.jsp">Quay lại</a>
</body>
</html>
