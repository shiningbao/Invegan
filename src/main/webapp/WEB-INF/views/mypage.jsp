<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
        .profileContainer {
            display: flex;
            margin: 67px;
    		flex-direction: row;
   			flex-wrap: nowrap;
    		justify-content: center;
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
	        cursor: pointer;
	        right: 422px;
	        bottom: 458px;
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
    </style>
</head>
<body>
 <h3>마이페이지</h3>
	<div class="profileContainer">
	    <div class="profileImage">
	        <img src="" width="150" height="150">
	    </div>
 		<c:forEach items="${info}" var="user">
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
	    </div>
		</c:forEach>	  
	</div>
	<div class="changeInfo">회원정보 변경</div>
	
	<div class="modal" id="updateModal">
    <div class="modal-content">
        <h1>회원정보변경</h1>
        <hr>
        <form action="/myPage/update.go">
        	<img src="" width="150" height="150">
        </form>
        <span class="close">&times;</span>
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
</script>
</html>