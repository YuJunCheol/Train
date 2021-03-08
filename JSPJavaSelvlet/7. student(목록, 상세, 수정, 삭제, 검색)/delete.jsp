<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.StudentDAO" %>
<%
StudentDAO dao = new StudentDAO();
//dao.delete(Integer.parseInt(request.getParameter("studno")));
String studno = request.getParameter("studno");
int studno_int = Integer.parseInt(studno);
int r = dao.delete(studno_int);

// 리다이렉트
response.sendRedirect("index.jsp");
out.println(r);
%>
<% if (r > 0) { %>
정상적으로 삭제되었습니다.<a href="index.jsp">목록페이지로 이동</a>
<% } else { %>
삭제 실패
<% } %>