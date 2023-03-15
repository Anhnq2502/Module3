package controller;

import model.User;
import service.UserServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends HttpServlet {
    UserServiceImpl service = new UserServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request,response);
                break;
            default:
                listUser(request, response);
                break;
        }
    }
    protected void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> user = service.selectAllUsers();
        request.setAttribute("user",user);
        request.getRequestDispatcher("/user/list.jsp").forward(request,response);
    }
    protected void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/user/create.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                try {
                    createUser(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "delete":
                try {
                    deleteUser(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "edit":
                try {
                    editUser(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "view":
                break;
            default:
                listUser(request, response);
                break;
        }
    }
    protected void createUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User newUser = new User(id, name, email, country);
        service.insertUser(newUser);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        dispatcher.forward(request, response);
    }

    protected void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        service.updateUser(user);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user/edit.jsp");
        requestDispatcher.forward(request,response);
    }
    protected void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        service.deleteUser(id);
        List<User> user = service.selectAllUsers();
        request.getAttribute("user");
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/user/list.jsp");
        requestDispatcher.forward(request,response);
    }
}
