<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<style>
    img {
        width: 100px;
        height: 100px;
    }

    table {
        margin: 5%;
    }

    .btn1 {
        background: linear-gradient(
                to right,
                red,
                blue,
                yellow);
    );
    }
</style>
<body>
<h1>Product List</h1>
<p>
    <a href="/product?action=create">Create new product</a>
</p>
<table class="table">
    <thread>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Price</th>
            <th>Image</th>
        </tr>
    </thread>
    <tbody>
    <c:forEach items="${product}" var="product">
        <tr>
            <td>${product.productId}</td>
            <td>${product.productName}</td>
            <td>${product.productPrice}</td>
            <td><img src="${product.productImg}" alt=""></td>
            <td><a href="/product?action=delete&productId=${product.productId -1}">
                <button class="btn1" type="submit">Delete</button>
            </a></td>
            <td><a href="/product?action=edit&productId=${product.productId -1}">
                <button class="btn1" type="submit">Edit</button>
            </a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>