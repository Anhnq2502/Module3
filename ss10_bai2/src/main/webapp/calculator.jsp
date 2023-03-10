<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/03/2023
  Time: 11:28 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    form{
        border: 1px solid #000;
        position: relative;
    }
    .p_name{
        position: absolute;
        top: -28px;
        background: #fff;
        left: 15px;
    }
</style>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator" method="post">
    <table style="margin: 15px">
        <fiedlset>
            <p class="p_name">
                Calculator
            </p>
        <tr>
            <td>
                First operand:
            </td>
            <td>
                <input type="number" name="firstNumber">
            </td>
        </tr>
        <tr>
            <td>
                Operator:
            </td>
            <td>
                <select name="operator">
                    <option value="+">addition</option>
                    <option value="-">subtraction</option>
                    <option value="*">multiplication</option>
                    <option value="/">division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Second operand:
            </td>
            <td>
                <input type="number" name="secondNumber">
            </td>
        </tr>
        <tr>
            <td>
            <button type="submit">calculate</button>
            </td>
        </tr>
        </fiedlset>
    </table>
</form>
</body>
</html>
