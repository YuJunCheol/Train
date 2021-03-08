<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
안녕<br>
<%
String a = request.getParameter("a");
if (a == null) a = "0";
String b = request.getParameter("b");
if (b == null) b = "0";
int c = Integer.parseInt(a)+Integer.parseInt(b);
out.print(c);
%><br>
<%=request.getParameter("a") %>
<%=b %>
<%=c %>
</body>
</html>