<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// session 객체에 저장
session.setAttribute("name", "홍길동");


// session 객체에서 가져옴
String n = (String)session.getAttribute("name");
%>
<%=n%>