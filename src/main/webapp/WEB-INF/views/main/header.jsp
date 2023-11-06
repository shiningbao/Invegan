<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	.top > {
		display: inline;
	}
	
	.logoImg{
		position: inherit;
		width: 180px;
		height: 90px;
	}
	.loginInfo{
		position: inherit;
		float: right;
	}
	.infoModal{
		border: 1px solid black;
		display: none;
		position: absolute;
		width : 120px;
		height: 120px;
		z-index: 100;
		top: 50px;
		right: 50px;
	}
	
	.mainList{
		float: right;
		font-size: 50px;
	}

	.mainList_li_1{
		display: inline-block;
	}
	.mainList_ul_2{
		display: none;
		position: relative;
		top: 100%;
	}
	
	.sideBar{
		width: 60px;
		height: 372px;
		position: fixed;
		top: 35%;
		right: 3%;
	}
	
	.sideList{
		width: 60px;
		height: 60px;
		margin: 1px 0px;
		border: 1px solid black;
		background-color: #F0F8FF;
		
	}
	#last{
		border: 2px gray solid;
		width: 100%;
	}
</style>
</head>
<body>
	<div class="top">
		<div class = "logoImg">
			<img src="<c:url value='/resources/main/logo.png'/>" width=180px height=90px, alt="Logo Img" id="Logo"/>
		</div>
		<div class="loginInfo">
  		
<%-- 	
				<!-- 로그인 안했을 때 -->
			<c:if test="${empty memberInfo}">
				<p><a href = "#">로그인</a></p>
				<p><a href = "#">회원가입</a></p>
			</c:if>
		
			<!-- 로그인 했을 때 -->
 			<c:if test="${not empty memberInfo }">
				<p>프로필사진, 닉네임, 아이디<button id="infoButton">@</button></p>
			</c:if>
--%>

				<p><a href = "<c:url value='/member/signup.go'/>">회원가입</a></p>
				<p><a href = "<c:url value='/member/login.go'/>">로그인</a></p>
				
				
		</div>
	</div>
	<div class="infoModal">
		<div class="infoModalList">로그아웃</div>
		<div class="infoModalList">로그아웃1</div>
		<div class="infoModalList_admin">로그아웃3</div>
		<div class="infoModalList_admin">로그아웃5</div>
		<div class="infoModalList_admin">로그아웃6</div>
	</div>
<nav>
	<ul class="mainList_ul_1">
		<li class="mainList_li_1"><a href="#">식단관리</a></li>
		<li class="mainList_li_1">
			<a href="#">카테고리</a>
			<ul class="mainList_ul_2">
				<li class="mainList_li_2"><a href="restaurant/list">식당</a></li>
				<li class="mainList_li_2"><a href="#">레시피</a></li>
				<li class="mainList_li_2"><a href="#">음식</a></li>
				<li class="mainList_li_2"><a href="#">뷰티</a></li>
				<li class="mainList_li_2"><a href="#">패션</a></li>
			</ul>
		</li>
		<li class="mainList_li_1"><a href="feed/list">피드</a></li>
		<li class="mainList_li_1"><a href="#">자유게시판</a></li>
		<li class="mainList_li_1"><a href="#">소식지</a></li>
	</ul>

</nav>
	<div class="mainList">
		<a href="diet/tempCalander">식단관리</a>
		<a href="restaurant/list">식당</a>
		<a href="feed/list">피드</a>
		<a href="#">자유게시판</a></li>
		<a href="#">소식지</a></li>
	</div>
	

<div class="sideBar">
	<div class="sideList">
		<p>위</p>
	</div>
	<div class="sideList">
		<p>사</p>
	</div>
	<div class="sideList">
		<p>이</p>
	</div>
	<div class="sideList">
		<p>드</p>
	</div>
	<div class="sideList">
		<p>바</p>
	</div>
	<div class="sideList">
		<p>아래</p>
	</div>
</div>





<hr id="last">
</body>
<script>
	$('#Logo').on('click',function(){
		location.href = '<c:url value='/'/>';
	});



	$('.mainList_li_1').on('mouseover',function(){
		var ul = $(this).find('ul');
		if(ul.length != 0){
			ul.css({"display":"block"});
		}
	});
	$('.mainList_li_1').on('mouseout',function(){
		var ul = $(this).find('ul');
		if(ul.length != 0){
			ul.css({"display":"none"});
		}
	});
	
	$('#infoButton').on('click',function(){
		var displayChk = $('.infoModal').css('display');
		console.log(displayChk);
		
		if(displayChk == 'block'){
			$('.infoModal').css({'display':'none'});
		}else{
			$('.infoModal').css({'display':'block'});
		}
	});

	$('.logoImg').on('click',function(){
		var memberInfo = sessionStorage.getItem("memberInfo");
		sessionStorage.setItem("aa","aaa");
		var id = sessionStorage.getItem("id");
		console.log(memberInfo);
		console.log(id);	
		console.log(sessionStorage.getItem("aa"));
	});
	
	
	
	
	

</script>
</html>