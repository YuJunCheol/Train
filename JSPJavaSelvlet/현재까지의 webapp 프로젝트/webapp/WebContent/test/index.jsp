<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if (false) { %>
여기는 test폴더<br>
<% } %>
<%
String name = "홍길동";
out.print(name);
System.out.println(name);
%>
<%=name %><br>
Tue Oct 06 11:25:53 KST 2021<br>
<%=new Date() %>
</body>
</html>