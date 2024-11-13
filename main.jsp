<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
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
            padding: 10px;
            text-align: center;
            background-color: #f2f2f2;
            border-top: 1px solid #ddd;
        }
        .logo img {
            max-width: 100px;
            height: auto;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">
        <img src="rogo/rogo.png" alt="사이트 로고">
    </div>
    <div>
        <a href="login.html">로그인</a> | 
        <a href="signup.html">회원가입</a>
    </div>
</header>

<nav>
    <a href="#">사이트소개</a>
    <a href="#">주인장소개</a>
    <a href="#">방명록</a>
    <a href="#">자유게시판</a>
</nav>

<main>
    <h1>메인 페이지</h1>
</main>

<footer>
    사이트 맵
</footer>

</body>
</html>
