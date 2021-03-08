<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 코어 태그 라이브러리 불러오기 위해 디렉티브 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 
HTML 주석
 -->
<%
// JSP 주석

/*
<c:set>
변수에 값을 저장할 때 사용
<c:set var="변수명" value="값"/>
<c:set var="변수명">값</c:set>
*/
%>
<c:set var="name" value="홍길동"/>
<c:set var="id">hong</c:set>
<c:set var="name2" value="${name}"/> <!-- JSTL, EL 혼용 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${name } <br>
${id }<br>
${name2 }<br>
<%
/*
<c:out> 출력
*/
%>
<c:out value="${name }"/>
<%
/*
<c:if> - 조건 제어문
<c:if test="조건">
조건이 참이면 실행되는 구문
</c:if>
*/
%>
<c:if test="false">
조건이 참이면 실행
</c:if>
<c:if test="${param.id == 'hong' }">
파라미터 id의 값은 ${param.id}입니다.<br>
</c:if>
<c:if test="${param.age > 18 }">
당신은 성인입니다.<br>
</c:if>
<c:if test="${param.age <= 18 }">
당신은 미성년자입니다.<br>
</c:if>
<%
/*
<c:choose> - 자바에서 switch, if else 섞어놓은?
예)
*/
%>
<c:choose>
	<c:when test="${param.id == 'hong' }">
		홍길동
	</c:when>
	<c:when test="${param.age > 18 }">
		성인
	</c:when>
	<c:otherwise>
		홍길동도 아니고, 성인도 아니고
	</c:otherwise>
</c:choose>
<br>

</body>
</html>








