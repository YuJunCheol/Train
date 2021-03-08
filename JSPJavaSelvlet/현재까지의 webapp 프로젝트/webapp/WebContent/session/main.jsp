<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/*
로그인이 되어있으면 아이디, 이름, 이메일 출력
그렇지 않으면 로그인페이지로 이동하는 링크
*/
// session 객체에서 가져오기
MemberVO vo = (MemberVO)session.getAttribute("member");
if (vo != null) { // 로그인 상태
%>
	<%=vo.getName()%>님 안녕하세요.<br>
	<%=vo.getEmail() %> / <%=vo.getId() %><br>
	<a href='logout.jsp'>로그아웃</a><br>
	<!-- EL을 이용한 세션에서 객체 직접 접근 -->
	${sessionScope.member.name }님 안녕하세요.<br>
	${sessionScope.member.email } / ${sessionScope.member.id }<br>
<%
} else { // 미로그인 상태
%>
	<a href='index.jsp'>로그인</a>
<%
}
%>
</body>
</html>