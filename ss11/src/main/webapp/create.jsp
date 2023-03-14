<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Create new product</title>
  <style>
    .message{
      color:green;
    }
  </style>
</head>
<body>
<h1>Create new product</h1>
<p>
  <c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
  </c:if>
</p>
<p>
  <a href="/product">Back to product list</a>
</p>
<form method="post">
  <fieldset>
    <legend>product information</legend>
    <table>
      <tr>
        <td>Id: </td>
        <td><input type="text" name="productId" id="Id"></td>
      </tr>
      <tr>
        <td>Name: </td>
        <td><input type="text" name="productName" id="Name"></td>
      </tr>
      <tr>
        <td>Price: </td>
        <td><input type="text" name="productPrice" id="Price"></td>
      </tr>
      <tr>
        <td>Detail: </td>
        <td><input type="text" name="productDetail" id="Detail"></td>
      </tr>
      <td>Producer: </td>
      <td><input type="text" name="productProducer" id="Producer"></td>
      </tr>
      <tr>
        <td>Image: </td>
        <td><input type="text" name="productImg" id="Image"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="Create customer"></td>
      </tr>
    </table>
  </fieldset>
</form>
</body>
</html>