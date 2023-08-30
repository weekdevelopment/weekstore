package edu.weekstore.controller.admin;

import edu.weekstore.dto.Winner;
import edu.weekstore.model.WinnerDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UpdateWinnerPro.do")
public class UpdateWinnerProCtrl extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Winner winner = new Winner();
        winner.setNo(Integer.parseInt(request.getParameter("no")));
        winner.setTitle(request.getParameter("title"));
        winner.setContent(request.getParameter("content"));

        WinnerDAO dao = new WinnerDAO();
        int a = dao.updateWinner(winner);

        PrintWriter out = response.getWriter();

        if(a>0){
            response.sendRedirect(request.getContextPath() + "/AdminWinnerList.do");
        } else {
            out.println("<script>history.go(-1);</script>");
        }
    }
}