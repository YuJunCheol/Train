<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=request.getContextPath() %><br>
<%=request.getRequestURI() %>
<table border="1">
	<tr>
		<td>학생번호</td>
		<td>학생명</td>
		<td>아이디</td>
	</tr>
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	conn = DriverManager.getConnection("jdbc:apache:commons:dbcp:aidb");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from student");
	while (rs.next()) {
%>
	<tr>
		<td><%=rs.getInt("studno") %></td>
		<td><%=rs.getString("name") %></td>
		<td><%=rs.getString("id") %></td>
	</tr>
<%
	}
} catch (Exception e) {
	System.out.println(e.toString());
} finally {
	try {rs.close();} catch(Exception e){}
	try {stmt.close();} catch(Exception e){}
	try {conn.close();} catch(Exception e){}
}
%>
</table>
<input type="date">
</body>
</html>