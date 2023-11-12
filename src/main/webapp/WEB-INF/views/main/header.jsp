<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">

 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 		<!-- <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- 	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script> -->
       <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- 	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->

<style>

@font-face {
    font-family: 'S-CoreDream-3Light';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
    font-family: 'S-CoreDream-3Light', sans-serif; 
}

::-webkit-scrollbar {
    width: 0; /* 스크롤바 너비를 0으로 설정하여 숨깁니다. */
}

#header-container{
	height: 100px;
	width: 1200px;
	margin: 0 auto;
	position: relative;
	
}
.header-logoImg img{
	width: 135px;
	height: 100px;
}
.header-logoImg img:hover{
	cursor: pointer;
}

.header-logoImg, .header-navbar, .loginInfo{
	display: inline-block;
}
.header-navbar{
	position: absolute;
    right: 100px;
    top: 53px;
}
.header-nav_list{
	list-style: none;
	display: flex;
}
.header-nav_item{
	margin: 3px 10px;
}
.header-nav_item a{
	all: initial;
	font-size: 19px;
	font-weight: 600;
	
}
.header-nav_item a:hover{
	cursor: pointer;
	color:#95df95;
}
.loginInfo{
	position: fixed;
    right: 23px;
    top: -15px;
}

.loginInfo p {
	display: inline-block;
}
#profileImg {
   width: 40px;
   height: 40px;
   border-radius: 50%;
   margin-right: 10px;
   position: relative;
   top: 12px;
}
	


/* 	.top {
		clear: both;
		height: 150px;
	}	
	.logoImg{
		position: inherit;
		float: left;
	}
	.loginInfo{
		position: inherit;
		float: right;
		width: 200px;
		height: 30px;
		margin-top: 25px;
		margin-right: 50px;
		
	}
	.loginInfo > p {
		display: inline-block;
	}
	.infoModal{
		border: 1px solid black;
		display: none;
		position: absolute;
		background-color: grey;
		z-index: 100;

	}
	#profileImg {
	   width: 50px;
	   height: 50px;
	   border-radius: 50%;
	   margin-right: 10px;
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
	.nav{
		margin: 0 auto;
		width: 1000px;
	}
	.nav_item_1{
		list-style: none;
		float: left;
		margin: 0 15px;
		position: relative;
	}
	.nav_item_1 > a{
		font-size: 40px;
		text-decoration: none;
		color: black;

	}
	.nav_list_2{
		display: none;
		position: absolute;
		top: 100%;
		background-color: grey;
	}
	.nav_item_1{
		list-style: none;
		position: relative;
	}
	.nav_litm_2 > a{
		text-align: center;
		text-decoration: none;
		font: 40px;
	} */
</style>
</head>
<body>
<header id="header-container">
		<div class = "header-logoImg">
			<img src="<c:url value='/resources/main/invegan_logo_master.png'/>"  alt="Logo Img" id="Logo"/>
		</div>
		<div class="header-navbar">
			<nav class="header-nav">
				<ul class="header-nav_list">
					<li class="header-nav_item"><a id="go_diet" href="<c:url value='/diet/dietCalander'/>">식단관리</a></li>
					<li class="header-nav_item" id="go_rest"><a href="<c:url value='/restaurant/list'/>">비건식당</a></li>
					<li class="header-nav_item"><a id="go_feed" href="<c:url value='/feed/list.go'/>">피드</a></li>
					<li class="header-nav_item"><a id="go_myPage" href="<c:url value='/myPage/info.go'/>">MyPage</a></li>
				</ul>
			</nav>
		</div>
		<div class="loginInfo">
				<!-- 로그인 안했을 때 -->
			<c:if test="${empty loginInfo}">
				<p><a href = "<c:url value='/member/login.go'/>">Login</a></p>
			</c:if>
		
			<!-- 로그인 했을 때 -->
 			<c:if test="${not empty loginInfo}">
				<p><img id="profileImg" src="/photo/${loginInfo.getProfile_img()}" /></p>
				<p id="loginNickname">${loginInfo.getNickname()}</p>
				<p id="loginId">( ${loginInfo.getId()} )</p>
				<div class="infoMB">
					<button id="infoButton">@</button>
					<div class="infoModal">
						<div class="infoModalList"><a href = "<c:url value='/member/logout'/>">로그아웃</a></div>
						<div class="infoModalList"><a href = "<c:url value='/myPage/info.go'/>">마이페이지</a></div>
						<c:if test="${loginInfo.getIs_admin() eq '1'}">
							<div class="infoModalList_admin"><a href = "<c:url value='/member/signup'/>">회원 관리</a></div>
							<div class="infoModalList_admin"><a href = "<c:url value='/member/signup'/>">신고관리</a></div>
							<div class="infoModalList_admin"><a href = "<c:url value='/diet/addMaterial.go'/>">식재료추가</a></div>
						</c:if>
					</div>
				</div> 
			</c:if>

		</div>
		
		
<!-- 
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
			<a>요청하기</a>
		</div>
	</div> -->

</header>
		<hr style="border: 1px solid darkgrey ; color: darkgrey;"/>

<%-- 	<%@ include file="library.jsp" %> --%>
</body>

<script>


	$('#Logo').on('click',function(){
		location.href = '<c:url value='/'/>';
	});

	/* $('#infoButton').on('click',function(){
		var displayChk = $('.infoModal').css('display');
		console.log(displayChk);
		if(displayChk == 'block'){
			$('.infoModal').css({'display':'none'});
		}else{
			$('.infoModal').css({'display':'block'});
		}
	}); */

	/* $('#nav_item_categori').on('mouseover',function(){
		$('.nav_list_2').css({"display":"block"});	
	});
	$('#nav_item_categori').on('mouseout',function(){
		$('.nav_list_2').css({"display":"none"});	
	}); */

</script>
</html>