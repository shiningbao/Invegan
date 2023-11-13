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

	#container{
		position : relative;
		width: 1000px;
		margin: 0px auto;
	}
	.profileContainer {
		position : absolute;
		height: 270px;
		width: 100%;
		background-color : #d8f3ec;
		border : solid #b0b5b4;
		border-radius : 17px;
		
	}
      
	.myPageImg{
		position : absolute;
		top : 20px;
		bottom : 20px;
		left : 20px;
		width : 180px;
	
	}
      
	.userInfo {
		position : absolute;
		top: 30px;
		left : 300px;
		font-size: 18px;
		width: 221px;
  
}
      
	.additionalInfo{
		position : absolute;
		top: 30px;
		right: -115px;
		font-size: 18px;
		width : 336px;
      	
}
      
	.is_admin{
		position : absolute;
		top: 10px;
		right: 177px;
		font-size: 14px;
		text-decoration: underline;
		text-decoration-color: #08ffb3; 
		text-decoration-thickness: 2px;
	
}
      
	.delUser{
		position : absolute;
		top: 15px;
		right: -24px;
		cursor: pointer;
		font-size: 14px;
		width : 80px;
}

	.changeInfo{
		position : absolute;
		top: 312px; 
		right: -9px;
		cursor: pointer;
		font-size: 18px;
		font-weight: bold;
		width : 120px;
}
	
	/* .tabContainer {
		position : absolute;
		top : 383px;


} */

	ul.tabs{
		position : absolute;
		top : 383px;
		margin: 0px;
		padding: 0px;
		list-style: none;
}

	ul.tabs li{
		display: inline-block;
		padding: 10px 15px;
		margin: -3px;
		cursor: pointer;
		border: solid #b0b5b4;
		border-radius : 5px;
		border-bottom: none;
		background-color : #d8f3ec;
}

	ul.tabs li.current{
		width: 173px; 
	    height: 53px; 
	    line-height: 40px; 
	    font-weight: bold;
	    border: solid #b0b5b4;
		border-bottom-color : #d8f3ec;
}

	.tab-content{
		position : absolute;
		display: none;
}
 
	.tab-content.current{
	position : absolute;
	top : 436px;
	display: inherit;
}
 
	.tab-1{
	position : absolute;
	display: flex;
	height: 102px;
    width: 1200px;
    right: -137px;
    margin: 67px;
    flex-wrap: inherit;
    justify-content: space-evenly;
    flex-direction: column;
    align-items: baseline;
   
}

 	/* .button{
		position : absolute;
		top : 490px;
		background-color : red;
		width : 100px;
	}  */
	
	#feedBtn{
		position : absolute;
		top : 57px;
		background-color : white;
		border-radius : 8px;
		border : 2px solid #caeada;
		width : 50px;
}
		
	#restaurantBtn{
		position : absolute;
		top : 57px;
		left : 54px;
		background-color : white;
		border-radius : 8px;
		border : 2px solid #caeada;
		width : 50px;
} 

	.feedTable td,
	.feedTable tr {
   		border: 1px solid black;
   
}

/* .feedTable td.itemContent {
		border-bottom: 1px solid #caeada; 
}
 */
 
	 .feedTable {
	    width: 100%;
	}
	
	.tableContainer{
		margin-right: 20px;
		display : flex;
		overflow-x : auto;
	}
	
	.feedTable td.itemContent {
		margin : 20px;
	}
	
	.feedImg img {
	    width: 130px;
	    object-fit: cover;
}
	
	.restaurantTable td,
	.restaurantTable tr {
		border : none;
}

	.restaurantTable td.rtServerFileName {
		border-bottom: 1px solid #caeada; 
}

       /* .myPageImg {
            top: -10px;
    		right: 1123px;
    		position: absolute;
        }*/

        
       
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
		    border: 1px solid #888;
		    width: 50%;
		    overflow-y: scroll;
        	max-height: 100vh;
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
		.nickNameOvelay{
			position : absolute;
			top : 133px;
			right : 110px;
		
		}
		
		 .updateNickname{
		 	position : absolute;
		 	width: 82px;
		 	top : 175px;
		 	right : 96px;
		 }
		
		
		.changeNickname {
			cursor: pointer;
		}
		
		.pwDiv{
			position : absolute;
			top : 204px;
			right : 102px;
		
		}
		
		.pwDiv2{
			position : absolute;
			top : 265px;
			right : 118px;
		
		}
		
		 .completePw{
		 	position : absolute;
		 	width: 104px;
		 	top : 304px;
		 	right : 89px;
		 	
		 }
		
		 
/* 		table,td{
			border : 1px solid black;
			border-collapse : collapse;
			padding : 5px 10px;
			border-left:0;
			border-right:0;
			border-bottom:0;
			
		} */
		
		#listContainer {
			position : absolute;
			display: flex;
		    top: 532px;
		    left : 0px;
		    width : 100%;
		    overflow-x:auto; 
		    white-space:nowrap; 
		    margin:0 auto
		}
		
		.titleLink{
			cursor: pointer;
		}
		
		.h3, h3 {
    		font-size: 22px;
		}
		
		.favTable{
			margin-left:auto; 
    		margin-right:auto;

		}
		
		.favImg img{
			width : 200px;
			padding : 10px;
		}
		
	
		.profile img{
			width: 40px;
			border-radius:50%;
			margin: 5px;
		}
		
		
		#myInfo{
			position : absolute;
			top : 343px;
			right : 61px;
			border : 0;
			border-collapse : collapse;
			padding: 5px 10px;
		}
		
		 #updateImg{
		 	position : relative;
			border-radius: 50%;
			margin: 5px;
		 }
		 
		 .plusImg{
		 	position : absolute;
		 	font-weight: bold;
		 	font-size: 70px;
		 	top: 64px;
		 	right : 720px;
		 	cursor : pointer;
		 }
		 
		 .save{
		 	position : absolute;
		 	bottom : -333px;
		 	right : 13px;
		 	width: 80px;
		 }
		
		 
		
		 
		 
		 .pagination{
		 	display: none;
   			padding-left: 0;
		    margin: 20px 0;
		    border-radius: 4px;
		    width: 279px;
		    top:700px;
		    left: 549px;
		 }
		 
		
		
		.restaurantPhoto img{
			width : 40px;
		}
		
		.feed-image{
			width:400px;
		}

		.tab-link current{
		border-radius : 8px;
		background-color : #caeada;
		}
		
    </style>
</head>
<body>
<c:import url="/main/header" />
<div id=container>
 <h3>마이페이지</h3>
 
	<div class="profileContainer">
 	<c:set var="myPageImg" value="${dto.profile_image}" />

  	<div class="myPageImg">
        <img src="/photo/${myPageImg}" width="180" height="220">
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
	<div class="delUser" onclick="confirmDelete(${dto.user_no})">회원탈퇴</div>
	
<div class="tabContainer">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">작성한 피드 모아보기</li>
		<li class="tab-link" data-tab="tab-2">댓글 모아보기</li>
		<li class="tab-link" data-tab="tab-3">나의 스크랩</li>
	</ul>
	
	<div id="tab-1" class="tab-content current">
		<h3>내가 작성한 피드 보기</h3>
	</div>
	
	<div id="tab-2" class="tab-content">
		<h3>내가 작성한 댓글 보기</h3>
		<div class="button">
			<!-- <input type="button" value="레시피"/>
			<input type="button" value="자유게시판"/> -->
			<input type="button" id = "restaurantBtn" value="식당"/>
			<input type="button" id = "feedBtn" value="피드"/>
		</div>
	</div>
		
	<div id="tab-3" class="tab-content">
		<h3>내가 스크랩한 식당 보기</h3>	
	</div>
	
	<!-- list 그리는 부분 -->
	<div id="listContainer" >
	
	</div>
	
</div>
	
	<div class="pageContainer">									
		<nav aria-label="Page navigation" style="text-align:center">
			<ul class="pagination" id="pagination"></ul>
		</nav>					
	</div>
</div>

<div class="modal" id="updateModal">
    <div class="modal-content">
        <h1>회원정보변경</h1>
        <hr>
        	<img src="/photo/${myPageImg}" id= updateImg width="150" height="150">
        	<div class="plusImg">+</div>
        	<input type="file" id="photo" name="photo" style="display: none">
        	<div class="nickNameOvelay">
        	<label>닉네임 : <input type="text" name="nickname" value="${dto.nickname}"/></label>
        	<input type="button" id="overlay" value="중복체크"/></div>
        	<p>
        	<div class= "updateNickname" style= cursor:pointer>닉네임변경</div>
        	<div class = "pwDiv">
        	<label>현재 비밀번호 <input type="text" name="password" value=""/></label>
        	<input type="button" id="pwConfirm" value="확인"/>
        	<p>
        	<label>변경 비밀번호 <input type="text" name="updatePw"/></label>
        	</div>
        	<p>
        	<div class= "pwDiv2">
    		<label>변경 비밀번호 확인  <input type="text" name="updatePwConfirm"/></label>
    		</div>
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
			<td><label for"vegan_type">나의 비건 단계  </label></td>
				<td colspan="2">
				    <select id="vegan_type" name="vegan_type">
				    	<option value="0">비건단계</option>
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
<%-- <c:import url="/main/footer" /> --%>
</body>
	
<script>
//header 카테고리 선택유지
$('#go_myPage').css('box-shadow','#95df95 0px 2px 0px 0px');

feedListCall();

var modal = document.getElementById("updateModal");

// 회원정보변경 클릭시 모달창 열림
$('.changeInfo').on('click',function(){
	modal.style.display = "block";
});

// x 클릭시 모달창 닫힘
$('.close').on('click',function(){
	location.reload();
	modal.style.display = "none";
});

// 다른 영역 클릭시 모달창 닫힘
window.onclick = function(event) {
    if (event.target == modal) {
    	location.reload();
        modal.style.display = "none";
    }
}


	 var image = '${dto.profile_image}';
	 console.log(image);
	 


 $('.plusImg').on('click', function(){
    $('#photo').click();
    
});
 
// mypage profileImage가 비어있는 상태에서 +버튼 클릭시 profileImage 등록 가능 
if(image==''){
$('#photo').on('change', function() {
    var user_no = $('input[name="user_no"]').val();
    var photo = $('#photo')[0].files[0];
    
    var formData = new FormData();
    formData.append('user_no', user_no);
    formData.append('photo', photo);

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
}); // profileImage가 비어있지 않은상태에서 + 클릭 시 profileImage 수정 가능
}else if(image!=''){
	$('#photo').on('change', function() {
	    var user_no = $('input[name="user_no"]').val();
	    var photo = $('#photo')[0].files[0];
	    
	    var formData = new FormData();
	    formData.append('user_no', user_no);
	    formData.append('photo', photo);

	    $.ajax({
	        type: 'post',
	        url: 'imgModify',
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
	    
	});
	
}

// 닉네임 중복체크 
var overlayChk = false;

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
			console.log(data.use);
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
	
	 if (!overlayChk) {
	        alert('닉네임 중복 체크를 먼저 진행해주세요.');
	        return; 
	    }
	
	if(nickname==''){
		alert('변경할 닉네임을 입력해주세요.');
	}
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
				alert('닉네임이 변경 되었습니다.');
		}
			},
		error: function(error){
			console.log(error);
		}
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
		}
	});
});

// 패스워드 변경 
$('.completePw').on('click',function(){
	var pw = $('input[name="password"]').val();
	var user_no = $('input[name="user_no"]').val();
	var updatePw = $('input[name="updatePw"]').val();
	var updatePwConfirm = $('input[name="updatePwConfirm"]').val();
	console.log(user_no+'/'+updatePw+'/'+updatePwConfirm);
	if(updatePw==''){
		alert('변경할 비밀번호를 입력해주세요.');
	}else{
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
		}
	});
	}
});

// 회원 정보 변경 저장하기 
$('.save').on('click',function(){
	
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
	
	if(interests==''){
		alert('관심사를 선택해주세요.');
	}else if(vegan_purpose==undefined){
		alert('나의 비건 목적을 선택해주세요.');
	}else if(vegan_type==0){
		alert('나의 비건 단계를 선택해주세요.');
	}else{
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
		}
	});
	}
});

//회원탈퇴
function confirmDelete(user_no) {
    var result = confirm('정말 탈퇴하시겠습니까?"확인"을 선택하시면 탈퇴가 완료 됩니다.');

    if (result) {
        // 사용자가 '확인'을 눌렀을 때의 처리
        alert('탈퇴가 완료 되었습니다.')
        location.href = './delUser?user_no=' + user_no;
    } else {
        // 사용자가 '취소'를 눌렀을 때의 처리
        alert('탈퇴가 취소 되었습니다.');
    }
}

$(document).ready(function(){
    $('ul.tabs li').click(function(){
        var tab_id = $(this).attr('data-tab');

        $('ul.tabs li').removeClass('current');
        $('.tab-content').removeClass('current');

        $(this).addClass('current');
        $("#"+tab_id).addClass('current');
        
        $('#listContainer').hide();
        
        var tabText = $(this).text();
        updateButtons(tabText);
        
        if (tabText === '작성한 피드 모아보기') {
            $('#listContainer').show();
            feedListCall();
        }
        
        if (tabText === '나의 스크랩'){
        	$('#listContainer').show();
        	favoriteListCall();
        	
        }
       
        
    });
});

function updateButtons(tabText) {
    var feedBtn = $('#feedBtn');
    var restaurantBtn = $('#restaurantBtn');
	
    // 모든 버튼 숨기기
    feedBtn.hide();
    restaurantBtn.hide();
    
	if (tabText === '댓글 모아보기') {
	    feedBtn.show();
	    restaurantBtn.show();
}
	
}

    // listCall(showPage);
	// 리스트 
	// listCall(page){



function feedListCall(){
	var user_no = $('input[name="user_no"]').val();
	var tabType = $('.tabs li.current').text();
	$.ajax({
	    type: 'GET',
	    url: 'feedListCall',
	    data:{
	    	'tabType':tabType,
	    	'user_no':user_no
	    },
	    dataType: 'JSON',
	    success: function(data) {
	      console.log(data);
	      drawList(data.list);
	      // $('#ListContainer').show(); // 리스트 보여주기
	      // $('#pagination').show(); 
	    },
	    error: function(error) {
	        console.log(error);
	    }
	});
}

function drawList(list) {
    var content = '<div class="tableContainer"><table class="feedTable"><tr>';

    list.forEach(function(item, idx) {
        content += '<td>';

        content += '<div class="profile"><img src="/photo/' + item.profile_image + '" alt="image">' + item.nickname + '</div>';
        content += '<div class="feedImg"><img src="/photo/' + item.server_file_name + '" alt="image" style="margin:0; padding:0;"></div>';
        content += '<div class="itemContent">' + item.content + '</div>';

        content += '</td>';
    });

    content += '</tr></table></div>';

    $('#listContainer').empty();
    $('#listContainer').html(content);
}

// 게시판 버튼 클릭
$('.button input[type="button"]').on('click', function() {
    var boardType = $(this).val();

    var user_no = $('input[name="user_no"]').val();
    console.log(user_no + boardType);
    
	if(boardType == '피드'){
    	feedCmListCall(boardType, user_no);
	}
	
	if(boardType =='식당'){
		rtCmListCall(boardType,user_no);
	}
	});

function feedCmListCall(boardType, user_no) {
    $.ajax({
        type: 'GET',
        url: 'feedCmListCall',
        data: {
            'user_no': user_no,
            'boardType': boardType
        },
        dataType: 'JSON',
        success: function(data) {
            console.log(data);
            drawFcList(data.fcmList);
            $('#ListContainer').show(); // 리스트 보여주기
            // $('#pagination').show();
        },
        error: function(error) {
            console.log(error);
        }
    });
}


function drawFcList(fcmList) {
    var content = '<div class="tableContainer"><table class="feedTable"><tr>';

    fcmList.forEach(function(item, idx) {
        content += '<td>';

        content += '<div class="profile"><img src="/photo/' + item.profile_image + '" alt="image">' + item.nickname + '</div>';
        content += '<div class="feedImg"><img src="/photo/' + item.server_file_name + '" alt="image"></div>';
        content += '<div class="itemContent">' + item.content + '</div>';

        content += '</td>';
    });

    content += '</tr></table></div>';

    $('#listContainer').empty();
    $('#listContainer').html(content);
}

function rtCmListCall(boardType, user_no) {
    $.ajax({
        type: 'GET',
        url: 'rtCmListCall',
        data: {
            'user_no': user_no,
            'boardType': boardType
        },
        dataType: 'JSON',
        success: function(data) {
            console.log(data);
            drawRtCmList(data.RtCmList); 
            $('#ListContainer').show(); // 리스트 보여주기
            // $('#pagination').show();
        },
        error: function(error) {
            console.log(error);
        }
    });
}


function drawRtCmList(RtCmList) {
    var content = '<div class="tableContainer"><table class="feedTable"><tr>';

    RtCmList.forEach(function(item, idx) {
        content += '<td>';

        content += '<div class="profile"><img src="/photo/' + item.profile_image + '" alt="image">' + item.nickname + '</div>';
        content += '<div class="feedImg"><img src="/photo/' + item.server_file_name + '" alt="image"></div>';
        content += '<div class="itemContent">' + item.content + '</div>';

        content += '</td>';
    });

    content += '</tr></table></div>';

    $('#listContainer').empty();
    $('#listContainer').html(content);
} 




function favoriteListCall(){
	var user_no = $('input[name="user_no"]').val();
	var tabType = $('.tabs li.current').text();
	$.ajax({
	    type: 'GET',
	    url: 'favoriteListCall',
	    data:{
	    	'tabType':tabType,
	    	'user_no':user_no
	    },
	    dataType: 'JSON',
	    success: function(data) {
	      console.log(data);
	      drawFavList(data.favList);
	      $('#ListContainer').show(); // 리스트 보여주기
	      // $('#pagination').show(); 
	    },
	    error: function(error) {
	        console.log(error);
	    }
	});
}

function drawFavList(favList) {
    var content = '<div class="tableContainer"><table class="favTable"><tr>';

    favList.forEach(function(item, idx) {
        content += '<td>';

        content += '<div class="title">' + item.title + '/별점 : ' + item.rating +  '</div>';
        content += '<div class="favImg"><a href="/invegan/restaurant/detail?post_id=' + item.post_id + '"><img src="/photo/' + item.server_file_name + '" alt="image" class="restaurantPhoto"></div>';

        content += '</td>';
    });

    content += '</tr></table></div>';

    $('#listContainer').empty();
    $('#listContainer').html(content);
}


	
 
</script>
</html>