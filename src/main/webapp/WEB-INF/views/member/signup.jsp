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
	<form action="signup" method="post">
		<table>
			<tr>
				<th>아이디</th>
				<th><input type="text" name="id" /></th>
			</tr>
			<tr>
	<th>
		<label for="userpass">비밀번호</label>
	</th>
	<td>
		<input id="userpass" type="password" name="sm_pw"  required maxlength="8" autocomplete="off"/>
		
	</td>
</tr>
<tr>
	<th>
		<label for="userpasschk">비밀번호 확인</label>
	</th>
	<td>
		<input id="userpasschk" type="password" name="sm_pw_chk" placeholder="동일하게 입력해주세요." required maxlength="8" autocomplete="off"/>
		<span class="point successPwChk"></span>
	</td>
</tr>

<tr class="email">
	<th>
		<label for="useremail">이메일</label>
	</th>
	<td>
		<p>
			<input id="sm_email" type="text" name="sm_email" title="이메일 주소를 입력해주세요." required/>
			<button id="emailChk" class="doubleChk">인증번호 보내기</button><br/>
			<input id="sm_email2" type="text" name="sm_email2" title="인증번호 입력" disabled required/>
			<span id="emailChk2" class="doubleChk">이메일인증</span>
			<span class="point successEmailChk">이메일 입력 후 인증번호 보내기를 해주세요.</span>
			<input type="hidden" id="emailDoubleChk"/>
		</p>
		<!--
		<p class="tip">
			아이디 비밀번호 분실시 필요한 정보이므로, 정확하게 기입해 주십시오.
		</p>
		 -->
	</td>
</tr>
			<tr>
				<th>이메일 -- 메일 주소 선택할 수 있게</th>
				<th><input class="box" id="domain-txt" type="text" />@ 
				<select
					class="box" id="domain-list">
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
				<th><input type="text" name="name" /></th>
			</tr>
			<tr>
				<th>생년월일 -- 년/월/일 선택할 수 있게</th>
				<th>
					<span style="display: flex;">
                    <span class="signup-input-birth">
                        <input id="signup-birth-yy" type="text" placeholder="년(4자)"></input>
                    </span>
                    <span class="signup-input-birth" style="margin-left: 10px;">
                        <select id="signup-birth-mm" class="selectbox" name="month" onchange="">
                            <option value="month">월</option>
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
                        </select>
                    </span>
                    <span class="signup-input-birth" style="margin-left: 10px;">
                        <input id="signup-birth-dd" type="text" placeholder="일"></input>
                    </span>
                </span>

				</th>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="남" checked />남자 <input
					type="radio" name="gender" value="여" />여자</td>
			</tr>
			<tr>
				<th>비건 목적</th>
				<td><input type="radio" name="intention" value="질병" />질병으로 인해
					동물성 식품을 먹지 못해서
					<p>
						<input type="radio" name="intention" value="건강" />건강을 개선하기 위해 또는
						질병을 예방하기 위해
					</p>
					<p>
						<input type="radio" name="intention" value="미용" />체중 조절 및 다이어트,
						미용을 위해
					</p>
					<p>
						<input type="radio" name="intention" value="동물" />동물 권리를 존중하고 동물
						학대를 방지하기 위해
					</p>
					<p>
						<input type="radio" name="intention" value="지구" />축산업이 환경에 미치는 영향을
						줄이고 지구의 생태계를 지키기 위해
					</p> <input type="radio" name="intention" value="종교" />개인적인 신념이나 종교,
					사상의 이유로</td>
			</tr>
			<tr>
				<th>관심사</th>
				<td>
				<input type="checkbox" name="restaurant" />식당 
				<input
					type="checkbox" name="recipe" />레시피 
					<input type="checkbox" name="food" />식품
					<p>
					<input type="checkbox" name="beauty" />뷰티 
					<input type="checkbox" name="fashion" />패션 
					<input type="checkbox" name="daily" />일상
				</td>
			</tr>
			<tr>
				<td colspan="2"><label for="agree">
						<p>
							<input type="checkbox" name="agree" value="1"> <span>이용약관
								동의<strong>(필수)</strong>
							</span>
				</label> <label for="agree">
						<p>
							<input type="checkbox" name="agree" value="2"> <span>개인정보
								수집, 이용 동의<strong>(필수)</strong>
							</span>
				</label> <label for="agree">
						<p>
							<input type="checkbox" name="agree" value="3"> <span>개인정보
								이용 동의<strong>(필수)</strong>
							</span>
				</label> <label for="agree">
						<p>
							<input type="checkbox" name="agree" value="4"> <span>이벤트,
								혜택정보 수신동의<strong class="select_disable">(선택)</strong>
							</span>
				</label></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="회원가입" /></th>
			</tr>
		</table>
	</form>
</body>
<script>

//비밀번호 확인
$("#userpasschk").blur(function(){
	if($("#userpasschk").val() == $("#userpass").val()){
		$(".successPwChk").text("비밀번호가 일치합니다.");
		$(".successPwChk").css("color", "green");
	}else{
		$(".successPwChk").text("비밀번호가 일치하지 않습니다.");
		$(".successPwChk").css("color", "red");
	}
});

//url!!!!!!!!!!
//이메일 인증
var code = "";
$("#emailChk").click(function(){
	var sm_email = $("#sm_email").val();
	$.ajax({
        type:"GET",
        url:"mailCheck?sm_email=" + sm_email,
        cache : false,
        success:function(data){
        	if(data == "error"){
        		alert("이메일 주소가 올바르지 않습니다. 유효한 이메일 주소를 입력해주세요.");
				$("#sm_email").attr("autofocus",true);
				$(".successEmailChk").text("유효한 이메일 주소를 입력해주세요.");
				$(".successEmailChk").css("color","red");
        	}else{	        		
				alert("인증번호 발송이 완료되었습니다.\n입력한 이메일에서 인증번호 확인을 해주십시오.");
        		$("#sm_email2").attr("disabled",false);
        		$("#emailChk2").css("display","inline-block");
        		$(".successEmailChk").text("인증번호를 입력한 뒤 이메일 인증을 눌러주십시오.");
        		$(".successEmailChk").css("color","green");
        		code = data;
        	}
        }
    });
});

//이메일 인증번호 대조
$("#emailChk2").click(function(){
	if($("#sm_email2").val() == code){
		$(".successEmailChk").text("인증번호가 일치합니다.");
		$(".successEmailChk").css("color","green");
		$("#emailDoubleChk").val("true");
		$("#sm_email2").attr("disabled",true);
		$("#sm_email").attr("disabled",true);
	}else{
		$(".successEmailChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
		$(".successEmailChk").css("color","red");
		$("#emailDoubleChk").val("false");
		$("#sm_email2").attr("autofocus",true);
	}
});

</script>
</html>