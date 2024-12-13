<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
    String id = request.getParameter("id");
    String message = request.getParameter("message");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // DB 연결
        String url = "jdbc:mysql://localhost:3306/dbmember";
        String user = "member";
        String password = "apple";
        conn = DriverManager.getConnection(url, user, password);

        if (id == null || id.isEmpty()) {
            // 새 방명록 추가
            String strSQL = "INSERT INTO guestbook (message) VALUES (?)";
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, message);
            pstmt.executeUpdate();
        } else {
            // 방명록 수정
            String strSQL = "UPDATE guestbook SET message = ? WHERE id = ?";
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setString(1, message);
            pstmt.setInt(2, Integer.parseInt(id));
            pstmt.executeUpdate();
        }

    } catch (SQLException e) {
        out.print("SQL Error: " + e.getMessage());
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>

<!-- 완료 후 방명록 목록 페이지로 리디렉션 -->
<%
    response.sendRedirect("guest.jsp");
%>
