package sample;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// html 출력
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>Hello</title></head>");
		out.println("<body>HelloServlet</body>");
		out.println("</html>");
	}
	
}
