package edu.weekstore.controller;

import edu.weekstore.dto.Product;
import edu.weekstore.model.ProductDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

public class Main extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String user = "천재 sososo sososo";

        ServletContext application = request.getServletContext();
        String realPath = request.getSession().getServletContext().getRealPath("/");

        application.setAttribute("realPath", realPath);  //${realPath }
        ProductDAO dao = new ProductDAO();
        Product bestPro = dao.getBestProduct();
        request.setAttribute("bestPro",bestPro);

        Product newPro = dao.getNewProduct();
        request.setAttribute("newPro",newPro);

        request.setAttribute("user", user);
        RequestDispatcher view = request.getRequestDispatcher("/index.jsp");
        view.forward(request, response);
    }
}
