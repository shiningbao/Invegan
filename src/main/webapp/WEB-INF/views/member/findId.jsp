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

<h2>아이디 찾기 결과:</h2>
    <c:if test="${not empty foundId}">
        <p>찾은 아이디: ${foundId}</p>
    </c:if>


<form action="findId2" method="post">
	<div>
    <label for="email">이메일:</label>
    <input type="text" id="email" name="email" required>
    <br>
    <label for="birthdate">생년월일:</label>
    <input type="text" id="birthdate" name="birthdate" required>
    <br>
    <input type="submit" value="아이디 찾기">

	<p>
		<input id="enter" type="button" name="enter" value="확인" >
		<input type="button" onclick="history.go(-1);" name="cancel" value="취소" >
	</p>
	</div>


	<tr class="email">
				<th><label for="useremail">이메일 인증</label></th>
				<td>
					<p>
						<input id="sm_email" type="text" name="email3" title="이메일 주소를 입력해주세요." required />
						<button id="emailChk" class="doubleChk">인증번호 보내기</button>
						<br/> 
						<input id="sm_email2" type="text" name="email2" title="인증번호 입력" disabled required /> 
							<span id="emailChk2" class="doubleChk">이메일인증</span>
					<p>
						<span class="point successEmailChk">이메일 입력 후 인증번호 보내기를 해주세요.</span> 
						<input type="hidden" id="emailDoubleChk" />
					</p>
				</td>
			</tr>
			
			
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


//url!!!!!!!!!!
//이메일 인증
var code = "";
$("#emailChk").click(function() {
	var sm_email = $("#sm_email").val();
	$.ajax({
		type : "GET",
		url : "mailCheck?sm_email=" + sm_email,
		cache : false,
		success : function(data) {
			if (data == "error") {
				alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
				$("#sm_email").attr("autofocus", true);
				$(".successEmailChk").text("유효한 이메일 주소를 입력해주세요.");
				$(".successEmailChk").css("color", "red");
			} else {
				alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
				$("#sm_email2").attr("disabled", false);
				$("#emailChk2").css("display", "inline-block");
				$(".successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
				$(".successEmailChk").css("color", "green");
				code = data;
			}
		}
	});
});

//이메일 인증번호 대조
$("#emailChk2").click(function() {
	if ($("#sm_email2").val() == code) {
		$(".successEmailChk").text("인증번호가 일치합니다.");
		$(".successEmailChk").css("color", "green");
		$("#emailDoubleChk").val("true");
		$("#sm_email2").attr("disabled", true);
		$("#sm_email").attr("disabled", true);
	} else {
		$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".successEmailChk").css("color", "red");
		$("#emailDoubleChk").val("false");
		$("#sm_email2").attr("autofocus", true);
	}
});

</script>
</html>