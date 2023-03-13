<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 13/03/2023
  Time: 10:54 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create</title>
</head>
<body>
<div class="container">

    <div class="row justify-content-center mt-4"></div>
  <form class="col-md6" action="/product" method="post"></form>
  <h1>Create Product</h1>
  <div class="form-group">
    <label for="txtID">Product ID</label>
    <input type="text" class="form-control" name="ProductId" id="txtID">
  </div>
  <div class="form-group">
    <label for="txtName">Product Name</label>
    <input type="text" class="form-control" name="ProductName" id="txtName">
  </div>
  <div class="form-group">
    <label for="txtPrice">Product Price</label>
    <input type="text" class="form-control" name="ProductPrice" id="txtPrice">
  </div>
  <div class="form-group">
    <label for="txtImage">Product Image</label>
    <input type="text" class="form-control" name="ProductImage" id="txtImage">
  </div>
  <div class="form-group mt-2">
    <button class="btn btn-success" role="button" type="submit">Create</button>
    <button class="btn btn-warning" role="button">Cancel</button>
  </div>
</div>
</body>
</html>
