<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    // 입력값 가져오기
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        if (id == null || id.isEmpty() || pass == null || pass.isEmpty()) {
            // 입력값 검증 실패
            response.sendRedirect("login.jsp?message=" + java.net.URLEncoder.encode("아이디와 비밀번호를 입력해주세요.", "UTF-8"));
            return;
        }

        // 데이터베이스 연결
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/dbmember";
        conn = DriverManager.getConnection(url, "member", "apple");
        stmt = conn.createStatement();

        // 사용자 인증
        String strSQL = "SELECT * FROM tblmember WHERE id='" + id + "' AND pass='" + pass + "'";
        rs = stmt.executeQuery(strSQL);

        if (rs.next()) {
            // 로그인 성공
            response.sendRedirect("main.jsp?name=" + java.net.URLEncoder.encode(rs.getString("name"), "UTF-8"));
        } else {
            // 로그인 실패 메시지
            response.sendRedirect("login.jsp?message=" + java.net.URLEncoder.encode("아이디 또는 비밀번호가 잘못되었습니다.", "UTF-8"));
        }
    } catch (Exception e) {
        // 오류 메시지
        response.sendRedirect("login.jsp?message=" + java.net.URLEncoder.encode("오류 발생: " + e.getMessage(), "UTF-8"));
    } finally {
        // 리소스 정리
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
