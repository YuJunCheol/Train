<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
여기는 a.jsp
<%
request.setAttribute("name", "홍길동");
%>
<jsp:forward page="b.jsp"/>
</body>
</html>