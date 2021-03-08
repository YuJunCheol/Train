<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.*" %>
<%@ page import="java.util.*" %>
<%
/*
StudentDAO 객체 생성
selectList() 메서드 호출
메서드 결과(ArrayList)를 받아서 출력
*/
StudentDAO dao = new StudentDAO(); // 객체 생성
List<StudentVO> studentList = dao.selectList(request.getParameter("searchWord")); // 메서드 호출 결과를 변수에 대입
dao.close(); // 자원 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
</head>
<body>
<form action="index.jsp">
<input type="text" name="searchWord" value="${param.searchWord }">
<input type="submit" value="검색">
</form>
<table border="1">
	<tr>
		<td>학생번호</td>
		<td>학생명</td>
		<td>아이디</td>
		<td>학년</td>
		<td>연락처</td>
	</tr>
<%
for (int i=0; i<studentList.size(); i++) {
	StudentVO svo = studentList.get(i);
%>	
	<tr>
		<td><%=svo.getStudno() %></td>
		<td><%=svo.getName() %></td>
		<td><a href="detail.jsp?studno=<%=svo.getStudno() %>"><%=svo.getId() %></a></td>
		<td><%=svo.getGrade() %>학년</td>
		<td><%=svo.getTel() %></td>
	</tr>
<%
}
%>	
</table>
<a href="write.jsp"><input type="button" value="등록"></a>













</body>
</html>