<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insert.jsp" method="post">
<table border="1">
	<tr>
		<td>학생번호</td>
		<td>
			<input type="number" name="studno">
		</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
			<input type="text" name="id">
		</td>
	</tr>
	<tr>
		<td>학생명</td>
		<td>
			<input type="text" name="name">
		</td>
	</tr>
	<tr>
		<td>학년</td>
		<td>
			<select name="grade">
				<option value="1">1학년</option>
				<option value="2">2학년</option>
				<option value="3">3학년</option>
				<option value="4">4학년</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td>
			<input type="text" name="jumin">
		</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>
			<input type="text" name="tel">
		</td>
	</tr>
</table>
<input type="submit" value="저장">
</form>
</body>
</html>