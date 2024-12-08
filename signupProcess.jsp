<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    // 입력값 가져오기
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");
    String confirmPassword = request.getParameter("confirmPassword");

    String checkOk = "yes";

    // 입력값 검증
    if (id == null || id.trim().isEmpty()) checkOk = "no";
    if (pass == null || pass.trim().isEmpty()) checkOk = "no";
    if (confirmPassword == null || confirmPassword.trim().isEmpty()) checkOk = "no";

    if (!pass.equals(confirmPassword)) checkOk = "no";

    if (checkOk.equals("no")) {
        response.sendRedirect("signup.jsp?message=" + java.net.URLEncoder.encode("모든 필드를 정확히 입력해주세요.", "UTF-8"));
        return;
    }

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        // MySQL 5.1 드라이버 사용
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/dbmember";
        conn = DriverManager.getConnection(url, "member", "apple");
        stmt = conn.createStatement();

        // ID 중복 체크
        String query = "SELECT id FROM tblmember WHERE id='" + id + "'";
        rs = stmt.executeQuery(query);

        if (!rs.next()) {
            // 회원가입 진행
            query = "INSERT INTO tblmember(id, pass, name) VALUES('" + id + "', '" + pass + "', '" + id + "')";
            stmt.executeUpdate(query);
            response.sendRedirect("login.jsp?message=" + java.net.URLEncoder.encode("회원가입 성공", "UTF-8"));
        } else {
            response.sendRedirect("signup.jsp?message=" + java.net.URLEncoder.encode("중복된 아이디입니다.", "UTF-8"));
        }
    } catch (Exception e) {
        response.sendRedirect("signup.jsp?message=" + java.net.URLEncoder.encode("오류 발생: " + e.getMessage(), "UTF-8"));
    } finally {
        // 리소스 정리
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
