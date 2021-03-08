<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//데이터베이스 커넥션(접속) 객체 선언
	Connection conn = null;
	// sql 실행할 객체
	PreparedStatement pstmt = null;
	
	String no = request.getParameter("no");
	
	try {
		// MariaDB 드라이버 로드
		Class.forName("org.mariadb.jdbc.Driver");
		// 데이터베이스 접속(커넥션)
		conn = DriverManager.getConnection(
				"jdbc:mariadb://127.0.0.1:3307/aidb", "root", "aiuser");
		
		// autocommit false 지정
		conn.setAutoCommit(false);
		
		// 작업처리
		pstmt = conn.prepareStatement("insert into product values (?,?)");
		pstmt.setInt(1, Integer.parseInt(no));
		pstmt.setString(2, "상품명"+no);
		pstmt.executeUpdate();
		
		// 강제 에러 발생
		if ("ok".equals(request.getParameter("error"))) {
			throw new Exception("강제 에러 발생");
		}
		
		pstmt = conn.prepareStatement("insert into product_detail values (?,?)");
		pstmt.setInt(1, Integer.parseInt(no));
		pstmt.setString(2, "상품설명"+no);
		pstmt.executeUpdate();
		
		// commit 완료시 최종적 실행
		conn.commit();
		
	} catch (Exception e) {
		conn.rollback();
		System.out.println("에러: " + e.toString());
	} finally {
		try {conn.close();}catch(Exception e) {}
		try {pstmt.close();}catch(Exception e) {}
	}
	if (conn != null) out.println("성공");
%>
</body>
</html>