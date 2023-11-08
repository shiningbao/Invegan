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

<h2>ID/PW 찾기 결과</h2>

    <c:if test="${not empty id}">
        <p>찾은 아이디: ${id}</p>
    </c:if>


<form action="findId2" method="post">

	<div>
    <label for="email">이메일:</label>
    <input type="text" id="email2" name="email" required placeholder="이메일을 입력해주세요">
    
    <p>
    <br>
    <input type="submit" name="findIdd" value="아이디 찾기">
	</p>
	</div>

	
</form>

<hr/>

	<c:if test="${not empty pw}">
        <p>찾은 비밀번호: ${pw}</p>
    </c:if>
    
<form action="findPw2" method="post">
    <div>
        <label for="id">아이디:</label>
        <p>
            <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
        </p>
        <label for="email2">이메일:</label>
        <p>
            <input type="text" id="email" name="email2" placeholder="이메일을 입력해주세요">
        </p>
        <p>
            <br>
            <input type="submit" name="findPww" value="비밀번호 찾기">
        </p>
    </div>
</form>
<!-- 
	<p>
		<input id="enter" type="button" name="enter" value="확인" >
		<input type="button" onclick="history.go(-1);" name="cancel" value="취소" >
	</p>
 -->	
</body>
<script>
/*
$('#findIdd').on('click',function(){
	var email = $('input[name="email"]').val();
	console.log(email);
	if(email==null){
		alert('다시 확인해주세요');
	}else{
		alert('아이디가 존재합니다');
	}
});
*/
/*
$('#enter').on('click',function(){
	var email = $('input[name="email"]').val();
	console.log(email);
	if(email==null){
		alert('다시 확인해주세요');
	}else{
		alert('아이디가 존재합니다');
	}
});
*/

var msg = "${msg}";
if(msg != ""){
	alert(msg);
}



</script>
</html>