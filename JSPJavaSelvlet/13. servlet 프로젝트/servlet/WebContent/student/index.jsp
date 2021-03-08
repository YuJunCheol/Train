<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.*" %>
<%@ page import="java.util.*" %>
<%
List<StudentVO> studentList = (ArrayList<StudentVO>)request.getAttribute("studentList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
</head>
<body>
<form action="studentList.do">
<select name="searchGrade">
	<option value="">전체</option>
	<option value="1" <%="1".equals(request.getParameter("searchGrade")) ? "selected" : ""%>>1학년</option>
	<option value="2" <%="2".equals(request.getParameter("searchGrade")) ? "selected" : ""%>>2학년</option>
	<option value="3" <%="3".equals(request.getParameter("searchGrade")) ? "selected" : ""%>>3학년</option>
	<option value="4" <%="4".equals(request.getParameter("searchGrade")) ? "selected" : ""%>>4학년</option>
</select>
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