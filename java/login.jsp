<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
        }
        .login-container {
            width: 300px;
            padding: 20px;
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
        }
        .logo img {
            max-width: 80px;
            height: auto;
            margin-bottom: 10px;
        }
        .message {
            color: red;
            margin-bottom: 15px;
            font-size: 14px;
        }
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="login-container">
    <div class="logo">
        <img src="rogo/rogo.png" alt="사이트 로고">
    </div>
    <h2>로그인</h2>

    <!-- 로그인 오류 메시지 표시 영역 -->
    <div class="message">
        <% 
            String message = request.getParameter("message");
            if (message != null) { 
        %>
            <%= message %>
        <% 
            } 
        %>
    </div>

    <form action="loginProcess.jsp" method="POST">
        <label for="loginEmail">이메일:</label><br>
        <input type="email" id="loginEmail" name="email" required><br>
        <label for="loginPassword">비밀번호:</label><br>
        <input type="password" id="loginPassword" name="password" required><br>
        <button type="submit">로그인</button>
    </form>
</div>

</body>
</html>
