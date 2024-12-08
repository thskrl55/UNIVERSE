<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자유게시판</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #f8f8f8;
            border-bottom: 1px solid #ddd;
        }
        header .logo img {
            max-width: 100px;
            height: auto;
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
        .content {
            margin: 30px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            margin: 20px auto;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:nth-child(even) {
            background-color: #fafafa;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .btn-write {
            display: inline-block;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin: 20px auto;
            display: block;
            text-align: center;
            border: 1px solid #ddd;
            color: #333;
        }
        .btn-write:hover {
            background-color: #f1f1f1;
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
    <div class="content">
        <h2>자유게시판</h2>

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
                // 데이터베이스 연결 및 게시글 가져오기
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/dbmember";
                Connection conn = DriverManager.getConnection(url, "member", "apple");
                Statement stmt = conn.createStatement();
                String strSQL = "SELECT num, title, writedate, readcount FROM tblboard ORDER BY num DESC";
                ResultSet rs = stmt.executeQuery(strSQL);
                // 데이터 출력
                while (rs.next()) {
                    int num = rs.getInt("num");
                    String title = rs.getString("title");
                    String writedate = rs.getString("writedate");
                    int readcount = rs.getInt("readcount");
                %>
                <tr>
                    <td><%= num %></td>
                    <td><a href="write_output.jsp?num=<%= num %>"><%= title %></a></td>
                    <td><%= writedate %></td>
                    <td><%= readcount %></td>
                </tr>
                <%
                }
                rs.close();
                stmt.close();
                conn.close();
                %>
            </tbody>
        </table>

        <a href="write.jsp" class="btn-write">글쓰기</a>
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
