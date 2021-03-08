package mvc.test;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;

public class TestHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("TestHandler process");
		req.setAttribute("hello", "안녕하세요?");
		return "/WEB-INF/view/test.jsp";
	}

}
