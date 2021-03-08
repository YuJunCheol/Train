<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 헤더 include -->
<%
String name = "홍길동";
%>
<jsp:include page="header.jsp">
	<jsp:param name="n" value="<%=name %>"/>
</jsp:include>
<br>
여기는 하단
</body>
</html>