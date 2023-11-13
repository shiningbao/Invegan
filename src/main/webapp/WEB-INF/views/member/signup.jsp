<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<!-- alert ,cofirm 창 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.container{
	width: 1000px;
	margin: 0 auto;
}
.join-title{
    position: absolute;
    font-size: 25px;
    top: -44px;
    right: 233px;
}
#signup-img, #signup-box, h2{
    display: inline-block;
    margin: 24px 7px
}
#signup-img img{
	opacity: 0.7;
    width: 605px;
    height: 750px;
}
#signup-box{
	position: absolute;
    top: 177px;
    right: 235px;
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

#signup-form input:not([type="submit"]):focus{
	border-bottom: 1.5px solid #2daadd;
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
	width: 95px;
	border: none;
}
.box:hover{
	cursor: pointer;
	color:#95df95;
}
#point-successPwChk{
	font-size: 13px;
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
							required maxlength="10" autocomplete="off" /></td>
					</tr>
					<tr>
						<th><label for="passwordchk">비밀번호 확인</label></th>
						<td><input id="pwchk" type="password"
							name="pw_chk" placeholder="동일하게 입력해주세요." required maxlength="10"
							autocomplete="off" /></td>
					</tr>
	
					<tr>
						<th>이메일</th>
						<td>
							<input id="result_email" name="email" type="hidden"/>
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
							<input id="birthdate" class="box" name="birthdate" type="hidden"/>
							<!-- <input id="year" name="birthdate" type="text" required /> -->
							<select id="birthYear" class="box">
								<option value="" disabled selected>년</option>
							</select>
							<select id="birthMonth" class="box">
								<option value="" disabled selected>월</option>
							</select>
							<select id="birthDay" class="box"dddddvc>
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
						<td colspan="2"><select id="vegan_type" class="box" name="vegan_type">
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
			$('#domain').css('cursor','normal');
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
		  option.value = i;
		  option.text = i + '년';
		  $('#birthYear').append(option);
	}
	// 생일 월 옵션 생성
	for (var i = 1; i <= 12; i++) {
	  var option = document.createElement("option");
	  option.value = i;
	  option.text = i + '월';
	  $('#birthMonth').append(option);
	}

	// 생일 일 옵션 생성
	for (var i = 1; i <= 31; i++) {
	  var option = document.createElement("option");
	  option.value = i;
	  option.text = i + '일';
	  $('#birthDay').append(option);
	}
	
	// 아이디 중복 검사
	var idValid = 1;
	
	$('#validateId').on('click', function() {
		var validateId = $('#id').val();
		console.log(validateId);
		if(validateId == ''){
			swal({
              	    title: "아이디를 입력해 주세요.",
              	    text: "",
              	    icon: "error"
              	});
		}else{
			var regex = /^[a-zA-Z0-9_]{6,15}$/;
			if(!regex.test(validateId)){	// 영어또는 '_'만 입력가능 6~15자
				swal({
              	    title: "6자에서 15자까지 영문 또는 \'_\'만 입력 가능합니다",
              	    text: "",
              	    icon: "error"
              	});
				$('#id').val('');
				return false;
			} 
			
			$.ajax({
				data : {validateId : validateId},
				url : 'validateId',
				success : function(data) {
					console.log(data.success);
					if (data.success > 0) {
						swal({
		              	    title: "이미 사용중인 아이디 입니다.",
		              	    text: "",
		              	    icon: "error"
		              	});
						console.log(data.success);
						idValid = data.success;
						$('#id').focus();
					} else {
						swal({
		              	    title: "사용 가능한 아이디입니다.",
		              	    text: "",
		              	    icon: "success"
		              	});
						console.log(data.success);
						idValid = data.success;
					}
				},
				error : function(e) {
					console.log('아이디 중복 검사 오류 : ' + e);
				},
			});
		}
	});
	
	
	

	$("#submitBtn").on("click",function(event) {
			var id = document.getElementById("id");
			var regId = /^[a-zA-Z0-9]{4,12}$/;
			console.log('valid stat ',idValid);
			
			if(idValid == 0){
				// 이메일 입력 필드
				var email = $('#email-id').val()+'@'+$('#domain').val();
				$('#result_email').val(email);
				console.log('email 최종 체크',email );

 				// 생년월일 입력 필드
				var birthdate = $('#birthYear').val()+'-'+$('#birthMonth').val()+'-'+$('#birthDay').val();
					$('#birthdate').val(birthdate);
			}else{
				swal({
              	    title: "아이디 중복 체크를 해주세요",
              	    text: "",
              	    icon: "error"
              	});
				return false;
			};
			
				
	});	
		
			
</script>
</html>