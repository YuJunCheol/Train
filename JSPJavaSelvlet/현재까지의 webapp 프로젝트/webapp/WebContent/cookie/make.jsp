<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 쿠키 객체 생성
Cookie cookie = new Cookie("id", "hong");
Cookie cookie2 = new Cookie("email", "hong@gmail.com");
//cookie.setMaxAge(expiry) 유효시간(초) 60*60*24*365 : 1년
// response 객체 추가
response.addCookie(cookie);
response.addCookie(cookie2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=cookie.getName() %> : <%=cookie.getValue() %><br>
<%=cookie2.getName() %> : <%=cookie2.getValue() %>
</body>
</html>