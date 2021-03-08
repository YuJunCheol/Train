package student;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StudentList extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws IOException, ServletException {
		// 사용자 요청 확인
		String searchWord = req.getParameter("searchWord"); // 검색어
		String searchGrade = req.getParameter("searchGrade"); // 학년
		
		// 로직
		StudentDAO dao = new StudentDAO();
		List<StudentVO> list = dao.selectList(searchWord, searchGrade);
		
		// 저장
		req.setAttribute("studentList", list);
		
		// jsp 포워딩
		//RequestDispatcher rd = req.getRequestDispatcher("/student/index.jsp");
		RequestDispatcher rd = req.getRequestDispatcher("/student/index_jstl.jsp");
		rd.forward(req, res);
		
	}
}
