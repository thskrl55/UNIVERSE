<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>개발자 소개</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
        }
        ul {
            list-style: none;
            padding: 0;
        }
        ul li {
            margin: 10px 0;
            color: #666;
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
    <div class="container">
        <h1>개발자 소개</h1>
        <ul>
            <li><strong>이름:</strong> 홍길동</li>
            <li><strong>전문 분야:</strong> 웹 개발, 데이터베이스 설계</li>
            <li><strong>개발 목표:</strong> 사용자 중심의 간단하고 직관적인 웹 애플리케이션 제작</li>
            <li><strong>연락처:</strong> dev@example.com</li>
        </ul>
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
