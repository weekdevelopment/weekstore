package edu.weekstore.controller.custom;

import edu.weekstore.dto.Custom;
import edu.weekstore.model.CustomDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/Mypage.do")
public class MypageCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("sid");

        CustomDAO dao = new CustomDAO();
        Custom cus = dao.getCustom(id);

        System.out.println(cus.toString());

        request.setAttribute("cus", cus);
        RequestDispatcher view = request.getRequestDispatcher("/custom/mypage.jsp");
        view.forward(request, response);
    }
}
