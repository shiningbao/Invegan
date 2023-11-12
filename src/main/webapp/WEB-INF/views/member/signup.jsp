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

body {
    background-color: #edf0ef;
    display: flex; /* display: flex 추가 */
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}



input[type="submit"] {
    background-color: #4682b4;
    color: #fff;
    border: none;
    cursor: pointer;
    padding: 10px;
    margin: 10px;
}

input[type="submit"]:hover {
    background-color: #36648b; /* hover */
}


button {
    background-color: #4682b4;
    color: #fff;
    border: none;
    cursor: pointer;
    padding: 10px;
    margin: 10px;
}

button:hover {
    background-color: #36648b; /* hover */
}

</style>
</head>
<body>
	<form action="signup2" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<th><input type="text" required name="id" id="id"/></th>
				<td>
				<button id="validateId" class="idTrueFalse">아이디 중복체크</button>
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
				<!--
				<input class="box" id="domain-txt" type="text" name="email" value=""/>@ 
				<select class="box" id="domain-list">
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="kakao.com">kakao.com</option>
				</select>
				 -->
				 <input id="email" type="text" name="email" placeholder="0000@0000 형식으로 입력"/>
				</th>
			</tr>
			<tr>
				<th>닉네임</th>
				<th colspan="2">
				<input type="text" name="nickname" required/>
				</th>
			</tr>
			<tr>
				<th>생년월일</th>
				<th colspan="2">
				<input id="year" name="birthdate" type="text" placeholder="yyyy-mm-dd 형식으로 입력" required/>
				</th>
			</tr>
			<tr>
				<th>성별</th>
				<td colspan="2">
					<input type="radio" name="gender" value="남" checked />남자 
					<input type="radio" name="gender" value="여" />여자
				</td>
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
					<p>
					<input type="radio" name="vegan_purpose" value="질병으로 인해" />질병으로 인해
					동물성 식품을 먹지 못함
					</p>
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
					<p>
					<input type="radio" name="vegan_purpose" value="개인적인 신념이나 종교" />개인적인 신념이나 종교
					</p>
				</td>
			</tr>
			<tr>
				<th>관심사</th>
				<td colspan="2">
				 <p>
				<input type="checkbox" name="interests" value="식당" id="interests1"/> 식당
				<input type="checkbox" name="interests" value="레시피" id="interest2"/> 레시피
				<input type="checkbox" name="interests" value="식품" id="interests3"/> 식품
				</p>
				<p>
				<input type="checkbox" name="interests" value="뷰티" id="interests4"/> 뷰티
				<input type="checkbox" name="interests" value="패션" id="interests5"/> 패션
				<input type="checkbox" name="interests" value="일상" id="interests6"/> 일상
				</p>
				
				
				</td>
			</tr>
			
			
			<tr>
				<td colspan="3">
				<label for="agree">
						<p>
							<input type="checkbox" name="agree" value="1" required/> 
							<span>이용약관 동의<strong></strong>
							</span>
						</p>
				</label> 
				<label for="agree">
						<p>
							<input type="checkbox" name="agree" value="2" required/> 
							<span>개인정보 수집, 이용 동의<strong></strong>
							</span>
						</p>
				</label> 
				<label for="agree">
						<p>
							<input type="checkbox" name="agree" value="3" required/> 
							<span>개인정보 이용 동의<strong></strong>
							</span>
						</p>
			</tr>
			<tr>
				<th colspan="3">
					<input type="submit" id="submitBtn" value="회원가입" />
					<!-- <input type="button" id="join" value="회원가입"/> -->
				</th>
			</tr>
		</table>
	</form>
</body>
<script>
$('.idTrueFalse').on('click', function () {
    var idTrueFalse = $('#id').val();
    console.log(idTrueFalse);
    $.ajax({
    	data :{idTrueFalse : idTrueFalse},
    	url : 'idTrueFalse',
    	success:function(data){
    		console.log(data.success);
    		if(data.success=='0'){
    			alert('가입할 수 있는 아이디입니다.');
    		}else{
    			alert('이미 중복된 아이디 입니다.');
    			$('#id').val('');
    		}
    	},
    	error:function(e){
    		console.log('아이디 중복 검사 오류 : '+ e);
    	},
    });
});

document.getElementById("submitBtn").addEventListener("click", function (event) {
    
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
    var email = document.getElementById("email");

    // 이메일에 '@'가 포함되어 있는지 체크
    if (email.value == "") {
        alert("이메일을 입력하세요.");
        console.log("이메일을 입력하세요.");
        event.preventDefault(); 
        return false;
    } else if (!isEmailValid(email.value)) {
        // '@'가 포함되어 있지 않으면 경고 팝업 띄우기
        alert("이메일은 id@addr.com 형식으로 입력해주세요");
        email.focus(); 
        event.preventDefault(); 
        return false;
    }

    // 생년월일 입력 필드
    var birthdate = document.getElementById("year");

    // 생년월일 형식 체크
    if (!isValidDate(birthdate.value)) {
        alert("올바른 생년월일 형식의 (yyyy-mm-dd) 숫자로 입력하세요.");
        birthdate.focus(); 
        event.preventDefault(); 
        return false;
    }

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
$("#userpasschk").blur(function () {
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