<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String num = request.getParameter("num");

    // 데이터베이스 연결
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/dbmember";
    Connection conn = DriverManager.getConnection(url, "member", "apple");
    PreparedStatement pstmt = null;

    try {
        String sql = "DELETE FROM tblboard WHERE num = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(num));
        pstmt.executeUpdate();

        response.sendRedirect("listboard.jsp");
    } catch (Exception e) {
        out.print("삭제 중 에러: " + e.toString());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
