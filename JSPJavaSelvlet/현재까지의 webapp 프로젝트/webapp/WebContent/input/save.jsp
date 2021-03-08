<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String school = request.getParameter("school");
String gender = request.getParameter("gender");
String[] hobby = request.getParameterValues("hobby");
%>
<%=id%><br>
<%=pwd%><br>
<%=school%><br>
<%="1".equals(gender) ? "남성" : "여성"%><br>
<%
if (hobby != null) {
	for (int i=0; i<hobby.length; i++) {
		out.println(hobby[i]);
	}
}
%><br>
