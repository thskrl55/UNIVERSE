<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("utf-8");

// 글 제목과 글 내용만 입력받기
String title = request.getParameter("title");
String contents = request.getParameter("contents");

// 데이터베이스 연결 및 처리
Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/dbmember";
Connection conn = DriverManager.getConnection(url, "member", "apple");
PreparedStatement pstmt = null;

// 작성 날짜 생성
Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate += Integer.toString(dateIn.get(Calendar.MONTH) + 1) + "-";
indate += Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate += Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate += Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate += Integer.toString(dateIn.get(Calendar.SECOND));

// 데이터 삽입
String strSQL = "INSERT INTO tblboard (title, contents, writedate, readcount)";
strSQL += " VALUES (?, ?, ?, ?)";
pstmt = conn.prepareStatement(strSQL);
pstmt.setString(1, title);
pstmt.setString(2, contents);
pstmt.setString(3, indate);
pstmt.setInt(4, 0); // 조회수 초기화
pstmt.executeUpdate();

pstmt.close();
conn.close();

response.sendRedirect("listboard.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성 완료</title>
</head>
<body>

</body>
</html>
