<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 찾기 결과</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

body {
    background-color: #edf0ef;
    display: flex; /* display: flex 추가 */
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.container {
    display: flex;
    flex-direction: column; /* 세로 방향으로 정렬 */
}

.find-result-container {
    background-color: #ffe4e1; 
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    text-align: center;
}

h2, p, label {
    color: #333; /* 검은색 텍스트 */
}

input {
    padding: 10px;
    margin: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="submit"] {
    background-color: #4682b4;
    color: #fff;
    border: none;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #36648b; /* hover */
}

</style>
</head>
<body>
    <div class="container">
        <h2>비밀번호 찾기 결과</h2>
    </div>

    <div class="container">
        <c:if test="${not empty pw}">
            <p>찾은 비밀번호: ${pw}</p>
        </c:if>
    </div>

    <form action="findPw2" method="post">
        <div class="container">
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" required placeholder="아이디를 입력해주세요">
        </div>
		<div class="container">
            <label for="email">이메일:</label>
            <input type="text" id="email" name="email" required placeholder="이메일을 입력해주세요">
        </div>

        <div class="container">
            <p>
                <br>
                <input type="submit" name="findPww" value="비밀번호 찾기">
            </p>
        </div>
    </form>
</body>
<script></script>
</html>