<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
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
        .signup-container {
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

<div class="signup-container">
    <div class="logo">
        <img src="rogo/rogo.png" alt="사이트 로고">
    </div>
    <h2>회원가입</h2>

    <!-- 회원가입 오류 메시지 표시 영역 -->
    <div class="message">
        <% 
            String signupMessage = request.getParameter("message");
            if (signupMessage != null) { 
        %>
            <%= signupMessage %>
        <% 
            } 
        %>
    </div>

    <form action="signupProcess.jsp" method="POST">
        <label for="signupEmail">이메일:</label><br>
        <input type="email" id="signupEmail" name="email" required><br>
        <label for="signupPassword">비밀번호:</label><br>
        <input type="password" id="signupPassword" name="password" required><br>
        <label for="confirmPassword">비밀번호 확인:</label><br>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>
        <button type="submit">회원가입</button>
    </form>
</div>

</body>
</html>
