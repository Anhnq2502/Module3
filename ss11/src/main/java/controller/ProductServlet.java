package controller;

import model.Product;
import service.IProductService;
import service.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    private IProductService service = new ProductServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreatePage(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "edit":
                break;
            case "display":
                break;
            default:
                showProductList(request, response);
        }
    }

    protected void showProductList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = service.findAll();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }

    protected void showCreatePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/create.jsp");
    }

    protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String productName = request.getParameter("productName");
        Double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        String productImg = request.getParameter("productImg");
        Product product = new Product(productId, productName, productPrice, productImg);
        service.save(product);
        System.out.println("a");
        response.sendRedirect("/product");
    }


    protected void showDeleteForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = service.findById(productId);
        if (product == null) {
            request.getRequestDispatcher("");
        } else {
            request.setAttribute("product", product);
            request.getRequestDispatcher("/delete.jsp");
        }
    }

    protected void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = service.findById(productId);
        if (product == null) {
            request.getRequestDispatcher("");
        } else {
            service.delete(productId);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "edit":
                break;
            case "display":
                break;
            default:
                showProductList(request, response);


        }
    }
}
