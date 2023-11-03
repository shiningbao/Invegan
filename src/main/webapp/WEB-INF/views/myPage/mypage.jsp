<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<!-- bootstrap : 디자인을 위한 프레임워크 -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<!-- jquery 는 사용하는 플러그인과 다른 라이브러리와의 충돌 여부를 확인해야 한다. -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<!-- 페이징 처리를 위한 라이브러리 -->    
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
        .profileContainer {
            display: flex;
            height: 187px;
            width: 1508px;
            margin: 67px;
    		flex-direction: row;
   			flex-wrap: nowrap;
    		justify-content: center;
    		position: relative;
        }

        .profileImage {
            margin-right: 20px;
        }

        .userInfo {
            font-size: 18px;
            margin-top:27px;
            width: 400px;
          
        }
        
        .additionalInfo{
         	font-size: 18px;
         	margin-top:27px;
        	margin-left: 50px;
        	
        }
        
        .changeInfo{
	         position: absolute;
			 top: 294px; 
			 left: 1100px;
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
		    font-size: 28px;
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
			width: 155px; 
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
	        right: -179px;
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
			left: 1100px;
			cursor: pointer;
			font-size: 14px;

			
		}
		
    </style>
</head>
<body>
 <h3>마이페이지</h3>
 <c:forEach items="${info}" var="user">
	<div class="profileContainer">
	    <div class="profileImage">
	        <img src="" width="150" height="150">
	    </div>
	   	<div class="userInfo">
	        <label>가입 날짜 : </label>${user.join_date}<br>
	        <label>아이디 : </label>${user.id}<br>
	        <label>생년월일 : </label>${user.birthdate}<br>
	        <label>성별 : </label>${user.gender}<br>
	    </div>
	   	<div class="additionalInfo">
	        <label>닉네임 : </label>${user.nickname}<br>
	        <label>비건타입 : </label>${user.vegan_type}<br>
	        <label>비건목적 </label><br>${user.vegan_purpose}
			<input type="hidden" name="id" value="${user.id}"/>
			<input type="hidden" name="user_no" value="${user.user_no}"/>

	    </div>
	</div>
	<div class="changeInfo">회원정보 변경</div>
	<div class="delUser" onclick="confirmDelete(${user.user_no})">회원탈퇴</div>
	
	
	<div class="modal" id="updateModal">
    <div class="modal-content">
        <h1>회원정보변경</h1>
        <hr>
        	<img src="" width="150" height="150">
        	<label>닉네임 : <input type="text" name="nickname" value="${user.nickname}"/></label>
        	<input type="button" id="overlay" value="중복체크"/>
        <form action="/myPage/updateNickname">
        	<div class="changeNickname">닉네임 변경</div>
        </form>
        <span class="close">&times;</span>
    </div>
	</div>
	</c:forEach>	  
	
	
	
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
	
	<div id="ListContainer">
		    <table>
		            <tr>
		                <td></td>
		                <td></td>
		            </tr>
		    </table>
		</div>
		
	</div>
	
<script>
var modal = document.getElementById("updateModal");

// 클릭시 모달창 열림
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

$('#overlay').on('click',function(){
	var nickname = $('input[name="nickname"]').val();
	console.log('nickname='+nickname);
	
	$.ajax({
		type:'get', 
		url:'/myPage/overlay',
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
		},
	});
});

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
	
	
	$('.button input[type="button"]').on('click', function() {
		var boardType = $(this).val();
		var tabType = $('.tabs li.current').text();
		var user_no = $('input[name="user_no"]').val();
		console.log(boardType);
		console.log(tabType);
		console.log(user_no);
	
	
    $.ajax({
        type: 'GET',
        url: 'listCall',
        data:{
        	'boardType':boardType,
        	'tabType':tabType,
        	'user_no':user_no
        },
        dataType: 'JSON',
        success: function(data) {
          console.log(data);
          drawList(data.list);
          $('#ListContainer').show();
        },
        error: function(error) {
            console.log(error);
        }
    });
});

	function drawList(list) {
	    console.log(list);
	    var content = '';
	    var activeButton = $('.button input[type="button"]:focus').val();
	    

	    list.forEach(function(item, idx) {
	        content += '<tr>';
	        switch (activeButton) {
	            case '요청':
	                content += '<td>' + item.req_title + '</td>';
	                break;
	            case '레시피':
	            case '자유게시판':
	                content += '<td>' + item.title + '</td>';
	                break;
	            case '피드':
	                content += '<td><img src="' + item.server_file_name + '" alt="image"></td>';
	                content += '<td>' + item.content + '</td>';
	                content += '<td>' + item.nickname + '</td>';
	                break;
	            default:
	                break;
	        }
	        content += '<td>' + '조회수 ' + item.views + '</td>';
	        content += '</tr>';
	    });

	    $('#ListContainer').html(content);
	}
	
	function confirmDelete(user_no) {
	    var result = confirm('정말 탈퇴하시겠습니까?');

	    if (result) {
	        // 사용자가 '확인'을 눌렀을 때의 처리
	        alert('탈퇴가 완료 되었습니다.')
	        location.href = './delUser?user_no=' + user_no;
	    } else {
	        // 사용자가 '취소'를 눌렀을 때의 처리
	        alert('탈퇴가 취소 되었습니다.');
	    }
	}

</script>
</html>