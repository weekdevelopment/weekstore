package edu.weekstore.controller.admin;

import edu.weekstore.dto.Notice;
import edu.weekstore.model.NoticeDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateNoticePro.do")
public class UpdateNoticeProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Notice noti = new Notice();
        noti.setNo(Integer.parseInt(request.getParameter("no")));
        noti.setTitle(request.getParameter("title"));
        noti.setContent(request.getParameter("content"));

        NoticeDAO dao = new NoticeDAO();
        int a = dao.updateNotice(noti);

        PrintWriter out = response.getWriter();

        if(a>0){
            response.sendRedirect("/AdminNoticeList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}