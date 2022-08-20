package config;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

//필터 : 요청에 앞서 처리되는 코드를 정의해놓음
//url패턴 : /* : 모든요청을 처리하겠다.
@WebFilter("/*")
public class EncodingFilter extends HttpFilter implements Filter {
       private String charset = "utf-8";
    
   
       //필터를 제거(서버가 멈출때 작동)
	public void destroy() {
		System.out.println("필터가 제거되었습니다.");
	}
	//요청이 들어올 때 실행됨
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("필터가 실행되었습니다.");
		request.setCharacterEncoding(charset);
		
		chain.doFilter(request, response);//전달됨
	}
	//필터 초기화(서버가 시작될 때)
	public void init(FilterConfig fConfig) throws ServletException {
	System.out.println("필터가 초기화 되었습니다.");
	}

}
