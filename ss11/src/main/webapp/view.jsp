<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
  <a href="/product">Back to product list</a>
</p>
<table>
  <tr>
    <td>Id: </td>
    <td>${requestScope["product"].getProductId()}</td>
  </tr>
  <tr>
    <td>Name: </td>
    <td>${requestScope["product"].getProductName()}</td>
  </tr>
  <tr>
    <td>Price: </td>
    <td>${requestScope["product"].getProductPrice()}</td>
  </tr>
  <tr>
    <td>Image: </td>
    <td>${requestScope["product"].getProductImg()}</td>
  </tr>
</table>
</body>
</html>
