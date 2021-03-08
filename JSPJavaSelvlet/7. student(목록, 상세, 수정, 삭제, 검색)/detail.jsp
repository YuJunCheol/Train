<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.StudentDAO" %>
<%@ page import="student.StudentVO" %>
<%
/*
studno 파라미터를 받아서
selectOne() 메서드에 매개변수로 넘겨주고
리턴값(StudentVO)을 받아서 출력
*/
String studno = request.getParameter("studno");
StudentDAO dao = new StudentDAO();
StudentVO vo = dao.selectOne(Integer.parseInt(studno));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<td>학생번호</td>
		<td><%=vo.getStudno() %></td>
	</tr>
	<tr>
		<td>학생명</td>
		<td><%=vo.getName() %></td>
	</tr>
	<tr>
		<td>학년</td>
		<td><%=vo.getGrade() %>학년</td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td><%=vo.getJumin() %></td>
	</tr>
	<tr>
		<td>생일</td>
		<td><%=vo.getBirthday() %></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><%=vo.getTel() %></td>
	</tr>
	<tr>
		<td>키</td>
		<td><%=vo.getHeight() %></td>
	</tr>
	<tr>
		<td>몸무게</td>
		<td><%=vo.getWeight() %></td>
	</tr>
	<tr>
		<td>전공</td>
		<td><%=vo.getMajor1() %></td>
	</tr>
	<tr>
		<td>부전공</td>
		<td><%=vo.getMajor2() %></td>
	</tr>
	<tr>
		<td>지도교수</td>
		<td><%=vo.getProfName() %></td>
	</tr>
</table>
<input type="button" value="수정" onclick="location.href='edit.jsp?studno=<%=studno%>'";>
<input type="button" value="삭제" onclick="del();">
<script>
function del() {
	if (confirm("삭제하시겠습니까?")) {
		location.href="delete.jsp?studno=<%=studno%>";
	}
}
</script>










</body>
</html>