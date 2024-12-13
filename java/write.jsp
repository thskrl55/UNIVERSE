<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>게시판</title>
    <script type="text/javascript">
        function Check() {
            if (Write.title.value.trim().length < 1) {
                alert("글 제목을 입력하세요.");
                Write.title.focus();
                return false;
            }
            if (Write.contents.value.trim().length < 1) {
                alert("글 내용을 입력하세요.");
                Write.contents.focus();
                return false;
            }
            return true;
        }
    </script>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: black;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 90%;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            border: 1px solid #ddd;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 2rem;
            font-weight: bold;
            color: black;
        }

        .form-table {
            width: 100%;
            margin-bottom: 20px;
        }

        .form-table td {
            padding: 10px;
            vertical-align: top;
        }

        .form-table td:first-child {
            width: 150px;
            font-weight: bold;
        }

        .form-table input[type="text"], .form-table textarea {
            width: 100%;
            padding: 8px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .form-table textarea {
            resize: vertical;
        }

        .buttons {
            text-align: center;
            margin-top: 20px;
        }

        .buttons input[type="submit"], .back-button {
            padding: 10px 20px;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 5px;
            cursor: pointer;
            display: inline-block;
            margin-right: 10px; /* 버튼 간 간격 */
        }

        .buttons input[type="submit"]:hover, .back-button:hover {
            background-color: #f0f0f0;
        }

        /* 목록 버튼 스타일 */
        .back-button {
            text-decoration: none;
            color: black;
            text-align: center;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="header">
            <h1>게시판 글쓰기</h1>
        </div>

        <form name="Write" action="write_input.jsp" method="post" onsubmit="return Check()">
            <table class="form-table">
                <tr>
                    <td>글 제목</td>
                    <td><input type="text" name="title" maxlength="50" required></td>
                </tr>
                <tr>
                    <td>글 내용</td>
                    <td><textarea name="contents" rows="15" required></textarea></td>
                </tr>
            </table>

            <div class="buttons">
                <input type="submit" value="등록">
                <a href="listboard.jsp" class="back-button">목록</a>
            </div>
        </form>
    </div>

</body>
</html>
