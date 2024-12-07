<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat"%>
<%
    String id = request.getParameter("id");
    String message = "";

    // DB 연결 설정
    try {
        // DB 연결
        String url = "jdbc:mysql://localhost:3306/dbmember";
        String user = "member";
        String password = "apple";
        Connection conn = DriverManager.getConnection(url, user, password);
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        if (id != null) {
            // 데이터베이스에서 기존 내용을 가져오기
            try {
                String strSQL = "SELECT * FROM guestbook WHERE id = ?";
                pstmt = conn.prepareStatement(strSQL);
                pstmt.setInt(1, Integer.parseInt(id));
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    message = rs.getString("message");
                }
            } catch (SQLException e) {
                out.print("SQL Error: " + e.getMessage());
            } finally {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            }
        }
    } catch (SQLException e) {
        out.print("DB 연결 오류: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>방명록</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 50%;
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 8px;
            font-weight: bold;
        }
        textarea {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        hr {
            margin-top: 40px;
        }
        .guestbook-entry {
            margin-bottom: 30px;
        }
        .guestbook-entry p {
            margin: 0 0 10px;
        }
        .guestbook-entry .date {
            color: #888;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>방명록</h1>

        <!-- 방명록 작성 폼 -->
        <form action="submit_guest.jsp" method="post">
            <input type="hidden" name="id" value="<%= id != null ? id : "" %>" />
            <div>
                <label for="message">내용:</label>
                <textarea id="message" name="message" required><%= message %></textarea>
            </div>
            <div>
                <button type="submit">제출</button>
            </div>
        </form>

        <hr>

        <h2>기존 방명록 목록</h2>
        <%
            // 방명록 목록을 가져오기
            try {
                // DB 연결
                String url = "jdbc:mysql://localhost:3306/dbmember";
                String user = "member";
                String password = "apple";
                Connection conn = DriverManager.getConnection(url, user, password);
                String sql = "SELECT * FROM guestbook ORDER BY created_at DESC";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();

                // 날짜 포맷 지정
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                while (rs.next()) {
                    // 'created_at'을 가져와서 포맷
                    String formattedDate = sdf.format(rs.getTimestamp("created_at"));
        %>
                    <div class="guestbook-entry">
                        <p><%= rs.getString("message") %></p>
                        <p class="date"><%= formattedDate %></p> <!-- 날짜 출력 -->
                    </div>
                    <hr>
                <%
                }
                rs.close();
                pstmt.close();
                conn.close();
            } catch (SQLException e) {
                out.print("SQL Error: " + e.getMessage());
            }
        %>
    </div>
</body>
</html>
