<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

input[type=text] {
	width: 60%;
	height: 100%;
}

input[type=password] {
	width: 60%;
	height: 100%;
}

</style>
</head>
<body>
	<form action="signup2" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<th><input type="text" name="id" id="id"/></th>
				<td>
				<button id="validateId">아이디 유효성 검사</button>
				<p id="validationMessage"></p>
				</td>
			</tr>
			
			<tr>
				<th><label for="userpass">비밀번호</label></th>
				<td colspan="2">
					<input id="userpass" type="password" name="pw" required maxlength="8" autocomplete="off" /></td>
			</tr>
			<tr>
				<th><label for="userpasschk">비밀번호 확인</label></th>
				<td colspan="2">
					<input id="userpasschk" type="password" name="pw_chk" placeholder="동일하게 입력해주세요." required maxlength="8" autocomplete="off" /> 
					<span class="point successPwChk"></span>
				</td>
			</tr>
			
			<tr>
				<th>이메일</th>				
				<th colspan="2">
				<input class="box" id="domain-txt" type="text" name="email" value=""/>@ 
				<select class="box" id="domain-list">
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="kakao.com">kakao.com</option>
				</select>
				</th>
			</tr>
			<tr>
				<th>닉네임</th>
				<th colspan="2">
				<input type="text" name="nickname" /></th>
			</tr>
			<tr>
				<th>생년월일</th>
				<th colspan="2">
				<input id="year" name="birthdate" type="text" placeholder="yyyy-mm-dd 형식으로 입력"/>
				</span></th>
			</tr>
			<tr>
				<th>성별</th>
				<td colspan="2">
					<input type="radio" name="gender" value="남" checked />남자 
					<input type="radio" name="gender" value="여" />여자</td>
			</tr>
			<tr>
			<th><label for"vegan_type">식단 유형</label></th>
				<td colspan="2">
				    <select id="vegan_type" name="vegan_type">
				        <option value="1">플루테리언</option>
				        <option value="2">비건</option>
				        <option value="3">락토</option>
				        <option value="4">오보</option>
				        <option value="5">락토오보</option>
				        <option value="6">폴로</option>
				        <option value="7">페스코</option>
				        <option value="8">폴로페스코</option>
				        <option value="9">플렉시테리언</option>
				    </select>
				    </td>
			</tr>
			<tr>
				<th>비건 목적</th>
				<td colspan="2">
					<input type="radio" name="vegan_purpose" value="질병으로 인해" />질병으로 인해
					동물성 식품을 먹지 못함
					<p>
						<input type="radio" name="vegan_purpose" value="건강 개선" />건강 개선
					</p>
					<p>
						<input type="radio" name="vegan_purpose" value="체중 조절 및 미용" />체중 조절 및 미용
					</p>
					<p>
						<input type="radio" name="vegan_purpose" value="동물 학대를 방지" />동물 학대를 방지
					</p>
					<p>
						<input type="radio" name="vegan_purpose" value="환경 문제" />환경 문제
					</p> 
					<input type="radio" name="vegan_purpose" value="개인적인 신념이나 종교" />개인적인 신념이나 종교
				</td>
			</tr>
			<tr>
				<th>관심사</th>
				<td colspan="2">
				
				<input type="checkbox" name="interests" value="식당" id="interests"/> 식당
				<input type="checkbox" name="interests" value="레시피" id="interests"/> 레시피
				<input type="checkbox" name="interests" value="식품" id="interests"/> 식품
				<p>
				<input type="checkbox" name="interests" value="뷰티" id="interests"/> 뷰티
				<input type="checkbox" name="interests" value="패션" id="interests"/> 패션
				<input type="checkbox" name="interests" value="일상" id="interests"/> 일상
				<button id="submitButton">Submit</button>
				
					<!-- <input  type="text"  id="interests"name="interests"  /> -->
				</td>
			</tr>
			<tr>
				<td colspan="3">
				<label for="agree">
						<p>
							<input type="checkbox" name="agree" value="1"/> 
							<span>이용약관 동의<strong></strong>
							</span>
				</label> 
				<label for="agree">
						<p>
							<input type="checkbox" name="agree" value="2"/> 
							<span>개인정보 수집, 이용 동의<strong></strong>
							</span>
				</label> 
				<label for="agree">
						<p>
							<input type="checkbox" name="agree" value="3"/> 
							<span>개인정보 이용 동의<strong></strong>
							</span>
			</tr>
			<tr>
				<th colspan="3">
					<input type="submit" value="회원가입" />
					<!-- <input type="button" id="join" value="회원가입"/> -->
				</th>
			</tr>
		</table>
	</form>
</body>
<script>


document.getElementById('submitButton').addEventListener('click', function() {
    var selectedInterests = [];
    var checkboxes = document.getElementsByName('interests');
    for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
            selectedInterests.push(checkboxes[i].value);
        }
    }
    var combinedInterests = selectedInterests.join(',');
    
    console.log(combinedInterests);
    
   //관심사 다중선택 콘솔에는 찍히는 거 확인 완료 
   //다른 값과 한번에 같이 보내는 부분 구현 못함
});


//임시
/*
$('#join').on('click', function(){
	var email = $('input[name="email"]').val();
	var add =$('#domain-list').val();
	console.log(email);
	console.log(add);
	
	$.ajax({
		type:'get',
		url:'join',
		data:{'email':email,'add':add},
		dataType:'JSON',
		success:function(data){
			console.log(data);
		},
		error:function(e){
			console.log(e);
		}
	});
	
})
*/
	//팝업으로 조건문 실행
	//유효성 검사 
	document.getElementById("validateId").addEventListener("click", function() {
    // 입력 필드에서 아이디 값을 가져오기
    //4글자~12글자 영어, 숫자
    	var id = document.getElementById("id");
		var regId = /^[a-zA-Z0-9]{4,12}$/;

		//아이디 확인
		if (id.value == "") {
			alert("아이디를 입력하세요.");
			console.log("아이디를 입력하세요.");
			id.focus();
			return false;
		}
		//아이디 영어 대소문자 확인
		 else if (!regId.test(id.value)) {
			alert("4~12자 영문 대소문자, 숫자만 입력하세요.");
			console.log("4~12자 영문 대소문자, 숫자만 입력하세요.");
			id.focus();
			return false;
		}
	});
	

	//비밀번호 확인
	$("#userpasschk").blur(function() {
		if ($("#userpasschk").val() == $("#userpass").val()) {
			$(".successPwChk").text("비밀번호가 일치합니다.");
			$(".successPwChk").css("color", "green");
		} else {
			$(".successPwChk").text("비밀번호가 일치하지 않습니다.");
			$(".successPwChk").css("color", "red");
		}
	});
	
</script>
</html>