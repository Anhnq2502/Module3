package com.example.ss10_jsp_and_jstl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShowListServlet", value = "/customer")
public class ShowListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Nguyễn Văn Minh", "20/10/1999", "Nghệ An", "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/ba/29/5c/img-worlds-of-adventure.jpg?w=1200&h=-1&s=1"));
        customerList.add(new Customer("Lê Văn Chính", "10/10/2003", "Quảng Bình", "http://www.imgworlds.com/wp-content/uploads/2015/12/18-CONTACTUS-HEADER.jpg"));
        customerList.add(new Customer("Nguyễn Minh Lãnh", "02/02/1990", "Quảng Nam", "https://cdn-imgix.headout.com/tour/12441/TOUR-IMAGE/64a0a5a9-488e-4c5c-b427-e2ccfc5d51fa-6867-dubai-fast-track-img-worlds-of-adventure-tickets-04.jpeg"));
        customerList.add(new Customer("Nguyễn Quốc Anh", "25/02/2001", "Quảng Trị", "https://cdn-imgix.headout.com/tour/12441/TOUR-IMAGE/64a0a5a9-488e-4c5c-b427-e2ccfc5d51fa-6867-dubai-fast-track-img-worlds-of-adventure-tickets-04.jpeg"));
        request.setAttribute("listCustomer", customerList);
        request.getRequestDispatcher("list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}
