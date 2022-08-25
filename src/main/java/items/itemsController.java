package items;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import order.dto.CartDTO;




@WebServlet("/item_servlet/*")
public class itemsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri=request.getRequestURI();
		itemsDAO dao=new itemsDAO();
		System.out.println(uri);
		//상품 진열
		if(uri.indexOf("list.do") != -1 ){
			String category=request.getParameter("category");
			String big_category=request.getParameter("big_category");
			int count=0;
			if(category==null) category="all";
			  System.out.println("category: "+category+",big_category : "+big_category);
					if(category.equals("all")) {
			  		count=dao.listCount(big_category);
					}else {
					count = dao.listCatCount(category,big_category);
					}
					System.out.println("count : "+count);
					int curPage=1;
					if(request.getParameter("curPage") != null) {
						curPage = Integer.parseInt(request.getParameter("curPage"));
					}
					Pager pager=new Pager(count, curPage);
					int start=pager.getPageBegin();
					int end=pager.getPageEnd();
					List<itemsDTO> list=dao.listitem(start,end,category, big_category);
					request.setAttribute("list", list);
					request.setAttribute("page", pager);
					request.setAttribute("count", count);
					String page="/myweb/item_list.jsp";
					RequestDispatcher rd=request.getRequestDispatcher(page);
					rd.forward(request, response);
		//상품추가
		}else if(uri.indexOf("insert.do") != -1) {
			String iname = request.getParameter("iname");
			String picture = request.getParameter("picture");
			int o_price = Integer.parseInt(request.getParameter("o_price"));
			int sale_price = Integer.parseInt(request.getParameter("sale_price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			int point = Integer.parseInt(request.getParameter("point"));
			int volume = Integer.parseInt(request.getParameter("volume"));
			String big_category = request.getParameter("big_category");
			String category = request.getParameter("category");
			String brand = request.getParameter("brand");
			String memo = request.getParameter("memo");
			
			System.out.println("big_category:"+big_category);
			System.out.println("category:"+category);
			System.out.println("picture:"+picture);
			System.out.println("memo:"+memo);
			itemsDTO dto = new itemsDTO();
			dto.setIname(iname);
			dto.setO_price(o_price);
			dto.setPicture(picture);
			dto.setSale_price(sale_price);
			dto.setStock(stock);
			dto.setPoint(point);
			dto.setVolume(volume);
			dto.setBig_category(big_category);
			dto.setCategory(category);
			dto.setBrand(brand);
			dto.setMemo(memo);
			dao.insertItem(dto);
			String page="/myweb/admin.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
	  //상품테이블 조회
	  }else if(uri.indexOf("table.do") != -1) {
		  String searchkey=request.getParameter("searchkey");
		  String search=request.getParameter("search");
		  //초기값 설정
		  int count = 0;
		  if(searchkey==null) searchkey="iname";
		  if(search==null) search="";
		  System.out.println("searchkey: "+searchkey+",search: "+search);
				if(search=="") {
		  		count=dao.itemCount();
				}else {
				count = dao.searchCount(searchkey,search);
				}
				int curPage=1;
				if(request.getParameter("curPage") != null) {
					curPage = Integer.parseInt(request.getParameter("curPage"));
				}
				Pager pager=new Pager(count, curPage);
				int start=pager.getPageBegin();
				int end=pager.getPageEnd();
				List<itemsDTO> list=dao.itemTable(start,end,searchkey, search);
				request.setAttribute("list", list);
				request.setAttribute("page", pager);
				request.setAttribute("count", count);
				request.setAttribute("searchkey", searchkey);
				request.setAttribute("search", search);
				String page="/myweb/item_table.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
	  // 상품정보 조회
	  }else if(uri.indexOf("view.do") != -1) {
		   int idx = Integer.parseInt(request.getParameter("idx"));
		   System.out.println(idx);
		   itemsDTO dto = dao.viewItem(idx);
			request.setAttribute("dto", dto);
			String page = "/myweb/item_info.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
	  }else if(uri.indexOf("update.do") != -1) {
		    int idx = Integer.parseInt(request.getParameter("idx"));//히든값으로 받음
		    String iname = request.getParameter("iname");
			String picture = request.getParameter("picture");
			int o_price = Integer.parseInt(request.getParameter("o_price"));
			int sale_price = Integer.parseInt(request.getParameter("sale_price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			int point = Integer.parseInt(request.getParameter("point"));
			int volume = Integer.parseInt(request.getParameter("volume"));
			String big_category = request.getParameter("big_category");
			String category = request.getParameter("category");
			String brand = request.getParameter("brand");
			String memo = request.getParameter("memo");
			
			itemsDTO dto = new itemsDTO();
			dto.setIdx(idx);
			dto.setIname(iname);
			dto.setO_price(o_price);
			dto.setPicture(picture);
			dto.setSale_price(sale_price);
			dto.setStock(stock);
			dto.setPoint(point);
			dto.setVolume(volume);
			dto.setBig_category(big_category);
			dto.setCategory(category);
			dto.setBrand(brand);
			dto.setMemo(memo);
			dao.updateItem(dto);
			response.sendRedirect(request.getContextPath()+"/myweb/admin.jsp");
		}else if(uri.indexOf("delete.do") != -1) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			dao.deleteItem(idx);
			response.sendRedirect(request.getContextPath()+"/myweb/admin.jsp");
			
		}else if(uri.indexOf("detailItem.do") != -1) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			System.out.println("idx: "+idx);
			response.sendRedirect(request.getContextPath()+"/myweb/detail.jsp?idx="+idx);
			
		}else if(uri.indexOf("detail.do") != -1) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			System.out.println("idx: "+idx);
			itemsDTO dto = dao.viewItem(idx);
			request.setAttribute("item", dto);
			String page = "/myweb/item_detail.jsp"; 
			RequestDispatcher rd = request.getRequestDispatcher(page); 
			rd.forward(request, response);
		//관심상품에 추가
		}else if(uri.indexOf("likeit.do") != -1) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			System.out.println("idx: "+idx);
			dao.addlike(idx);
			dao.addlikeid(idx);
		//관심상품 리스트
		}else if(uri.indexOf("viewwish.do") != -1) {
			List<wishDTO> list=dao.wishview();
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			String page="/myweb/wishlist_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(uri.indexOf("likenumUp.do") != -1) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			dao.updatenumUp(idx);
			int num = dao.getnum(idx);
			request.setAttribute("num", num);
			String page="/myweb/wishlist_count.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(uri.indexOf("likenumDown.do") != -1) {
			int idx = Integer.parseInt(request.getParameter("idx"));
			dao.updatenumDown(idx);
			int num = dao.getnum(idx);
			request.setAttribute("num", num);
			String page="/myweb/wishlist_count.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
