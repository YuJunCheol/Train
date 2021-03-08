package sample;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 어노테이션 방식으로 매핑
@WebServlet({"/hello2.do","/hello3.do"})
public class HelloServlet2 extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		response.setContentType("text/html;charset=utf-8");
		
		// html 출력
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Hello</title></head>");
		out.println("<body>"+request.getParameter("name")+"님 안녕하세요</body>");
		out.println("</html>");
	}
	
}
