<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14/03/2023
  Time: 3:49 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>User List</h1>
<form action="/user?action=search" method="post">
    <input type="text" name="country">
    <button type="submit">Search</button>
</form>
<table class="table">
    <thread>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
        </tr>
    </thread>
    <tbody>
    <c:forEach items="${user}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.email}</td>
            <td>${user.country}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</table>
</body>
</html>
