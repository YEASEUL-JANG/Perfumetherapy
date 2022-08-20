package order;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import items.itemsDAO;
import items.itemsDTO;
import order.dao.OrderDAO;
import order.dto.CartDTO;
import order.dto.OrderDTO;

@WebServlet("/order_servlet/*")
public class orderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri=request.getRequestURI();
		OrderDAO dao = new OrderDAO();
		String context = request.getContextPath();
		System.out.println(uri);
		//가입
		if(uri.indexOf("mypage.do") != -1 ){
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			System.out.println("userid : "+userid);
			int status1 = dao.deliverStatus1(userid);
			int status2 = dao.deliverStatus2(userid);
			int status3 = dao.deliverStatus3(userid);
			System.out.println("상품준비중 : "+status1+",배송중: "+status2+"배송완료 : "+status3);
			request.setAttribute("status1", status1);
			request.setAttribute("status2", status2);
			request.setAttribute("status3", status3);
			String page="/myweb/mypage.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("orderlist.do") != -1 ){
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			System.out.println("userid : "+userid);
			List<OrderDTO> list = dao.orderlist(userid);
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			String page="/myweb/orderlist_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("cancellist.do") != -1 ){
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			System.out.println("userid : "+userid);
			List<OrderDTO> list = dao.cancellist(userid);
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			String page="/myweb/orderlist_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("return.do") != -1 ){
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			System.out.println("userid : "+userid);
			List<OrderDTO> list = dao.returnlist(userid);
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			String page="/myweb/orderlist_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("addcart.do") != -1 ){
			int idx = Integer.parseInt(request.getParameter("idx"));
			int num = Integer.parseInt(request.getParameter("num"));
			String answer = request.getParameter("yesorno");
			System.out.println("idx : "+idx+", num : "+num+", yesorno : "+answer);
			if(answer.equals("yes")) {//장바구니 이동
				dao.addcartItem(idx);
				dao.addcartid(num, idx);
				response.sendRedirect(request.getContextPath()+"/myweb/cart.jsp");
			}else {//페이지 유지
				dao.addcartItem(idx);
				dao.addcartid(num, idx);
				response.sendRedirect(request.getContextPath()+"/myweb/detail.jsp?idx="+idx);
			}
		}else if(uri.indexOf("cartview.do") != -1 ){
			List<CartDTO> list=dao.cartview();
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			String page="/myweb/cart_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("cartnumUp.do") != -1 ){
			int idx = Integer.parseInt(request.getParameter("idx"));
			dao.updatenumUp(idx);
			List<CartDTO> list=dao.cartview();
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			String page="/myweb/cart_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("cartnumDown.do") != -1 ){
			int idx = Integer.parseInt(request.getParameter("idx"));
			dao.updatenumDown(idx);
			List<CartDTO> list=dao.cartview();
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			String page="/myweb/cart_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
