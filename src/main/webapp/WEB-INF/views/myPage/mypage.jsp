<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<!-- bootstrap : 디자인을 위한 프레임워크 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="<c:url value='/resources/js/jquery.twbsPagination.js'/>" type="text/javascript"></script>
<style>

		.container {
		    display: flex;
		    justify-content: space-evenly;
		    align-items: baseline;
		    flex-direction: column;
		    position: relative;
		}
		
        .profileContainer {
            display: flex;
            justify-content: center;
		    align-items: center;
		    position: relative;
		    height: 187px;
		    width: 100%; 
		    margin: 67px 0;
        }

        .profileImage {
            top: -10px;
    		right: 1123px;
    		position: absolute;
        }

        .userInfo {
        	top: 1px;
        	right: 582px;
            font-size: 18px;
            margin-top: 27px;
            margin-left: -55px;
            width: 400px;
            position: absolute;
          
        }
        
        .additionalInfo{
        	top: 1px;
        	right: 2px;
         	font-size: 18px;
         	margin-top:27px;
        	margin-left: 657px;
        	position: absolute;
        	width:492px;
        	
        }
        
        .changeInfo{
	         position: absolute;
			 top: 324px; 
			 left: 1032px;
			 cursor: pointer;
			 font-size: 18px;
			 font-weight: bold;
        }
        .modal {
		    display: none;
		    position: fixed;
		    z-index: 1;
		    left: 0;
		    top: 0;
		    width: 100%;
		    height: 100%;
		    overflow: auto;
		    background-color: rgba(0,0,0,0.4);
		}

		.modal-content {
			position: relative;
		    background-color: white;
		    margin: 6% auto;
		    padding: 20px;
		    border: 1px solid #888;
		    width: 50%;
		}

		.close {
			position: absolute;
		    top: 10px;
		    right: 10px;
		    color: black;
		    font-size: 40px;
		    font-weight: bold;
		    cursor: pointer;
		}
		.changeNickname {
			cursor: pointer;
		}
		ul.tabs{
			margin: 0px;
			padding: 0px;
			list-style: none;
		}
		ul.tabs li{
			background: none;
			color: #222;
			display: inline-block;
			padding: 10px 15px;
			margin: -3px;
			cursor: pointer;
			border: solid aquamarine;
			border-bottom: none;
		}
		
		ul.tabs li.current{
			background: white;
			color: black;
			width: 173px; 
		    height: 40px; 
		    line-height: 40px; 
		    font-weight: bold;
		    position: relative;
		}

		.button {
		    position: absolute;
		    top: 105px;
		}
		
		
		.tab-content{
			display: none;
			background: white;
			padding: 15px;
		}
		
		.tab-content.current{
			display: inherit;
		}
		
		.container{
			display: flex;
			height: 102px;
	        width: 1200px;
	        right: -137px;
		    margin: 67px;
		    flex-wrap: inherit;
		    justify-content: space-evenly;
		    flex-direction: column;
		    align-items: baseline;
		    position: relative;
		}
		
		table,td{
			border : 1px solid black;
			border-collapse : collapse;
			padding : 5px 10px;
			border-left:0;
			border-right:0;
			border-bottom:0;
			
		}
		
		#ListContainer {
			display: none;
		    position: absolute;
		    top: 170px;
		    right: -29px;
		    width: 1200px;
		}
		
		.titleLink{
			cursor: pointer;
		}
		
		.h3, h3 {
    		font-size: 22px;
		}
		
		.delUser{
		  	position: absolute;
			top: 90px; 
			left: 1157px;
			cursor: pointer;
			font-size: 14px;
		}
		
		.profile img{
			width: 40px;
			border-radius:50%;
			margin: 5px;
		}
		
		.is_admin{
			position: absolute;
			top: 7px;
			right:445px;
			font-size: 14px;
			text-decoration: underline;
			text-decoration-color: aquamarine; 
        	text-decoration-thickness: 2px;
			
		}
		#myInfo{
			border : 0;
			border-collapse : collapse;
		}
		
		 #profileImg{
			border-radius: 50%;
			margin: 5px;
		 }
		 
		 .profileImgUpdate{
		 	font-weight: bold;
		 	font-size: 70px;
		 	top: 76px;
		 	right : 710px;
		 	position : absolute;
		 	cursor : pointer;
		 }
		 
		 .updateNickname{
		 	width: 82px;
		 }
		 
		 .completePw{
		 	width: 104px;
		 }
		 
		 .save{
		 	width: 80px;
		 }
		 
		 .pagination{
		 	display: none;
   			padding-left: 0;
		    margin: 20px 0;
		    border-radius: 4px;
		    width: 279px;
		    position: absolute;
		    top:700px;
		    left: 549px;
		 }
		
		
    </style>
</head>
<body>
<c:import url="/main/header" />
 <h3>마이페이지</h3>
 
 	<c:set var="profileImage" value="${dto.profile_image}" />
	<div class="profileContainer">
	
  	<div class="profileImage">
        <img src="/photo/${profileImage}" width="200" height="200">
    </div>
    
   	<div class="userInfo">
        <label>가입 날짜 :</label> ${dto.join_date}<br>
        <label>아이디 : </label> ${dto.id}<br>
        <label>생년월일 : </label> ${dto.birthdate}<br>
        <label>성별 : </label> ${dto.gender}<br>
    </div>
    
    <div class="is_admin">
	    <c:choose>
	        <c:when test="${dto.is_admin==1}">
	            관리자
	        </c:when>
	        <c:otherwise>
	            일반회원
	        </c:otherwise>
	    </c:choose>
    </div>
   
   	<div class="additionalInfo">
        <label>닉네임 : </label> ${dto.nickname}<br>
        <label>비건타입 : </label> ${dto.vegan_type}<br>
        <label>비건목적 </label><br>${dto.vegan_purpose}<br>
        <label>관심사</label><br>${dto.interests}
		<input type="hidden" name="id" value="${dto.id}"/>
		<input type="hidden" name="user_no" value="${dto.user_no}"/>

    </div>
	</div>
	<div class="changeInfo">회원정보 변경</div>
	<div class="delUser" onclick="confirmDelete(${user.user_no})">회원탈퇴</div>
	
	<div class="modal" id="updateModal">
    <div class="modal-content">
        <h1>회원정보변경</h1>
        <hr>
        	<img src="" id= profileImg width="150" height="150">
        	<div class="profileImgUpdate">+</div>
        	<input type="file" id="photos" name="photos" style="display: none">
        	<label>닉네임 : <input type="text" name="nickname" value="${user.nickname}"/></label>
        	<input type="button" id="overlay" value="중복체크"/>
        	<p>
        	<div class= "updateNickname" style= cursor:pointer>닉네임변경</div>
        	<label>현재 비밀번호 <input type="text" name="password" value=""/></label>
        	<input type="button" id="pwConfirm" value="확인"/>
        	<p>
        	<label>변경 비밀번호 <input type="text" name="updatePw"/></label>
        	<p>
    		<label>변경 비밀번호 확인<input type="text" name="updatePwConfirm"/></label>
    		<div class="completePw" style=cursor:pointer>비밀번호 변경</div>
    		<table id=myInfo>
    		<tr>
				<td>나의 관심사</td>
				<td colspan="2">
				<input type="checkbox" name="interests" value="식당" id="interests"/> 식당
				<input type="checkbox" name="interests" value="레시피" id="interests"/> 레시피
				<input type="checkbox" name="interests" value="식품" id="interests"/> 식품
				<p>
				<input type="checkbox" name="interests" value="뷰티" id="interests"/> 뷰티
				<input type="checkbox" name="interests" value="패션" id="interests"/> 패션
				<input type="checkbox" name="interests" value="일상" id="interests"/> 일상
				</td>
			</tr>
			<tr>
			<td><label for"vegan_type">나의 비건 단계</label></td>
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
				<td>나의 비건 목적</td>
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
			</table>
			<div class="save" style=cursor:pointer>저장하기</div>
     
        <span class="close">&times;</span>
    </div>
	</div>
	
	 
	
	
<div class="container">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">작성한 글 모아보기</li>
		<li class="tab-link" data-tab="tab-2">댓글 모아보기</li>
		<li class="tab-link" data-tab="tab-3">나의 스크랩</li>
	</ul>
	
	<div id="tab-1" class="tab-content current">
		<h3>내가 작성한 글 보기</h3>
		<div class="button">
			<input type="button" id= "requestBtn" value="요청"/>
			<input type="button" id= "recipeBtn" value="레시피"/>
			<input type="button" id = "freeBtn" value="자유게시판"/>
			<input type="button" id = "feed" value="피드"/>
		</div>
	</div>
	
	<div id="tab-2" class="tab-content">
		<h3>내가 작성한 댓글 보기</h3>
		<div class="button">
			<input type="button" value="레시피"/>
			<input type="button" value="식당"/>
			<input type="button" value="자유게시판"/>
			<input type="button" value="피드"/>
		</div>
	</div>
		
	<div id="tab-3" class="tab-content">
		<h3>내가 스크랩한 글 보기</h3>
		<div class="button">
			<input type="button" value="레시피"/>
			<input type="button" value="식당"/>
		</div>
	</div>
	
	<!-- list 그리는 부분 -->
	<div id="ListContainer">
	</div>
	
</div> <!-- container영역  -->
	
	<div class="pageContainer">									
		<nav aria-label="Page navigation" style="text-align:center">
			<ul class="pagination" id="pagination"></ul>
		</nav>					
	</div>
<c:import url="/main/footer" />	
</body>
	
<script>
var showPage = 1;


var modal = document.getElementById("updateModal");

// 회원정보변경 클릭시 모달창 열림
$('.changeInfo').on('click',function(){
	modal.style.display = "block";
});
    
// x 클릭시 모달창 닫힘
$('.close').on('click',function(){
	modal.style.display = "none";
});

// 다른 영역 클릭시 모달창 닫힘
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

/* $('.profileImgUpdate').on('click', function(){
    $('#photos').click();
});

$('#photos').on('change', function() {
    var user_no = $('input[name="user_no"]').val();
    var photos = $('#photos')[0].files[0];
    
    var formData = new FormData();
    formData.append('user_no', user_no);
    formData.append('photos', photos);

    $.ajax({
        type: 'post',
        url: 'imgUpload',
        data: formData,
        contentType: false,
        processData: false,
        success: function(data) {
            console.log(data);
        },
        error: function(error) {
            console.log(error);
        }
    });
}); */

// 닉네임 중복체크 
$('#overlay').on('click',function(){
	var nickname = $('input[name="nickname"]').val();
	console.log('nickname='+nickname);
	
	$.ajax({
		type:'get', 
		url:'overlay',
		data:{'nickname':nickname}, // parameter
		dataType:'JSON',
		success: function(data){
			console.log(data);
			overlayChk = data.use;
			if(data.use){
				alert('사용할 수 있는 닉네임 입니다.');
			}else{
				alert('중복된 닉네임 입니다.');
				$('input[name="nickname"]').val('');
			}
		}, 
		error: function(error){
			console.log(error);
		}
	});
});
// 닉네임 변경 
$('.updateNickname').on('click',function(){
	var nickname = $('input[name="nickname"]').val();
	var user_no = $('input[name="user_no"]').val();
	console.log('nickname='+nickname);
	
	$.ajax({
		type:'get', 
		url:	'updateNickname',
		data:{ 'nickname':nickname,
				  'user_no':user_no
		},
		dataType:'JSON',
		success: function(data){
			console.log(data);
			if(data.cnt==1){
				alert('닉네임이 변경 되었습니다.');}
		}, 
		error: function(error){
			console.log(error);
		},
	});
});
// 패스워드 확인
$('#pwConfirm').on('click',function(){
	var pw = $('input[name="password"]').val();
	var user_no = $('input[name="user_no"]').val();
	console.log('pw='+pw);
	
	$.ajax({
		type:'get', 
		url:	'pwConfirm',
		data:{ 'pw':pw,
				  'user_no':user_no
		},
		dataType:'JSON',
		success: function(data){
			console.log(data);
			if(data.crPw==pw){
				alert('현재 비밀번호와 일치합니다.');
			}else{
				alert('현재 비밀번호와 일치하지 않습니다.');
			}
	
		}, 
		error: function(error){
			console.log(error);
		},
	});
});
// 패스워드 변경 
$('.completePw').on('click',function(){
	var pw = $('input[name="password"]').val();
	var user_no = $('input[name="user_no"]').val();
	var updatePw = $('input[name="updatePw"]').val();
	var updatePwConfirm = $('input[name="updatePwConfirm"]').val();
	console.log(user_no+'/'+updatePw+'/'+updatePwConfirm);
	
	$.ajax({
		type:'get', 
		url:	'completePw',
		data:{'user_no':user_no,
				 'pw':pw,
				 'updatePw':updatePw,
				 'updatePwConfirm':updatePwConfirm
		},
		dataType:'JSON',
		success: function(data){
			console.log(data);
			if(data.completePw==1){
				alert('비밀번호가 변경 되었습니다.');
			}else{
				alert('변경할 비밀번호가 서로 다릅니다. 다시 한 번 확인해주세요.');
			}
			
		}, 
		error: function(error){
			console.log(error);
		},
	});
});
// 회원 정보 변경 저장하기 
$('.save').on('click',function(){
	modal.style.display = "none";
	var user_no = $('input[name="user_no"]').val();
	 var interests = [];
	    $('input[name="interests"]:checked').each(function() {
	        interests.push($(this).val());
	    });
	    var vegan_type = $('select[name="vegan_type"]').val();
	    var vegan_purpose = $('input[name="vegan_purpose"]:checked').val();
	    console.log(user_no + '/' + interests + '/' + vegan_type + '/' + vegan_purpose);
	    
	    var param = {
	        user_no: user_no,
	        vegan_type: vegan_type,
	        vegan_purpose: vegan_purpose,
	        interests: JSON.stringify(interests) // 배열을 JSON 문자열로 변환 
	    };
	
	$.ajax({
		type:'get', 
		url:	'save',
		data: param,
		dataType:'JSON',
		success: function(data){
			console.log(data);
			if(data.cnt>0){
				alert('변경이 완료 되었습니다.');
				location.reload();
			}
			
		}, 
		error: function(error){
			console.log(error);
		},
	});
});

// tab 클릭 부분 
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
		
		$('#ListContainer').hide();
	});

});




	let boardType;
	// 게시판 버튼 클릭
	$('.button input[type="button"]').on('click', function() {
	    boardType = $(this).val();
	    const tabType = $('.tabs li.current').text();
	    const user_no = $('input[name="user_no"]').val();
	    let page = 1; // 페이지 초기값 설정
	    console.log(boardType+tabType+user_no);

    	listCall(boardType,tabType,user_no,page);
});

	// 리스트 
	function listCall(boardType,tabType,user_no,page){

	$.ajax({
	    type: 'GET',
	    url: 'listCall',
	    data:{
	    	'boardType':boardType,
	    	'tabType':tabType,
	    	'user_no':user_no,
	    	'page':page
	    },
	    dataType: 'JSON',
	    success: function(data) {
	      console.log(data);
	      drawList(data);
	      $('#ListContainer').show(); // 리스트 보여주기
	      $('.pagination').show(); 
	    },
	    error: function(error) {
	        console.log(error);
	    }
	});
	}

	// 회원탈퇴
	function confirmDelete(user_no) {
	    var result = confirm('정말 탈퇴하시겠습니까? "확인"을 선택하시면 탈퇴가 완료 됩니다.');

	    if (result) {
	        // 사용자가 '확인'을 눌렀을 때의 처리
	        alert('탈퇴가 완료 되었습니다.')
	        location.href = './delUser?user_no=' + user_no;
	    } else {
	        // 사용자가 '취소'를 눌렀을 때의 처리
	        alert('탈퇴가 취소 되었습니다.');
	    }
}
	        
	function drawList(list) {
	    console.log(list);
	    var content = '';
	    
	    var activeButton = $('.button input[type="button"]:focus').val();
	    
	     /*  if (!Array.isArray(list)) {
	        list = Object.values(list); // 객체의 값들을 배열로 변환
	    }   */
	    
	    list.forEach(function(item, idx) {
	    	
	    	content += '<tr>';
	        switch (activeButton) {
	            case '요청':
	                content += '<td>' + item.req_title + '</td>';
	                console.log(item.req_title);
	                break;
	           /*  case '레시피':
	            case '자유게시판': 
	                content += '<td>' + item.title + '</td>';
	                break; */
	            /* case '피드':
	                content += '<td><img src="/photo/' + item.server_file_name + '" alt="image"></td>';
	                content += '<td>' + item.content + '</td>';
	                content += '<td class="profile"><img src="/photo/' + item.profile_image + '" alt="image">' + item.nickname + '</td>';
	                break;
	            case '식당':
	                content += '<td><img src="/photo/' + item.server_file_name + '" alt="image"></td>';
	                content += '<td>' + item.title + '</td>';
	                content += '<td>' + item.vegan_type + '</td>';
	                content += '<td>' + item.rating + '</td>';
	                break; */
	                
	            default:
	                break;
	        }
	        content += '<td>' + '조회수 ' + item.views + '</td>';
	        content += '</tr>';
	    });
	    $('#ListContainer').empty(); // empty() 내가 선택한 요소의 자식요소들을 비운다.
	    $('#ListContainer').append(content);
	   
	    $('#pagination').twbsPagination({
			startPage: showPage, // 보여줄 페이지
			totalPages:list.pages>0?list.pages:1, // 총 페이지 수 (총갯수/페이지당 보여줄 게시물 수 ) : 서버에서 계산해서 가져와야함
			visiblePages:5, // [1][2][3][4][5] 
			onPageClick:function(e,page){ // 번호 클릭시 실행할 내용
				// console.log(e);
				if(showPage != page){
				console.log(page);
				showPage = page;
				listCall(page);
				}
			}
		});
	    
	    
/* 	    $('#ListContainer').html(content);
 */	    
	 // 페이징 처리 UI 그리기(플러그인 사용)
		/* $('#pagination').twbsPagination({
			startPage: showPage, // 보여줄 페이지
			totalPages:list.pages>0?list.pages:1, // 총 페이지 수 (총갯수/페이지당 보여줄 게시물 수 ) : 서버에서 계산해서 가져와야함
			visiblePages:5, // [1][2][3][4][5] 
			onPageClick:function(e,page){ // 번호 클릭시 실행할 내용
				// console.log(e);
				if(showPage != page){
				console.log(page);
				showPage = page;
				pageList(page);
				}
			}
		}); */
	        	}
	
 
</script>
</html>