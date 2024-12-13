<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");

    // 수정할 데이터 가져오기
    String num = request.getParameter("num");
    String title = request.getParameter("title");
    String contents = request.getParameter("contents");

    // 데이터베이스 연결
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/dbmember";
    Connection conn = DriverManager.getConnection(url, "member", "apple");
    PreparedStatement pstmt = null;

    try {
        String sql = "UPDATE tblboard SET title = ?, contents = ? WHERE num = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, title);
        pstmt.setString(2, contents);
        pstmt.setInt(3, Integer.parseInt(num));
        pstmt.executeUpdate();

        response.sendRedirect("listboard.jsp");
    } catch (Exception e) {
        out.print("수정 중 에러: " + e.toString());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
