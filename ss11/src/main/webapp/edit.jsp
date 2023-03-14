<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit product</title>
</head>
<body>
<h1>Edit product</h1>
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
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Id:</td>
                <td><input type="text" name="productId" id="Id" value="${requestScope["product"].getProductId()}"></td>
            </tr>
            <tr>
                <td>Name:</td>
                <td><input type="text" name="productName" id="Name" value="${requestScope["product"].getProductName()}">
                </td>
            </tr>
            <tr>
                <td>Price:</td>
                <td><input type="text" name="productPrice" id="Price"
                           value="${requestScope["product"].getProductPrice()}"></td>
            </tr>
            <tr>
                <td>Image:</td>
                <td><input type="text" name="productImg" id="Image" value="${requestScope["product"].getProductImg()}">
                </td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update customer"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>