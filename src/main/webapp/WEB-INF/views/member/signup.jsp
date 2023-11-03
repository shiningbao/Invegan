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
				<th><input type="text" name="id" /></th>
				<button id="validateId">아이디 유효성 검사</button>
				<p id="validationMessage"></p>
			</tr>
			
			<tr>
				<th><label for="userpass">비밀번호</label></th>
				<td><input id="userpass" type="password" name="pw" required maxlength="8" autocomplete="off" /></td>
			</tr>
			<tr>
				<th><label for="userpasschk">비밀번호 확인</label></th>
				<td>
					<input id="userpasschk" type="password" name="pw_chk" placeholder="동일하게 입력해주세요." required maxlength="8" autocomplete="off" /> 
					<span class="point successPwChk"></span>
				</td>
			</tr>
<!-- 
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
 -->			
			<tr>
				<th>이메일</th>				
				<th>
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
				<th><input type="text" name="nickname" /></th>
			</tr>
			<tr>
				<th>생년월일</th>
				<th>
				<input id="year" name="birthdate" type="text" placeholder="yyyy-mm-dd 형식으로 입력"></input>
				<!-- 
				<span style="display: flex;"> 
					<span class="signup-input-birth" > 
						<input id="year" name="birthdate" type="text" placeholder="년(4자)"></input>년
					</span> 
					<span class="signup-input-birth" style="margin-left: 10px;">
							<select name="month" id="month">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
						</select>월 
						<select name="day" id="day">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">21</option>
								<option value="22">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
								<option value="25">25</option>
								<option value="26">26</option>
								<option value="27">27</option>
								<option value="28">28</option>
								<option value="29">29</option>
								<option value="30">30</option>
								<option value="31">31</option>
						</select>일
					</span> -->
				</span></th>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="남" checked />남자 <input
					type="radio" name="gender" value="여" />여자</td>
			</tr>
			<tr>
			<th><label for"vegan_type">식단 유형</label></th>
				<td>
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
				<td>
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
				<td>
				<!--<input type="checkbox" name="restaurant" />식당  -->
<!-- 				<input type="checkbox" name="recipe" />레시피 <input type="checkbox" name="food" />식품 -->
<!-- 					<p> -->
<!-- 						<input type="checkbox" name="beauty" />뷰티 <input type="checkbox" name="fashion" />패션  -->
<!-- 						<input type="checkbox" name="daily" />일상 -->
					<input  type="text"  id="interests"name="interests"  />
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<label for="agree">
						<p>
							<input type="checkbox" name="agree" value="1"> 
							<span>이용약관 동의<strong></strong>
							</span>
				</label> 
				<label for="agree">
						<p>
							<input type="checkbox" name="agree" value="2"> 
							<span>개인정보 수집, 이용 동의<strong></strong>
							</span>
				</label> 
				<label for="agree">
						<p>
							<input type="checkbox" name="agree" value="3"> <span>개인정보 이용 동의<strong></strong>
							</span>
			</tr>
			<tr>
				<th colspan="2">
					<!-- <input type="submit" value="회원가입" /> -->
					<input type="button" id="join" value="회원가입"/>
				</th>
			</tr>
		</table>
	</form>
</body>
<script>


//임시
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
	
	document.getElementById("validateId").addEventListener("click", function() {
    // 입력 필드에서 아이디 값을 가져오기
    var idField = document.getElementById("idField");
    var id = idField.value;

    // 정규 표현식을 사용하여 유효성 검사
    var regex = /^[A-Za-z0-9]{4,12}$/;
    
    if (regex.test(id)) {
        document.getElementById("validationMessage").textContent = "유효한 아이디입니다.";
    } else {
        document.getElementById("validationMessage").textContent = "아이디는 4~12글자의 영어와 숫자만 허용됩니다.";
    }
});
	

	//유효성 검사 메서드
	function Validation() {
		var id = document.getElementById("id");

		//4글자~12글자 영어, 숫자
		var regId = /^[a-zA-Z0-9]{4,12}$/;

		//아이디 확인
		if (id.value == "") {
			alert("아이디를 입력하세요.")
			id.focus();
			return false;
		}
		//아이디 영어 대소문자 확인
		else if (!regId.test(id.value)) {
			alert("4~12자 영문 대소문자, 숫자만 입력하세요.")
			id.focus();
			return false;
		}

	}

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
/*
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
	
	*/
</script>
</html>