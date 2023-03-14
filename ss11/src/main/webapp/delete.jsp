<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/03/2023
  Time: 2:16 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<form method="post">
    <h3>Are you sure</h3>
    <fieldset>
        <legend>
            Product Information
        </legend>
        <table>
            <tr>
                <td>ProductName:</td>
                <td>${product.productName}</td>
            </tr>
            <tr>
                <td>ProductPrice:</td>
                <td>${product.productPrice}</td>
            </tr>
            <tr>
                <td>ProductDetail:</td>
                <td>${product.productDetail}</td>
            </tr>
            <tr>
                <td>ProductProducer:</td>
                <td>${product.productProducer}</td>
            </tr>
            <tr>
                <td>ProductImg:</td>
                <td>${product.productImg}</td>
            </tr>
            <tr>
                <td><input type="submit" value="Delete product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
