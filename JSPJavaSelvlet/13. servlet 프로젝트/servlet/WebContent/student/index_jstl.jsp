<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="student.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 목록</title>
</head>
<body>
<h2>JSTL 사용</h2>
<form action="studentList.do">
<select name="searchGrade">
	<option value="">전체</option>
	<option value="1" <c:if test="${param.searchGrade == '1'}">selected</c:if>>1학년</option>
	<option value="2" <c:if test="${param.searchGrade == '2'}">selected</c:if>>2학년</option>
	<option value="3" <c:if test="${param.searchGrade == '3'}">selected</c:if>>3학년</option>
	<option value="4" <c:if test="${param.searchGrade == '4'}">selected</c:if>>4학년</option>
</select>
<input type="text" name="searchWord" value="${param.searchWord }">
<input type="submit" value="검색">
</form>
<table border="1">
	<tr>
		<td>학생번호</td>
		<td>학생명</td>
		<td>아이디</td>
		<td>학년</td>
		<td>연락처</td>
	</tr>
<c:forEach var="vo" items="${studentList}">
	<tr>
		<td>${vo.studno }</td>
		<td>${vo.name }</td>
		<td><a href="detail.jsp?studno=${vo.studno }">${vo.id }</a></td>
		<td>${vo.grade }학년</td>
		<td>${vo.tel }</td>
	</tr>
</c:forEach>	
</table>
<a href="write.jsp"><input type="button" value="등록"></a>













</body>
</html>