package edu.weekstore.controller.admin;

import edu.weekstore.model.NoticeDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class DeleteNoticeCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int no = Integer.parseInt(request.getParameter("no"));

        NoticeDAO dao = new NoticeDAO();
        int a = dao.deleteNotice(no);

        PrintWriter out = response.getWriter();

        if(a>0){
            response.sendRedirect("/AdminNoticeList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}
