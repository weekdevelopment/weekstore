package edu.weekstore.controller.admin;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/AddNotice.do")
public class AddNoticeCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String msg = "관리자의 공지사항 글 등록폼이 로딩되었습니다.";

        request.setAttribute("msg", msg);
        RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/admin/addNotice.jsp");
        view.forward(request, response);
    }
}
