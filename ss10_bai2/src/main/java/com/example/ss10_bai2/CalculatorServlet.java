package com.example.ss10_bai2;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/calculator")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/calculator.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            Double firstNum = Double.valueOf(request.getParameter("firstNumber"));
            Double secondNum = Double.valueOf(request.getParameter("secondNumber"));
            String operator = request.getParameter("operator");
            Double result = 0.0;
        System.out.println("2");
        switch (operator) {
            case "+":
                result = firstNum + secondNum;
                break;
            case "-":
                result = firstNum - secondNum;
                break;
            case "*":
                result = firstNum * secondNum;
                break;
            case "/":
                result = firstNum / secondNum;
                break;
        }
        System.out.println(result);
            request.setAttribute("result", result);
            request.setAttribute("first",firstNum);
            request.setAttribute("second",secondNum);
            request.setAttribute("operator",operator);
            request.getRequestDispatcher("result.jsp").forward(request,response);
    }
}
