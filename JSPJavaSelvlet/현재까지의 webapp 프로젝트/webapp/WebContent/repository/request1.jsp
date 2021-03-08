<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// Controller
String name = "홍길동";

// request 객체에 저장
request.setAttribute("name", name);
request.setAttribute("name1", "김길동");
request.setAttribute("name2", "최길동");
request.setAttribute("name3", "박길동");
request.setAttribute("name4", "이길동");


// View
// request 객체에서 꺼내옴
String n = (String)request.getAttribute("name");

%>
<%=n%>
<%=request.getAttribute("name1")%>
<%=request.getAttribute("name2")%>
<%=request.getAttribute("name3")%>
<%=request.getAttribute("name4")%>