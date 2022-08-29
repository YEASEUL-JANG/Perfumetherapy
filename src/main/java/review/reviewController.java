package review;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import items.Pager;
import review.dao.ReviewDAO;
import review.dto.ReviewDTO;

@WebServlet("/review_servlet/*")
public class reviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		ReviewDAO dao = new ReviewDAO();
		//리뷰작성
		if(url.indexOf("review.do") != -1) {
			//파일업로드 처리
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			//request를 확장시킨 MultipartRequest 생성
			//new MultipartRequest(request,"업로드디렉토리",제한용량,"인코딩",파일명중복방지처리옵션)
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			String age = multi.getParameter("age");
			String gender = multi.getParameter("gender");
			int idx = Integer.parseInt(multi.getParameter("p_idx"));
			int review_star = Integer.parseInt(multi.getParameter("reviewStar"));
			String title= multi.getParameter("title");
			String content = multi.getParameter("content");
			String image_file=" ";
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음요소가 있으면
				while (files.hasMoreElements()) {
					String file1 = (String)files.nextElement();
					image_file=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			ReviewDTO dto = new ReviewDTO();
			dto.setUserid(userid);
			dto.setAge(age);
			dto.setTitle(title);
			dto.setReview_star(review_star);
			dto.setContent(content);
			dto.setGender(gender);
			dto.setIdx(idx);
			//파일 첨부를 하지 않을 경우
			if(image_file == null || image_file.trim().equals("")) {
				image_file="-";
			}
			dto.setImage_file(image_file);
			dao.insert(dto);
			//메시지출력
			 String msg = "소중한 리뷰 감사합니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/board-list.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		}else if(url.indexOf("reviewlist.do") != -1) {
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			//레코드 갯수 계산
			int count=dao.count(userid);
			//페이지 나누기를 위한 처리
			int curPage=1;
			//숫자 처리는 null포인트 익셉션이 잘 일어나기 때문에 if문 처리해주는게 좋다.
			if(request.getParameter("curPage") != null) {
				curPage=Integer.parseInt(request.getParameter("curPage"));
			}
			Pager pager=new Pager(count, curPage);
			int start=pager.getPageBegin();
			int end=pager.getPageEnd();
			
			List<ReviewDTO> list=dao.list(start,end,userid);
			request.setAttribute("list", list);
			//페이지 네비게이션 출력을 위한 정보 전달
			request.setAttribute("page", pager);
			
			String page="/myweb/reviewlist_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("search.do") != -1) {
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			//검색옵션과 검색 키워드
			String keyword=request.getParameter("keyword");
			List<ReviewDTO> list=dao.searchList(keyword, userid);
			request.setAttribute("list", list);
			request.setAttribute("keyword", keyword);
			String page="/myweb/searched_review.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
