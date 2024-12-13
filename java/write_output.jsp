<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <style type='text/css'>
        /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #fff; /* 배경을 흰색으로 */
            color: black; /* 텍스트는 검정색 */
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd; /* 연한 회색 테두리 */
            border-radius: 8px;
            background-color: #fff; /* 배경을 흰색으로 */
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 2rem;
            font-weight: bold;
            color: black; /* 기본 검정색 텍스트 */
        }

        .post-info {
            font-size: 0.9rem;
            color: black; /* 검정색 텍스트 */
            text-align: right;
            margin-bottom: 20px;
        }

        .post-title {
            font-size: 1.8rem;
            font-weight: bold;
            color: black; /* 제목 색상 */
            border-bottom: 1px solid #ddd; /* 얇은 회색 구분선 */
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .post-content {
            font-size: 1rem;
            line-height: 1.6;
            color: black; /* 내용 텍스트 색상 */
            margin-bottom: 30px;
        }

        .buttons {
            text-align: right;
            margin-top: 20px;
        }

        .buttons a {
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid black; /* 검정색 테두리 */
            border-radius: 5px;
            font-weight: bold;
            color: black; /* 버튼 텍스트 색상 */
            margin-left: 10px;
            transition: background-color 0.3s;
        }

        .buttons a:hover {
            background-color: #f0f0f0; /* 호버 시 배경색 변화 */
        }

        a:link, a:visited {
            color: black; /* 링크 기본 색상 */
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline; /* 링크에 호버 시 밑줄 */
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="header">
            <h1>게시판</h1>
        </div>

        <%
            String num = request.getParameter("num");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/dbmember";
            Connection conn = DriverManager.getConnection(url, "member", "apple");
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try {
                String strSQL = "SELECT * FROM tblboard WHERE num = ?";
                pstmt = conn.prepareStatement(strSQL);
                pstmt.setInt(1, Integer.parseInt(num));
                rs = pstmt.executeQuery();
                rs.next();

                String title = rs.getString("title");
                String contents = rs.getString("contents").trim();
                String writedate = rs.getString("writedate");
                int readcount = rs.getInt("readcount");
        %>

        <div class="post-info">
            <span>작성일: <%= writedate %> | 조회수: <%= readcount %></span>
        </div>
        
        <div class="post-title">
            <%= title %>
        </div>

        <div class="post-content">
            <%= contents %>
        </div>

        <div class="buttons">
			<a href="edit.jsp?num=<%=num%>">수정</a> <a
				href="delete.jsp?num=<%=num%>"
				onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a> <a
				href="listboard.jsp">목록보기</a>
		</div>

        <%
            strSQL = "UPDATE tblboard SET readcount=readcount+1 WHERE num = ?";
            pstmt = conn.prepareStatement(strSQL);
            pstmt.setInt(1, Integer.parseInt(num));
            pstmt.executeUpdate();
            } catch(SQLException e){
                out.print("SQL에러 " + e.toString());
            } catch(Exception ex){
                out.print("JSP에러 " + ex.toString());
            } finally {
                if (rs != null) { rs.close(); }
                if (pstmt != null) { pstmt.close(); }
                if (conn != null) { conn.close(); }
            }
        %>
    </div>

</body>
</html>
