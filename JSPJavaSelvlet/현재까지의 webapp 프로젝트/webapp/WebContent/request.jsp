<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 및 서버 정보</title>
</head>
<body>
클라이언트IP : <%=request.getRemoteAddr() %><br>
요청 인코딩 : <%=request.getCharacterEncoding() %><br>
전송방식 : <%=request.getMethod() %><br>
요청 URI : <%=request.getRequestURI() %><br>
컨텍스트패스 : <%=request.getContextPath() %><br>
서버명 : <%=request.getServerName() %><br>
포트 : <%=request.getServerPort() %>
</body>
</html>