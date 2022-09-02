package qna;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.Constants;
import items.Pager;
import qna.dao.QnaDAO;
import qna.dto.QnaCommentDTO;
import qna.dto.QnaDTO;

@WebServlet("/qna_servlet/*")
public class qnaController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String url=request.getRequestURL().toString();
		String contextPath=request.getContextPath();
		QnaDAO dao = new QnaDAO();
		
		if(url.indexOf("qnalist.do") != -1) {
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
			
			List<QnaDTO> list=dao.list(start,end);
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			//페이지 네비게이션 출력을 위한 정보 전달
			request.setAttribute("page", pager);
			
			String page="/myweb/qna_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("qnacategory.do") != -1){
			String category = request.getParameter("category");
			System.out.println("category: "+category);
			List<QnaDTO> list = null;
			Pager pager = null;
			if(category.equals("전체")) {
				int count=dao.count();
				//페이지 나누기를 위한 처리
				int curPage=1;
				//숫자 처리는 null포인트 익셉션이 잘 일어나기 때문에 if문 처리해주는게 좋다.
				if(request.getParameter("curPage") != null) {
					curPage=Integer.parseInt(request.getParameter("curPage"));
				}
				pager=new Pager(count, curPage);
				int start=pager.getPageBegin();
				int end=pager.getPageEnd();
				
				 list=dao.list(start,end);
			}else {
				int count=dao.categorycount(category);
				//페이지 나누기를 위한 처리
				int curPage=1;
				//숫자 처리는 null포인트 익셉션이 잘 일어나기 때문에 if문 처리해주는게 좋다.
				if(request.getParameter("curPage") != null) {
					curPage=Integer.parseInt(request.getParameter("curPage"));
				}
				pager=new Pager(count, curPage);
				int start=pager.getPageBegin();
				int end=pager.getPageEnd();
				list=dao.categorylist(start,end,category);
			}
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			request.setAttribute("category", category);
			//페이지 네비게이션 출력을 위한 정보 전달
			request.setAttribute("page", pager);
			String page="/myweb/qna_sub.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("write.do") != -1){
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			//request를 확장시킨 MultipartRequest 생성
			//new MultipartRequest(request,"업로드디렉토리",제한용량,"인코딩",파일명중복방지처리옵션)
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			String writer = multi.getParameter("writer");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String passwd = multi.getParameter("passwd");
			String category = multi.getParameter("category_option");
			String filename=" ";
			int filesize=0;
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음요소가 있으면
				while (files.hasMoreElements()) {
					String file1 = (String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			QnaDTO dto = new QnaDTO();
			dto.setWriter(writer);
			dto.setPasswd(passwd);
			dto.setCategory(category);
			dto.setContent(content);
			dto.setTitle(title);
			if(filename == null || filename.trim().equals("")) {
				filename=" ";
			}
			dto.setFilename(filename);
			dto.setFilesize(filesize);
			dao.insert(dto);
			//메시지출력
			 String msg = "문의 등록이 완료되었습니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/qna.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("view.do") != -1){
			int num=Integer.parseInt(request.getParameter("num"));
			HttpSession session=request.getSession();
			//조회수 증가 처리
			dao.plusReadCount(num, session);
			QnaDTO dto = dao.view(num);
			request.setAttribute("dto", dto);
			//페이지 이동
			String page="/myweb/qnaview.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("download.do") != -1){
			int num=Integer.parseInt(request.getParameter("num"));
			String filename=dao.getFileName(num);
			System.out.println("첨부파일 이름 : " + filename);
			//업로드되었던 파일의 위치정보값을 path에 저장
			String path=Constants.UPLOAD_PATH+filename;
			byte b[]=new byte[4096]; //바이트배열 생성
			//업로드 폴더에 저장된 파일을 읽기 위한 스트림 생성
			FileInputStream fis=new FileInputStream(path);
			//mimeType: (파일의 종류-img, mp3, txt..등)
			String mimeType=getServletContext().getMimeType(path);
			//스트림 방식의 파일 다운로드시 한글 파일명 관련 브라우저 헤더 처리
			if(mimeType==null) {
				mimeType="application/octet-stream;charset=utf-8";
			}
			filename = new String(filename.getBytes("utf-8"),"8859_1");
			response.setHeader("Content-Disposition", "attachment;filename="+filename);
			
			//OutputStream 생성(서버에서 클라이언트에 쓰기)
			ServletOutputStream out=response.getOutputStream();
			int numRead;
			while (true) {
				numRead = fis.read(b, 0, b.length);//데이터 읽음
				if(numRead == -1) break;//더 이상 내용이 없으면 빠져나감
				out.write(b, 0, numRead);//데이터 쓰기
		    }
		}else if(url.indexOf("passwdck.do") != -1){
			int num=Integer.parseInt(request.getParameter("num"));
			//입력한 비밀번호
			String passwd=request.getParameter("passwd");
			//비밀번호가 맞는지 확인
			System.out.println("num : "+num+", passwd: "+passwd);
			String result=dao.passwdCheck(num, passwd);
			String page="";
			if(result != null) {//비밀번호가 맞으면
				page="/myweb/qnaview.jsp";
				request.setAttribute("dto", dao.view(num));
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}else {//비밀번호가 틀리면
				//메시지출력
				 String msg = "비밀번호가 맞지 않습니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("url","myweb/qnapasswd.jsp?num="+num);
				//페이지 이동
				page="/myweb/alert.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
			}
		}else if(url.indexOf("qnacomment.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			System.out.println("댓글을 위한 게시물번호 : "+num);
			//댓글 목록 리턴
			List<QnaCommentDTO> list=dao.commentList(num);
			request.setAttribute("list", list);
			String page="/myweb/qnacomment_list.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("reply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			QnaDTO dto=dao.view(num);
			dto.setContent(dto.getContent()+"\n===================게시물 내용===================\n\n");
			request.setAttribute("dto", dto);
			String page="/myweb/qnareply.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("insertReply.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			QnaDTO dto=dao.view(num);
			int ref=dto.getRef(); //답변 그룹 번호
			int re_step=dto.getRe_step()+1; //출력순번(수정 +1)
			int re_level=dto.getRe_level()+1; //답변 단계(수정 +1)
			String writer=request.getParameter("writer");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			String category=request.getParameter("category");
			String passwd=request.getParameter("passwd");
			dto.setWriter(writer);
			dto.setCategory(category);
			dto.setTitle(title);
			dto.setContent(content);
			dto.setPasswd(passwd);
			dto.setRef(ref);
			dto.setRe_step(re_step);
			dto.setRe_level(re_level);
			//첨부파일 관련 정보
			dto.setFilename(" ");
			dto.setFilesize(0);
			dto.setDown(0);
			//답글 순서 조정
			dao.updateStep(ref, re_step);
			//답글 쓰기
			dao.reply(dto);
			//메시지출력
			 String msg = "답변이 등록되었습니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/qna.jsp");
			//페이지 이동
			String page="/myweb/alert.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("modify.do") != -1) {
			int num=Integer.parseInt(request.getParameter("num"));
			request.setAttribute("dto", dao.view(num));
			String page="/myweb/qnaedit.jsp";
			RequestDispatcher rd=request.getRequestDispatcher(page);
			rd.forward(request, response);
		}else if(url.indexOf("updateQna.do") != -1) {
			File uploadDir=new File(Constants.UPLOAD_PATH);
			if(!uploadDir.exists()) {//업로드디렉토리가 존재하지 않으면
				uploadDir.mkdir();//디렉토리를 만듦
			}
			//request를 확장시킨 MultipartRequest 생성
			//new MultipartRequest(request,"업로드디렉토리",제한용량,"인코딩",파일명중복방지처리옵션)
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			
			int num=Integer.parseInt(multi.getParameter("num"));
			System.out.println("num : "+num);
			String writer = multi.getParameter("writer");
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String passwd = multi.getParameter("passwd");
			String category = multi.getParameter("category");
			String filename=" ";
			int filesize=0;
			try {
				//첨부파일의 집합
				Enumeration files=multi.getFileNames();
				//다음요소가 있으면
				while (files.hasMoreElements()) {
					String file1 = (String)files.nextElement();
					filename=multi.getFilesystemName(file1);
					File f1=multi.getFile(file1);
					if(f1 != null) {
						filesize=(int)f1.length();//파일 사이즈 저장
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			QnaDTO dto = new QnaDTO();
			dto.setNum(num);
			dto.setWriter(writer);
			dto.setPasswd(passwd);
			dto.setCategory(category);
			dto.setContent(content);
			dto.setTitle(title);
			if(filename == null || filename.trim().equals("")) {
				//새로운 첨부파일이 없을 때(테이블의 기존정보를 가져옴)
				QnaDTO dto2=dao.view(num);
				String fName=dto2.getFilename();
				int fSize=dto2.getFilesize();
				int fDown=dto2.getDown();
				dto.setFilename(fName);
				dto.setFilesize(fSize);
				dto.setDown(fDown);
			}else {//새로운 첨부파일이 있을 때
				dto.setFilename(filename);
				dto.setFilesize(filesize);
			}
			
			//첨부파일 삭제 처리
			String fileDel = multi.getParameter("fileDel");
			//체크박스에 체크되어있으면, value없이 썼기 때문에 on이 디폴트가 됨
			if(fileDel != null && fileDel.equals("on")) {
				String fileName=dao.getFileName(num);
				File f=new File(Constants.UPLOAD_PATH+fileName);
				f.delete();//파일 삭제
				//첨부파일 정보를 지움
				dto.setFilename(" ");
				dto.setFilesize(0);
				dto.setDown(0);
			}
			System.out.println(dto.toString());
			//레코드 수정
			dao.update(dto);
			 String msg = "수정완료되었습니다.";
				request.setAttribute("msg", msg);
				request.setAttribute("url","qna_servlet/passwdck.do?num="+num+"&passwd="+passwd);
				//페이지 이동
				String page="/myweb/alert.jsp";
				RequestDispatcher rd=request.getRequestDispatcher(page);
				rd.forward(request, response);
		}else if(url.indexOf("deleteQna.do") != -1) {
			MultipartRequest multi=new MultipartRequest(request, Constants.UPLOAD_PATH, 
					Constants.MAX_UPLOAD, "utf-8", new DefaultFileRenamePolicy());
			//삭제할 게시물 번호
			int num=Integer.parseInt(multi.getParameter("num"));
			dao.delete(num);
			String msg = "삭제가 완료되었습니다.";
			request.setAttribute("msg", msg);
			request.setAttribute("url","myweb/qna.jsp");
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
