<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/03/2023
  Time: 10:29 SA
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1" style="width: auto">
    <h1>Danh sách khách hàng</h1>
    <tr>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach items="${listCustomer}" var="customer">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.dateOfBirth}</td>
            <td>${customer.address}</td>
            <td><img src="${customer.img}" style="height: 50px; width: 50px"></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
