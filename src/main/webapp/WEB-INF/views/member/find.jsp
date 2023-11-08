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
	<h2>아이디/비밀번호 찾기</h2>
	<h4>아이디 찾기 또는 비밀번호 찾기 버튼을 클릭해주세요</h4>
	
	<input id="findId" type="button" name="findId" value="아이디 찾기" >
	<input id="findPw" type="button" name="findPw" value="비밀번호 찾기" >
</body>

<script>
$('#findId').on('click',function(){
	console.log('아이디 찾기 페이지 진입');
	location.href='findId';
});

$('#findPw').on('click',function(){
	console.log('비밀번호 찾기 페이지 진입');
	location.href='findPw';
});
</script>
</html>