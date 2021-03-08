package sample;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControllerSample extends HttpServlet {

	// 1. http 요청을 받음
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws IOException, ServletException {
		process(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws IOException, ServletException {
		process(req, res);
	}
	
	private void process(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		// 파라미터 type이 "a"이면 A등급, "b"이면 B등급, 그렇지 않으면 C등급

		// 2. 사용자가 어떤 처리 요청 확인
		String type = req.getParameter("type");
		String page = "/sample.jsp";
		
		// 3. 해당 비즈니스 로직을 처리(모델)
		String result = "";
		if ("a".equals(type)) {
			result = "A등급";
		} else if ("b".equals(type)) {
			result = "B등급";
			page = "/sampleb.jsp";
		} else {
			result = "C등급";
		}
		
		// 4. request,session 에 저장
		req.setAttribute("result", result);
		
		// 5. 뷰(jsp)로 포워딩
		RequestDispatcher rd = req.getRequestDispatcher(page);
		rd.forward(req, res);
	}
}
