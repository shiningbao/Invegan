<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
.container{
	width: 1000px;
	margin: 0 auto;
}
.join-title{
    position: absolute;
    font-size: 25px;
    top: 165px;
    right: 636px;
}
#signup-img, #signup-box, h2{
    display: inline-block;
    margin: 24px 7px;
}
#signup-img img{
	opacity: 0.7;
    width: 404px;
    height: 749px;
}
#signup-box{
	white-space: nowrap;
}
#signup-form{
	position: relative;
	top: 29px;
}
#signup-form th{
	padding: 8px 0px;
}
#signup-form td{
	vertical-align: middle;
	padding: 0 10px;
}
#signup-form input:not(input[type="submit"]){
	outline:none;
	text-align: center;
	border: none;
    font-size: 15px;
    font-weight: 600;
    height: 27px;
    padding: 0px 5px;
    border-bottom: 1.5px solid #a8dca8;
    margin: 5px 3px;
}
#v-purpose{
	border-left: 2px solid #95df95;
	border-radius: 8px;

}
#v-purpose p{
	display: inline-block;
	margin: 0;
	vertical-align: middle;
}
#inter{
	border-left: 2px solid #95df95;
	border-radius: 8px;
}
input[type="radio"] ,input[type="checkbox"]{
  vertical-align: middle; 
}
.box{
	width: 110px;
}
#point-successPwChk{
	font-size: 13px;
}

select{
	border: none;
	outline: none;
}
select:hover{
	cursor: pointer;
	color:#95df95;
}
option{
	color: black;
}

/* table, tr, td {
	border: 1px solid black;
} */
#validateId{
	border: none;
	background: none;
	cursor: pointer;
}
#validateId:hover{
	color:#95df95;
}
#submitBtn{
	border: none;
    border-radius: 5px;
    padding: 5px 193px;
    background: none;
    cursor: pointer;
    font-size: 18px;
}
#submitBtn:hover{
	color:#95df95;
}

</style>
</head>
<body>
	<c:import url="/main/header" />
	<div class="container">
		<div id="signup-img">
			<img alt="deco-img" src="<c:url value='/resources/main/invegan_source.png'/>">
		</div>
		<div id="signup-box">
			<label class="join-title">JOIN US</label>
			<form action="signup.do" method="post" style="white-space: nowrap;">
				<table id="signup-form">
					<tr>
						<th>아이디</th>
						<td><input type="text" required name="id" id="id" />
							<button id="validateId" class="idTrueFalse">중복체크</button>
							</td>
					</tr>
	
					<tr>
						<th><label for="password">비밀번호</label></th>
						<td><input id="pw" type="password" name="pw"
							required maxlength="8" autocomplete="off" /></td>
					</tr>
					<tr>
						<th><label for="passwordchk">비밀번호 확인</label></th>
						<td><input id="pwchk" type="password"
							name="pw_chk" placeholder="동일하게 입력해주세요." required maxlength="8"
							autocomplete="off" /> <span class="point-successPwChk"></span></td>
					</tr>
	
					<tr>
						<th>이메일</th>
						<td>
							<input id="email-id" class="box"  type="text" value=""/>@ 
							<input id="domain" class="box" type="text" readonly="readonly"/>
							<select class="box" id="domain-list" >
								<option value="email선택" disabled selected>email 선택</option>
								<option value="naver.com">naver.com</option>
								<option value="google.com">google.com</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="kakao.com">kakao.com</option>
								<option value="직접입력">직접입력</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td colspan="2"><input type="text" name="nickname" required />
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td colspan="2">
							<!-- <input id="year" name="birthdate" type="text" required /> -->
							<select id="birthYear">
								<option value="" disabled selected>년</option>
							</select>
							<select id="birthMonth">
								<option value="" disabled selected>월</option>
							</select>
							<select id="birthDay">
								<option value="" disabled selected>일</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td colspan="2"><input type="radio" name="gender" value="남"
							checked />남자 <input type="radio" name="gender" value="여" />여자</td>
					</tr>
					<tr>
						<th><label for="vegan_type">식단 유형</label></th>
						<td colspan="2"><select id="vegan_type" name="vegan_type">
								<option value="1">플루테리언</option>
								<option value="2">비건</option>
								<option value="3">락토</option>
								<option value="4">오보</option>
								<option value="5">락토오보</option>
								<option value="6">폴로</option>
								<option value="7">페스코</option>
								<option value="8">폴로페스코</option>
								<option value="9">플렉시테리언</option>
						</select></td>
					</tr>
					<tr>
						<th>비건 목적</th>
						<td id="v-purpose">
							<input type="radio" name="vegan_purpose" value="질병으로 인한 동물성 식품 섭취불가" />
							<p>질병으로 인한 동물성 식품 섭취불가</p><br/>
							<input type="radio" name="vegan_purpose" value="건강 개선" />
							<p>건강 개선</p><br/>
							<input type="radio" name="vegan_purpose" value="체중 조절 및 미용" />
							<p>체중 조절 및 미용</p><br/>
							<input type="radio" name="vegan_purpose" value="동물 학대를 방지" />
							<p>동물학대를 방지</p><br/>
							<input type="radio" name="vegan_purpose" value="환경 문제" />
							<p>환경 문제</p><br/>
							<input type="radio" name="vegan_purpose" value="개인적인 신념이나 종교" />
							<p>개인적인 신념이나 종교</p>
						</td>
					</tr>
					<tr>
						<th>관심사</th>
						<td id="inter">
							<input type="checkbox" name="interests" value="식당" id="interests1" /> 식당 
							<input type="checkbox" name="interests" value="레시피" id="interest2" /> 레시피 
							<input type="checkbox" name="interests" value="식품" id="interests3" /> 식품
							<br/>
							<input type="checkbox" name="interests" value="뷰티" id="interests4" /> 뷰티 
							<input type="checkbox" name="interests" value="패션" id="interests5" /> 패션 
							<input type="checkbox" name="interests" value="일상" id="interests6" /> 일상
						</td>
					</tr>
	
	
				<!-- 	<tr>
						<td colspan="2" class="agree">
							<input type="checkbox" name="agree" value="1" required /> 
							<span>이용약관 동의</span><br/>
							<input type="checkbox" name="agree" value="2" required /> 
							<span>개인정보 수집, 이용 동의</span><br/>
							<input type="checkbox" name="agree" value="3" required />
							<span>개인정보 이용 동의</span><br/>
						</td>				
					</tr> -->
					<tr>
						<th colspan="3">
							<input type="submit" id="submitBtn" value="JOIN" /> <!-- <input type="button" id="join" value="회원가입"/> -->
						</th>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
	// select 태그의 이메일을 선택할때마다
	$('#domain-list').change(function(){
		console.log('change select val');
		var selectDomain = $(this).val();
		if(selectDomain=='직접입력'){
			$('#domain').attr('readonly',false);
			$('#domain').val('');
			$('#domain').focus();
		}else{
			$('#domain').val(selectDomain);
		}
	});
	
	
	// 생일 년 옵션 생성
	var currentDate = new Date();
	var year = currentDate.getFullYear();
	console.log('currentDate',currentDate);
	console.log('year',year);
	var idx =0;
	for (var i = year; i >= (year - 100); i--) {
		  var option = document.createElement("option");
		  option.value = i + '년';
		  option.text = i + '년';
		  $('#birthYear').append(option);
	}
	// 생일 월 옵션 생성
	for (var i = 1; i <= 12; i++) {
	  var option = document.createElement("option");
	  option.value = i + '월';
	  option.text = i + '월';
	  $('#birthMonth').append(option);
	}

	// 생일 일 옵션 생성
	for (var i = 1; i <= 31; i++) {
	  var option = document.createElement("option");
	  option.value = i + '일';
	  option.text = i + '일';
	  $('#birthDay').append(option);
	}
	
	
	$('.idTrueFalse').on('click', function() {
		var idTrueFalse = $('#id').val();
		console.log(idTrueFalse);
		$.ajax({
			data : {
				idTrueFalse : idTrueFalse
			},
			url : 'idTrueFalse',
			success : function(data) {
				console.log(data.success);
				if (data.success == '0') {
					alert('가입할 수 있는 아이디입니다.');
				} else {
					alert('이미 중복된 아이디 입니다.');
					$('#id').val('');
				}
			},
			error : function(e) {
				console.log('아이디 중복 검사 오류 : ' + e);
			},
		});
	});

	document
			.getElementById("submitBtn")
			.addEventListener(
					"click",
					function(event) {

						var id = document.getElementById("id");
						var regId = /^[a-zA-Z0-9]{4,12}$/;

						// 아이디 확인
						if (id.value == "") {
							alert("아이디를 입력하세요.");
							console.log("아이디를 입력하세요.");
							id.focus();
							return false;
						}
						// 아이디 유효성 검사
						else if (!regId.test(id.value)) {
							alert("4~12자 영문 대소문자, 숫자만 입력하세요.");
							console.log("4~12자 영문 대소문자, 숫자만 입력하세요.");
							id.focus();
							return false;
						}

						// 이메일 입력 필드
						var email = $('#email-id').val()+'@'+$('#domain').val();
						console.log('email 최종 체크',email);

						// 이메일에 '@'가 포함되어 있는지 체크
						if (email.value == "") {
							alert("이메일을 입력하세요.");
							console.log("이메일을 입력하세요.");
							event.preventDefault();
							return false;
						} /* else if (!isEmailValid(email.value)) {
							// '@'가 포함되어 있지 않으면 경고 팝업 띄우기
							alert("이메일은 id@addr.com 형식으로 입력해주세요");
							email.focus();
							event.preventDefault();
							return false;
						} */

						// 생년월일 입력 필드
						var birthdate = $('#birthYear').val()+'-'+$('#birthMonth').val()+'-'+$('#birthDay').val();
							console.log('birthdate',birthdate);

						// 생년월일 형식 체크
					/* 	if (!isValidDate(birthdate.value)) {
							alert("올바른 생년월일 형식의 (yyyy-mm-dd) 숫자로 입력하세요.");
							birthdate.focus();
							event.preventDefault();
							return false;
						} */

						alert("회원가입이 완료되었습니다");

						// 이메일 유효성 체크
						function isEmailValid(email) {
							var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
							return emailRegex.test(email);
						}

						// 생년월일 형식 체크
						function isValidDate(dateString) {
							var dateRegex = /^\d{4}-\d{2}-\d{2}$/;
							return dateRegex.test(dateString);
						}
					});

	// 비밀번호 확인
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