<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.MemberVO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/*
<c:forEach> - 반복

사용방법)
<c:forEach var="변수명" items="열거형객체">

<c:forEach var="변수명" begin="시작값" end="끝값" step="단계">

속성
- var : 변수명
- items : 반복시킬 대상
- begin, end : 시작값, 끝값
- varStatus : 인덱스변수명
*/
List<MemberVO> list = new ArrayList<MemberVO>();

MemberVO vo = new MemberVO();
vo.setId("hong");
vo.setName("홍길동");
vo.setEmail("hong@gmail.com");
list.add(vo);

vo = new MemberVO();
vo.setId("lee");
vo.setName("이순신");
//vo.setEmail("lee@gmail.com");
list.add(vo);

vo = new MemberVO();
vo.setId("kim");
vo.setName("김유신");
vo.setEmail("kim@gmail.com");
list.add(vo);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
리스트의 길이 : <%=list.size() %><br>
리스트의 첫번째 요소의 이름 : <%=list.get(0).getName() %><br>
JSP for문을 이용 : <br>
<%
int j=1;
for (int i=0; i<list.size(); i++) {
%>
	<%=i+1 %> <%=j %> 아이디 : <%=list.get(i).getId()%> 이름 : <%=list.get(i).getName() %> 이메일 : <%=list.get(i).getEmail() %><br>
<%
	j++;
}
%>
forEach 이용: <br>
<%
request.setAttribute("memberList", list);
%>
<c:forEach var="member" items="${memberList}" varStatus="idx">
	${idx.index+1} 아이디 : ${member.id } 이름 : ${member.name } 이메일: ${member.email }<br>
</c:forEach>
향상된 for문 이용 : <br>
<%
for (MemberVO m : list) {
%>
	아이디 : <%=m.getId() %> 이름 : <%=m.getName() %> 이메일 : <%=m.getEmail() %><br>
<%
}
%>





</body>
</html>