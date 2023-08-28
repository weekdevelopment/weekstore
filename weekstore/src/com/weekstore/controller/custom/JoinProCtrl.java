package com.weekstore.controller.custom;

import com.weekstore.dto.Custom;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/JoinPro.do")
public class JoinProCtrl extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");
        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        String email = request.getParameter("email");
        String birth = request.getParameter("birth");
        String address1 = request.getParameter("address1");
        String address2 = request.getParameter("address2");

        boolean result = false;
        int suc = 0;

        CustomDAO dao

    }
}
