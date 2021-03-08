<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberVO" %>
<%
// 아이디가 hong이고, 비밀번호가 1234이면 "로그인되었습니다." MemberVO 객체 생성해서 session에 저장
// 그렇지 않으면 "아이디 비밀번호를 확인하세요"

String id = request.getParameter("id");
String password = request.getParameter("password");

if ("hong".equals(id) && "1234".equals(password)) {
	MemberVO mv = new MemberVO();
	mv.setId(id);
	mv.setName("홍길동");
	mv.setEmail("hong@gmail.com");
	// session에 저장
	session.setAttribute("member", mv);
	//out.println("<script>alert(\"로그인되었습니다.\");</script>");
	%>
	<script>
		alert("로그인되었습니다.");
		location.href='main.jsp';
	</script>
	<%
} else {
%>
	<script>
		alert('아이디 비밀번호를 확인하세요');
		location.href='index.jsp';
	</script>

<% } %>