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
  table {
    margin: 5%;
  }
</style>
<body>
<h1>User List</h1>

<p>
  <a href="/user?action=create">Create new user</a>
</p>
<form action="/user?action=search" method="post">
  <input type="text" name="search">
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>