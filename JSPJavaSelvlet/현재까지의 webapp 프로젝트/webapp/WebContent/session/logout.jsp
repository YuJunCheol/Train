<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그아웃 : 
// 1. 세션 객체에 있는 MemberVO 객체를 삭제
// 2. 세션 객체를 초기화
session.removeAttribute("member"); // name이 member인것만 삭제
session.invalidate(); // session 전체 초기화
%>
<script>
	alert('로그아웃되었습니다.');
	location.href='main.jsp';
</script>