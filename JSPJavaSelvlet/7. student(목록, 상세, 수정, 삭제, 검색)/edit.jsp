<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.StudentDAO" %>
<%@ page import="student.StudentVO" %>
<%
/*
studno 파라미터를 받아서
selectOne() 메서드에 매개변수로 넘겨주고
리턴값(StudentVO)을 받아서 출력
*/
String studno = request.getParameter("studno");
StudentDAO dao = new StudentDAO();
StudentVO vo = dao.selectOne(Integer.parseInt(studno));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="update.jsp" method="post">
<input type="hidden" name="studno" value="<%=vo.getStudno()%>">
<table border="1">
	<tr>
		<td>학생번호</td>
		<td>
			<%=vo.getStudno() %>
		</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
			<%=vo.getId()%>
		</td>
	</tr>
	<tr>
		<td>학생명</td>
		<td>
			<input type="text" name="name" value="<%=vo.getName()%>">
		</td>
	</tr>
	<tr>
		<td>학년</td>
		<td>
			<select name="grade">
				<option value="1" <% if (vo.getGrade() == 1) { %>selected<% } %>>1학년</option>
				<option value="2" <% if (vo.getGrade() == 2) { %>selected<% } %>>2학년</option>
				<option value="3" <% if (vo.getGrade() == 3) { %>selected<% } %>>3학년</option>
				<option value="4" <% if (vo.getGrade() == 4) { %>selected<% } %>>4학년</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td>
			<input type="text" name="jumin" value="<%=vo.getJumin() %>">
		</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>
			<input type="text" name="tel" value="<%=vo.getTel()%>">
		</td>
	</tr>
</table>
<input type="submit" value="저장">
</form>
</body>
</html>