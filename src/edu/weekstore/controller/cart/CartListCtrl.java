package edu.weekstore.controller.cart;

import edu.weekstore.dto.Cart;
import edu.weekstore.dto.CartVO;
import edu.weekstore.dto.Notice;
import edu.weekstore.model.CartDAO;
import edu.weekstore.model.NoticeDAO;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/CartList.do")
public class CartListCtrl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("msg", "장바구니 목록을 출력합니다.");

        HttpSession session = request.getSession();
        String cid = (String) session.getAttribute("sid");

        CartDAO dao = new CartDAO();
        List<CartVO> cartList = dao.getByIdCartList(cid);

        request.setAttribute("cartList", cartList);
        RequestDispatcher view = request.getRequestDispatcher("/cart/cartList.jsp");
        view.forward(request, response);
    }
}
