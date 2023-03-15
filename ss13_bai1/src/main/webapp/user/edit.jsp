<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit user</title>
</head>
<body>
<h1>Edit user</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/user">Back to user list</a>
</p>
<form method="post">
    <fieldset>
        <legend>user information</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" name="id" id="Id" value="${requestScope["user"].id}"></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="name" id="Name" value="${requestScope["user"].name}">
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="text" name="email" id="email"
                           value="${requestScope["user"].email}"></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td><input type="text" name="country" id="country"
                           value="${requestScope["user"].country}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update user"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>