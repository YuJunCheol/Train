<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.*" %>
<%
request.setCharacterEncoding("utf-8");

String name = request.getParameter("name");
int grade = Integer.parseInt(request.getParameter("grade"));
String jumin = request.getParameter("jumin");
String tel = request.getParameter("tel");
int studno = Integer.parseInt(request.getParameter("studno"));

StudentVO vo = new StudentVO();
vo.setName(name);
vo.setGrade(grade);
vo.setJumin(jumin);
vo.setTel(tel);
vo.setStudno(studno);

StudentDAO dao = new StudentDAO();
int r = dao.update(vo);
%>
<% if (r > 0) { %>
<script>alert('정상적으로 수정되었습니다.');location.href='detail.jsp?studno=<%=studno%>';</script>
<% } else { %>
<script>alert('수정 에러');history.back();</script>
<% } %>