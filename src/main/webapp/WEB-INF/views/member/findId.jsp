<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
input[type=text] {
	width: 300px;
	height: 25px;
}
</style>
</head>
<body>

<h2>아이디 찾기 결과</h2>

    <c:if test="${not empty id}">
        <p>찾은 아이디: ${id}</p>
    </c:if>


<form action="findId2" method="post">

	<div>
    <label for="email">이메일:</label>
    <input type="text" id="email" name="email" required placeholder="이메일을 입력해주세요">
    
    <p>
    <br>
    <input type="submit" name="findIdd" value="아이디 찾기">
	</p>
	</div>

</form>
</body>
<script>

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

</script>
</html>