<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.*"%>
<%
request.setCharacterEncoding("utf-8");
/*
학생번호 중복체크
아이디 중복체크
학생번호도 아이디도 중복이 아니면 insert
*/

// 파라미터 값 받기
int studno = Integer.parseInt(request.getParameter("studno"));
String id = request.getParameter("id");
String name = request.getParameter("name");
int grade = Integer.parseInt(request.getParameter("grade"));
String jumin = request.getParameter("jumin");
String tel = request.getParameter("tel");

StudentDAO dao = new StudentDAO();
// 학생번호 중복체크
if (dao.isDuplicateStudno(studno)) {
	// 학생번호 중복
%>
	학생번호가 중복되었습니다. <a href="write.jsp">이전페이지로 돌아가기</a>
<%
} else if (dao.isDuplicateId(id)) {
	// 아이디 중복
%>
	아이디가 중복되었습니다. <a href="write.jsp">이전페이지로 돌아가기</a>
<%
} else {
	StudentVO vo = new StudentVO();
	vo.setStudno(studno);
	vo.setId(id);
	vo.setName(name);
	vo.setGrade(grade);
	vo.setJumin(jumin);
	vo.setTel(tel);
	int r = dao.insert(vo);
	if (r > 0) { // 정상등록
%>
	학생정보가 정상적으로 등록되었습니다. <a href="index.jsp">목록</a>
<%		
	} else { // 등록실패
%>
	학생정보 등록 실패! <a href="write.jsp">이전 페이지로 돌아가기</a>
<%
	}
}
%>
