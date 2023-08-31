package edu.weekstore.controller.custom;

import edu.weekstore.dto.Custom;
import edu.weekstore.model.CustomDAO;
import edu.weekstore.util.AES256;

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
        String addr1 = request.getParameter("address1");
        String addr2 = request.getParameter("address2");
        String postcode = request.getParameter("postcode");
        String email = request.getParameter("email");
        String tel = request.getParameter("tel");
        String birth = request.getParameter("birth");
        int job = Integer.parseInt(request.getParameter("job"));
        String addr = request.getParameter("addr");

        boolean result = false;
        int suc = 0;

        CustomDAO dao = new CustomDAO();
        boolean pass = dao.idCheck(id);

        Custom user = new Custom();
        String key = "%02x";
        String encrypted = "";
        try {
            encrypted = AES256.encryptAES256(pw, key);
            System.out.println("비밀번호 암호화 : "+encrypted);
        } catch (Exception e) {
            e.printStackTrace();
        }

        user.setId(id);
        user.setPw(encrypted);
        user.setName(name);
        user.setAddr(addr1 + "<br>" +addr2);
        user.setTel(tel);
        user.setEmail(email);
        user.setBirth(birth);
        user.setJob(job);
        //user.setAddr(addr);
        suc = dao.addCustom(user);

        if(suc>0){
            response.sendRedirect(request.getContextPath());
        } else {
            //response.sendRedirect("/custom/join.jsp?qid="+id);
            response.sendRedirect("/Join.do");
        }
    }
}
