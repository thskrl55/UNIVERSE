<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
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
            background-color: #f5f5f5;
            color: #333;
        }
        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #4b4b4b;
            color: white;
        }
        .logo img {
            max-height: 50px;
        }
        header a {
            color: white;
            text-decoration: none;
            margin-left: 15px;
            font-weight: bold;
        }
        header a:hover {
            text-decoration: underline;
        }
        nav {
            text-align: center;
            padding: 15px;
            background-color: #d9d9d9;
            border-bottom: 1px solid #ccc;
        }
        nav a {
            margin: 0 15px;
            text-decoration: none;
            color: #4b4b4b;
            font-weight: bold;
        }
        nav a:hover {
            color: #333;
        }
        main {
            padding: 20px;
        }
        footer {
            padding: 10px;
            text-align: center;
            background-color: #4b4b4b;
            color: white;
            border-top: 1px solid #ccc;
        }
        .board-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .board-container h2 {
            margin-top: 0;
            color: #4b4b4b;
        }
        .board-container form {
            margin-bottom: 20px;
        }
        .board-container form input,
        .board-container form textarea,
        .board-container form button {
            width: 100%;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .board-container form button {
            background-color: #4b4b4b;
            color: white;
            cursor: pointer;
        }
        .board-container form button:hover {
            background-color: #333;
        }
        .post-list {
            list-style: none;
            padding: 0;
        }
        .post-list li {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .post-list li h3 {
            margin: 0 0 5px;
            color: #4b4b4b;
        }
        .post-list li p {
            margin: 0;
        }
    </style>
</head>
<body>

<header>
    <div class="logo">
          <img src="rogo/rogo.png" alt="사이트 로고">
    </div>
    <div>
        <a href="index.jsp">메인으로</a>
    </div>
</header>

<nav>
    <a href="index.jsp">홈</a>
    <a href="#">사이트소개</a>
    <a href="#">주인장소개</a>
    <a href="#">방명록</a>
    <a href="board.jsp">자유게시판</a>
</nav>

<main>
    <div class="board-container">
        <h2>자유게시판</h2>

        <!-- 글쓰기 섹션 -->
        <form action="process_post.jsp" method="post">
            <input type="text" name="title" placeholder="제목" required>
            <textarea name="content" placeholder="내용" rows="5" required></textarea>
            <button type="submit">글쓰기</button>
        </form>

        <!-- 글 목록 -->
        <ul class="post-list">
            <li>
                <h3>게시글 제목 1</h3>
                <p>게시글 내용 미리보기...</p>
            </li>
            <li>
                <h3>게시글 제목 2</h3>
                <p>게시글 내용 미리보기...</p>
            </li>
        </ul>
    </div>
</main>

<footer>
    &copy; 2024 자유게시판
</footer>

</body>
</html>
