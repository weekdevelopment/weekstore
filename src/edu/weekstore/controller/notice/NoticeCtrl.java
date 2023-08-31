package edu.weekstore.controller.notice;

import edu.weekstore.dto.Notice;
import edu.weekstore.model.NoticeDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Notice.do")
public class NoticeCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no = Integer.parseInt(request.getParameter("no"));
        NoticeDAO dao = new NoticeDAO();
        Notice noti = dao.getNotice(no);
        request.setAttribute("noti", noti);
        RequestDispatcher view = request.getRequestDispatcher("/notice/getNotice.jsp");
        view.forward(request, response);
    }
}