<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test.Calculator" %>
<%!
public int multiply(int a, int b) {
	return a*b;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Calculator cal = new Calculator();
out.print(cal.add(1, 2));
%>
<%=cal.add(1,2) %>
<br>
<%
/*
for (int i=2; i<=9; i++) {
	for (int j=1; j<=9; j++) {
		out.println(i + " * " + j + " = " + (i*j) + "<br>");
	}
}
*/
%>
<%=cal.gugu() %><br>
<%=multiply(2,3) %>
</body>
</html>