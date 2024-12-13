<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #f8f8f8;
            border-bottom: 1px solid #ddd;
        }
        nav {
            display: flex;
            justify-content: center;
            padding: 10px;
            background-color: #f2f2f2;
            border-bottom: 1px solid #ddd;
        }
        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        main {
            padding: 20px;
            text-align: center;
            min-height: 400px;
        }
        footer {
            padding: 20px;
            text-align: center;
            background-color: #f2f2f2;
            border-top: 1px solid #ddd;
        }
        .footer-sitemap {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            margin-top: 10px;
        }
        .footer-sitemap a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .footer-sitemap a:hover {
            text-decoration: underline;
        }
        .logo img {
            max-width: 100px;
            height: auto;
        }
        .board-posts {
            margin-top: 20px;
            text-align: left;
            padding: 0 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .post-title a {
            text-decoration: none;
            color: #333;
        }
        .post-title a:hover {
            text-decoration: underline;
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

<header>
    <div class="logo">
        <img src="rogo/rogo.png" alt="사이트 로고">
    </div>
    <div>
        <a href="login.jsp">로그인</a> | 
        <a href="signup.jsp">회원가입</a>
    </div>
</header>

<nav>
    <a href="main.jsp">메인 페이지</a>
    <a href="about.jsp">사이트소개</a>
    <a href="aboutDeveloper.jsp">About us</a>
    <a href="guest.jsp">방명록</a>
    <a href="listboard.jsp">자유게시판</a>
</nav>

<main>
    <h1>메인 페이지</h1>

    <!-- 게시판 내용 표시 -->
    <div class="board-posts">
        <h2>최근 게시글</h2>
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>글 제목</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // DB 연결
                    try {
                        String url = "jdbc:mysql://localhost:3306/dbmember";
                        String user = "member";
                        String password = "apple";
                        Connection conn = DriverManager.getConnection(url, user, password);
                        String sql = "SELECT num, title, writedate, readcount FROM tblboard ORDER BY writedate DESC LIMIT 5";  // 최근 5개 게시글
                        PreparedStatement pstmt = conn.prepareStatement(sql);
                        ResultSet rs = pstmt.executeQuery();

                        // 날짜 포맷 지정
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

                        while (rs.next()) {
                            // 게시글 제목, 날짜, 조회수 출력
                            int num = rs.getInt("num");
                            String title = rs.getString("title");
                            String formattedDate = sdf.format(rs.getTimestamp("writedate"));
                            int readcount = rs.getInt("readcount");
                %>
                            <tr>
                                <td><%= num %></td>
                                <td class="post-title">
                                    <a href="write_output.jsp?num=<%= num %>"><%= title %></a>
                                </td>
                                <td><%= formattedDate %></td>
                                <td><%= readcount %></td>
                            </tr>
                <%
                        }
                        rs.close();
                        pstmt.close();
                        conn.close();
                    } catch (SQLException e) {
                        out.print("SQL Error: " + e.getMessage());
                    }
                %>
            </tbody>
        </table>
    </div>
</main>

<footer>
    <h3>사이트맵</h3>
    <div class="footer-sitemap">
        <a href="main.jsp">메인 페이지</a>
        <a href="login.jsp">로그인</a>
        <a href="signup.jsp">회원가입</a>
        <a href="about.jsp">사이트 소개</a>
        <a href="aboutDeveloper.jsp">개발자 소개</a>
        <a href="guest.jsp">방명록</a>
        <a href="listboard.jsp">자유게시판</a>
    </div>
</footer>

</body>
</html>
