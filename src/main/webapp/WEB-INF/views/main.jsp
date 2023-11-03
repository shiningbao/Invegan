<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TEST PAGE</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- 
<link rel="stylesheet" href="resources/css/common.css" type="text/css">
 -->
</head>
<body>
	<h3>${msg}</h3>
	<input id="login" type="button" value="로그인"/>
	<h3><a href="diet/tempCalander">메뉴추가 바로가기</a></h3>
</body>
<script>


$('#login').on('click',function(){
	location.href='member/login.go';
});


</script>
</html>