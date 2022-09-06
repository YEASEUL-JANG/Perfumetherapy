package order;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import items.Pager;
import items.wishDTO;
import order.dao.OrderDAO;
import order.dto.CartDTO;
import order.dto.OrderDTO;
import order.dto.OrderdetailDTO;
import user.userDTO;

@WebServlet("/order_servlet/*")
public class orderController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri=request.getRequestURI();
		OrderDAO dao = new OrderDAO();
		String context = request.getContextPath();
		System.out.println(uri);
		
		//마이페이지
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
			String page="/myweb/mypage_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		//주문내역 조회	
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
			
		//주문취소내역조회
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
			
		//반품내역조회
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
			
		//아이템페이지에서 장바구니 추가
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
			
		//장바구니 페이지	
		}else if(uri.indexOf("cartview.do") != -1 ){
			List<CartDTO> list=dao.cartview();
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			String page="/myweb/cart_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		//카트아이템 수량+1	
		}else if(uri.indexOf("cartnumUp.do") != -1 ){
			int idx = Integer.parseInt(request.getParameter("idx"));
			dao.updatenumUp(idx);
			List<CartDTO> list=dao.cartview();
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			String page="/myweb/cart_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		//카트아이템 수량 -1
		}else if(uri.indexOf("cartnumDown.do") != -1 ){
			int idx = Integer.parseInt(request.getParameter("idx"));
			dao.updatenumDown(idx);
			List<CartDTO> list=dao.cartview();
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			String page="/myweb/cart_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		
			//카트아이템 삭제	
		}else if(uri.indexOf("deletecart.do") != -1 ){
			int cartid = Integer.parseInt(request.getParameter("chbox"));
			System.out.println("cartid : "+cartid);
			dao.deleteCart(cartid);
			
		//카트상품 주문하기
		}else if(uri.indexOf("order.do") != -1 ){
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			if(userid == null) {//세션아이디가 없을때
				request.setAttribute("data",0);
				String page="/myweb/orderresult.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else{//세션아이디가 있을 때
				String[] chArr = request.getParameterValues("chk");//카트아이디(배열)
				 int total_price = Integer.parseInt(request.getParameter("t_price"));//총주문금액
				 System.out.println("tot_price: "+total_price);
				//주문번호 생성
				Date date = new Date();
				SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
				String o_date = today.format(date);
				int seq_key = dao.order_seq();
				String trade_code = o_date+"-"+seq_key;
				System.out.println("주문번호 : "+trade_code);
				//주문테이블 추가
				dao.addorderList(trade_code, userid, total_price);
				int cartid = 0;
				for(String i : chArr) {
					cartid = Integer.parseInt(i);
					System.out.println(cartid);
					//주문상세테이블에 카트상품 추가
					dao.addDetailorder(trade_code, userid,cartid); 
					dao.updateDetailorder(trade_code, cartid);
					System.out.println("cartid : "+cartid+", 주문번호 : "+trade_code+" 추가 완료");
					//장바구니 비우기
					dao.deleteCart(cartid);
				}
				request.setAttribute("data",trade_code);
				String page="/myweb/orderresult.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		//주문 폼 이동	
		}else if(uri.indexOf("orderform.do") != -1 ){
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			String orderid = request.getParameter("orderid");
			List<OrderdetailDTO> list = dao.orderdetail(userid,orderid);
			userDTO dto = dao.getuser(userid);
			request.setAttribute("list", list);
			request.setAttribute("dto", dto);
			String page="/myweb/orderform_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		//카트 갯수확인
		}else if(uri.indexOf("cartnum.do") != -1 ){
			List<CartDTO> list=dao.cartview();
			request.setAttribute("num", list.size());
			String page="/myweb/cart_num.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		
		//주문취소
		}else if(uri.indexOf("cancel.do") != -1 ){
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			String orderid = request.getParameter("orderid");
			System.out.println("userid : "+userid+", orderid : "+orderid);
			//다시 장바구니 넣기
			 dao.addcartagain(orderid);
			
			//주문내역 삭제
			 dao.deleteorder(userid,orderid); 
			
			//메시지출력
			 String msg = "장바구니로 이동합니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/cart.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(uri.indexOf("modalview.do") != -1 ){
			String orderid = request.getParameter("orderid");
			System.out.println(orderid);
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			List<OrderdetailDTO> list = dao.viewdetailorder(userid,orderid);
			request.setAttribute("list", list);
			request.setAttribute("orderid", orderid);
			String page="/myweb/orderlist_sub2.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response); 
		
		//주문취소 신청
		}else if(uri.indexOf("withdrawal.do") != -1 ){
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			String orderid = request.getParameter("orderid");
			System.out.println("userid : "+userid+", orderid : "+orderid);
			
			//주문상태 업데이트
			 dao.withdrawalorder(userid,orderid); 
			 
			//메시지출력
			 String msg = "주문취소 신청이 완료되었습니다..";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/orderlist.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
	    // 반품요청
		}else if(uri.indexOf("takeback.do") != -1 ){
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			String orderid = request.getParameter("orderid");
			System.out.println("userid : "+userid+", orderid : "+orderid);
			
			//주문상태 업데이트
			 dao.takebackorder(userid,orderid); 
			 
			//메시지출력
			 String msg = "반품요청이 완료되었습니다..";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/orderlist.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response); 
		//개별구매(찜목록)
		}else if(uri.indexOf("wishpurchase.do") != -1 ){
			int cartid = Integer.parseInt(request.getParameter("cartid"));
			System.out.println("들어온 cartid : "+cartid);
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			if(userid == null) {//세션아이디가 없을때
				request.setAttribute("data",0);
				String page="/myweb/orderresult.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else{//세션아이디가 있을 때
				//관심상품의 갯수
				wishDTO dto = dao.getwish(cartid);
				int num = dto.getNum();
				int sale_price = dto.getSale_price();
				int total_price = num*sale_price;
				System.out.println("num : "+num+" * price : "+sale_price+" = totalprice:"+total_price);
				//주문번호 생성
				Date date = new Date();
				SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
				String o_date = today.format(date);
				int seq_key = dao.order_seq();
				String trade_code = o_date+"-"+seq_key;
				System.out.println("주문번호 : "+trade_code);
				//주문테이블 추가
				dao.addorderList(trade_code, userid, total_price);
				//주문상세테이블에 카트상품 추가
				dao.addDetailorder(trade_code, userid,cartid);  
				dao.updateDetailwish(trade_code, cartid);
				System.out.println("likeid : "+cartid+", 주문번호 : "+trade_code+" 추가 완료");
				//장바구니 비우기
				dao.deleteWish(cartid);
				//주문페이지로 이동
				request.setAttribute("data",trade_code);
				String page="/myweb/orderresult.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		//찜목록에서 장바구니 추가
		}else if(uri.indexOf("pluscart.do") != -1 ){
			int cartid = Integer.parseInt(request.getParameter("cartid"));
			System.out.println("들어온 cartid : "+cartid);
			dao.wishaddcart(cartid);
			
		//찜목록에서 삭제
		}else if(uri.indexOf("deletelike.do") != -1 ){
			int cartid = Integer.parseInt(request.getParameter("cartid"));
			System.out.println("들어온 cartid : "+cartid);
			dao.deleteWish(cartid);
			
		//개별구매(장바구니)
		}else if(uri.indexOf("cartpurchase.do") != -1 ){
			int cartid = Integer.parseInt(request.getParameter("cartid"));
			System.out.println("들어온 cartid : "+cartid);
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			if(userid == null) {//세션아이디가 없을때
				request.setAttribute("data",0);
				String page="/myweb/orderresult.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else{//세션아이디가 있을 때
				//관심상품의 갯수
				CartDTO dto = dao.getcart(cartid);
				int num = dto.getNum();
				int sale_price = dto.getSale_price();
				int total_price = num*sale_price;
				System.out.println("num : "+num+" * price : "+sale_price+" = totalprice:"+total_price);
				//주문번호 생성
				Date date = new Date();
				SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
				String o_date = today.format(date);
				int seq_key = dao.order_seq();
				String trade_code = o_date+"-"+seq_key;
				System.out.println("주문번호 : "+trade_code);
				//주문테이블 추가
				dao.addorderList(trade_code, userid, total_price);
				//주문상세테이블에 카트상품 추가
				dao.addDetailorder(trade_code, userid,cartid);  
				dao.updateDetailorder(trade_code, cartid);
				System.out.println("likeid : "+cartid+", 주문번호 : "+trade_code+" 추가 완료");
				//장바구니 비우기
				dao.deleteCart(cartid);
				//주문페이지로 이동
				request.setAttribute("data",trade_code);
				String page="/myweb/orderresult.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		//장바구니 비우기
		}else if(uri.indexOf("deleteallcart.do") != -1 ){
			dao.deleteAllcart();
		
		//찜목록에서 선택상품 구매
		}else if(uri.indexOf("wishselect.do") != -1 ){
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			if(userid == null) {//세션아이디가 없을때
				request.setAttribute("data",0);
				String page="/myweb/orderresult.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else{//세션아이디가 있을 때
				String[] chArr = request.getParameterValues("chk");//카트아이디(배열)
				 int total_price = Integer.parseInt(request.getParameter("t_price"));//총주문금액
				 System.out.println("tot_price: "+total_price);
				//주문번호 생성
				Date date = new Date();
				SimpleDateFormat today = new SimpleDateFormat("yyyyMMdd");
				String o_date = today.format(date);
				int seq_key = dao.order_seq();
				String trade_code = o_date+"-"+seq_key;
				System.out.println("주문번호 : "+trade_code);
				//주문테이블 추가
				dao.addorderList(trade_code, userid, total_price);
				int cartid = 0;
				for(String i : chArr) {
					cartid = Integer.parseInt(i);
					System.out.println(cartid);
					//주문상세테이블에 카트상품 추가
					dao.addDetailorder(trade_code, userid,cartid); 
					dao.updateDetailwish(trade_code, cartid);
					System.out.println("cartid : "+cartid+", 주문번호 : "+trade_code+" 추가 완료");
					//찜목록 비우기
					dao.deleteWish(cartid);
				  }
				request.setAttribute("data",trade_code);
				String page="/myweb/orderresult.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}else if(uri.indexOf("deleteAllwish.do") != -1 ){
			dao.deleteAllwish();
		}else if(uri.indexOf("adminOrder.do") != -1 ){
			//레코드 갯수 계산
			int count=dao.count();
			//페이지 나누기를 위한 처리
			int curPage=1;
			//숫자 처리는 null포인트 익셉션이 잘 일어나기 때문에 if문 처리해주는게 좋다.
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();

			List<OrderDTO> list = dao.allorder(start,end);
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			request.setAttribute("page", pager);
			String page="/myweb/admin_allorderlist.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("adminDetailOrder.do") != -1 ){
			String orderid = request.getParameter("orderid");
			System.out.println(orderid);
			List<OrderdetailDTO> list = dao.admindetailorder(orderid);
			request.setAttribute("list", list);
			request.setAttribute("orderid", orderid);
			String page="/myweb/admin_detailorder.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response); 
		}else if(uri.indexOf("changeState.do") != -1 ){
			String orderid = request.getParameter("orderid");
			String delivery = request.getParameter("delivery");
			System.out.println("orderid : "+orderid+ ", delivery: "+delivery);
			dao.changeState(orderid,delivery);
		}else if(uri.indexOf("adminOrderBack.do") != -1 ){
			//레코드 갯수 계산
			int count=dao.backcount();
			//페이지 나누기를 위한 처리
			int curPage=1;
			//숫자 처리는 null포인트 익셉션이 잘 일어나기 때문에 if문 처리해주는게 좋다.
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();

			List<OrderDTO> list = dao.orderback(start,end);
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			request.setAttribute("page", pager);
			String page="/myweb/admin_allorderlist.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("adminOrderReturn.do") != -1 ){
			//레코드 갯수 계산
			int count=dao.returncount();
			//페이지 나누기를 위한 처리
			int curPage=1;
			//숫자 처리는 null포인트 익셉션이 잘 일어나기 때문에 if문 처리해주는게 좋다.
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();

			List<OrderDTO> list = dao.orderreturn(start,end);
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			request.setAttribute("page", pager);
			String page="/myweb/admin_allorderlist.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
			
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
