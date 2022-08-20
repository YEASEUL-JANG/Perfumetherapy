package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/user_servlet/*")
public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String uri=request.getRequestURI();
		userDAO dao = new userDAO();
		String context = request.getContextPath();
		System.out.println(uri);
		//가입
		if(uri.indexOf("join.do") != -1 ){
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String uname = request.getParameter("uname");
			String gender = request.getParameter("gender");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			userDTO dto = new userDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setUname(uname);
			dto.setGender(gender);
			dto.setAddress(address);
			dto.setPhone(phone);
			dto.setEmail(email);
			System.out.println(dto.toString());
			dao.insertuser(dto);
			request.setAttribute("dto", dto);
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			//메시지 출력
			String msg = "가입이 완료되었습니다. 환영합니다!";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/welcome.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("idcheck.do") != -1 ) {
			String id = request.getParameter("id");
			System.out.println(id);
			int checknum = dao.idCheck(id);
			request.setAttribute("result", checknum);
			String page="/myweb/idresult.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("login.do") != -1 ) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			userDTO dto = new userDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String name = dao.userlogin(dto);
			//세션저장
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			//메시지 출력
			String msg = name+"님 환영합니다!";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/index.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("logout.do") != -1 ) {
			HttpSession session = request.getSession();
			session.invalidate();
			//메시지 출력
			String msg = "로그아웃 되셨습니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/index.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("searchId.do") != -1 ) {
			String uname = request.getParameter("uname");
			String email = request.getParameter("email");
			System.out.println("이름 : "+uname+", 이메일 : "+email);
			userDTO dto = new userDTO();
			dto.setUname(uname);
			dto.setEmail(email);
			String userid = dao.searchId(dto);
			if(userid != null) {
				String msg = "가입하신 아이디는 ["+userid+"] 입니다.";
				request.setAttribute("msg", msg);
			}else {
				String msg = "해당정보로 가입된 내용을 찾을 수 없습니다.";
				request.setAttribute("msg", msg);
			}
			request.setAttribute("url","myweb/login.jsp");
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("searchPasswd.do") != -1 ) {
			String uname = request.getParameter("uname");
			String userid = request.getParameter("userid");
			System.out.println("이름 : "+uname+", 아이디 : "+userid);
			userDTO dto = new userDTO();
			dto.setUname(uname);
			dto.setUserid(userid);
			String passwd = dao.searchPasswd(dto);
			if(passwd != null) {
				String msg = uname+"님의 비밀번호는 ["+passwd+"] 입니다.";
				request.setAttribute("msg", msg);
			}else {
				String msg = "해당정보로 가입된 내용을 찾을 수 없습니다.";
				request.setAttribute("msg", msg);
			}
			request.setAttribute("url","myweb/login.jsp");
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("kakaoLogin.do") != -1 ) {
			String uname = request.getParameter("k_uname");//필수값
			String email = request.getParameter("k_email");//선택값
			String gender = request.getParameter("k_gender");//선택값
			System.out.println("uname : "+uname+" email: "+email+"gender : "+gender);
			
			//세션저장
			HttpSession session = request.getSession();
			session.setAttribute("userid", email);
			//메시지 출력
			String msg = uname+"님 환영합니다!";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/index.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(uri.indexOf("naverLogin.do") != -1 ) {
			String uname = request.getParameter("name");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			System.out.println("uname : "+uname+" email: "+email+"gender : "+gender);
			if(uname == null && email == null) {
				String msg = "네이버 로그인이 처리되지 않습니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("url","myweb/login.jsp");
				String page="/myweb/alert.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {
			//세션저장
			HttpSession session = request.getSession();
			session.setAttribute("userid", email);
			}
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
