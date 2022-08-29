package user;

import java.io.IOException;
import java.util.List;

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
			String postcode = request.getParameter("postcode");
			String detailaddress = request.getParameter("detailAddress");
			String extraaddress = request.getParameter("extraAddress");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			userDTO dto = new userDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			dto.setUname(uname);
			dto.setGender(gender);
			dto.setAddress(address);
			dto.setPostcode(postcode);
			dto.setDetailaddress(detailaddress);
			dto.setExtraaddress(extraaddress);
			dto.setPhone(phone);
			dto.setEmail(email);
			System.out.println(dto.toString());
			dao.insertuser(dto);
			request.setAttribute("dto", dto);
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			//페이지 이동
			String page="/myweb/welcome.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		//아이디찾기
		}else if(uri.indexOf("idcheck.do") != -1 ) {
			String id = request.getParameter("id");
			System.out.println(id);
			int checknum = dao.idCheck(id);
			request.setAttribute("result", checknum);
			String page="/myweb/idresult.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
			
		//로그인
		}else if(uri.indexOf("login.do") != -1 ) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			userDTO dto = new userDTO();
			dto.setUserid(userid);
			dto.setPasswd(passwd);
			String name = dao.userlogin(dto);
			if(name == null) {
				String msg = "해당 아이디로 가입된 이력이 없습니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("url","myweb/login.jsp");
				//페이지 이동
				String page="/myweb/alert.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {
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
			}
		//로그아웃	
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
		//아이디찾기	
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
		//비밀번호 찾기	
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
		//카카오로그인	
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
		//네이버로그인	
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
		
		}else if(uri.indexOf("passwdck.do") != -1 ) {
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			String userpasswd = request.getParameter("passwd");
			System.out.println("userid : "+userid+", 들어온 passwd : "+userpasswd);
			int result = dao.passwdcheck(userid,userpasswd);
			System.out.println("비밀번호 맞으면 1, 아니면 0의 결과값 : "+result);
			if(result != 0) {//비밀번호가 맞음
				//회원정보 불러오기
				userDTO dto = dao.getuser(userid);
				request.setAttribute("dto", dto);
				//페이지 이동
				String page="/myweb/reviseme.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {//비밀번호가 다름
				String msg = "비밀번호가 맞지 않습니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("url","myweb/revise.jsp");
				String page="/myweb/alert.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}else if(uri.indexOf("reviseme.do") != -1 ) {
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String uname = request.getParameter("uname");
			String postcode = request.getParameter("postcode");
			String detailaddress = request.getParameter("detailAddress");
			String extraaddress = request.getParameter("extraAddress");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			String email = request.getParameter("email");
			userDTO dto = new userDTO();
			dto.setUserid(userid);
			dto.setUname(uname);
			dto.setAddress(address);
			dto.setPostcode(postcode);
			dto.setDetailaddress(detailaddress);
			dto.setExtraaddress(extraaddress);
			dto.setPhone(phone);
			dto.setEmail(email);
			if(passwd != "") {//비번이 변경되었을 때 
				dto.setPasswd(passwd);
				dao.updatepasswd(dto);
			}else {
				dao.updateme(dto);
			}
			request.setAttribute("dto", dto);
			String message = "수정이 완료되었습니다.";
			request.setAttribute("message", message);
			//페이지 이동
			String page="/myweb/reviseme.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response); 
		}else if(uri.indexOf("withdraw.do") != -1 ) {
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("userid");
			dao.withdraw(userid);
			session.invalidate();
			//메시지 출력
			String msg = "탈퇴가 정상적으로 처리되었습니다. 감사합니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/index.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

}
