<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

</style>
</head>
<body>

<form name="findIdPage" method="POST">
<h3>아이디 찾기</h3>
	<div class="findNickname">
		<label>닉네임</label>
		<input type="text" name="findname" placeholder="닉네임을 입력하세요">
	</div>
	<div class="findEmail">
		<label>이메일</label>
		<input type="text" name="findmail" placeholder="이메일을 입력하세요">
	</div>
	<div class="btnSearch">
	<p>
		<input id="enter" type="button" name="enter" value="확인" >
		<input type="button" onclick="history.go(-1);" name="cancel" value="취소" >
	</p>
	</div>

</form>

</body>
<script>

//여기를 메일 인증으로 바꾸기!!!!!!!!!
$('#enter').on('click',function(){
	var email = $('input[name="findemail"]').val();
	console.log(email);
	if(email==null){
		alert('다시 확인해주세요');
	}else{
		alert('아이디가 존재합니다');
	}
});

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}
</script>
</html>