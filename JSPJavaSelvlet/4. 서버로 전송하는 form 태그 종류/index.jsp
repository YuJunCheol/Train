<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function gogo() {
	frm.submit();
}
</script>
</head>
<body>

<form action="save.jsp" method="get" name="frm">
<input type="hidden" name="member_no" value="10">
아이디 : <input type="text" name="id" value="a"><br>
비밀번호 : <input type="password" name="pwd"><br>
학력 :
<select name="school">
	<option value="1">대학원</option>
	<option value="2">대학교</option>
	<option value="3">고등학교</option>
</select><br>
성별: <input type="radio" name="gender" value="1">남성
<input type="radio" name="gender" value="2" checked>여성<br>
취미: 
<input type="checkbox" name="hobby" value="1">영화
<input type="checkbox" name="hobby" value="2" checked>낚시
<input type="checkbox" name="hobby" value="3">독서
<input type="checkbox" name="hobby" value="4">운동<br>
사진:
<input type="file" name="picture"><br>
자기소개:
<textarea name="info">저는 홍길동입니다.</textarea><br>
<input type="button" value="일반 버튼" onclick="gogo()">
<input type="reset" value="리셋">
<input type="submit" value="전송">
<button>버튼</button>
<input type="image" src="">
</form>

</body>
</html>