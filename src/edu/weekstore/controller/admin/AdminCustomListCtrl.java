package edu.weekstore.controller.admin;

import edu.weekstore.dto.Custom;
import edu.weekstore.dto.Notice;
import edu.weekstore.model.CustomDAO;
import edu.weekstore.model.NoticeDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AdminCustomList.do")
public class AdminCustomListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "회원 목록을 출력합니다.");

        CustomDAO dao = new CustomDAO();
        List<Custom> cusList = dao.getCustomList();
        request.setAttribute("cusList", cusList);

        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/customList.jsp");
        view.forward(request, response);
    }
}