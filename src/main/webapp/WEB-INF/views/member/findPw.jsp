<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style></style>
</head>
<body>
	<h2>비밀번호 찾기 결과</h2>
	
	<c:if test="${not empty pw}">
        <p>찾은 비밀번호: ${pw}</p>
    </c:if>
    
<form action="findPw2" method="post">
    <div>
        <label for="id">아이디:</label>
        <p>
            <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
        </p>
        <label for="email">이메일:</label>
        <p>
            <input type="text" id="email" name="email" placeholder="이메일을 입력해주세요">
        </p>
        <p>
            <br>
            <input type="submit" name="findPww" value="비밀번호 찾기">
        </p>
    </div>
</form>
</body>
<script></script>
</html>