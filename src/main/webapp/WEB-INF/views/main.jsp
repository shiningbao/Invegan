<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>인비건 INVEGAN</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel='stylesheet' href='https://cdn-uicons.flaticon.com/2.0.0/uicons-regular-rounded/css/uicons-regular-rounded.css'>

<style>
	.banner{
		background-color : #20B2AA;
		width: 1000px;
		height: 400px;
		margin: 0 auto;
	}
	.custom{
		width: 1200px;
		height: auto;
		margin: 0 auto;
	}
	.customFilterArea{
		height: 80px;
		clear: both;
	}
	.cF_title{
		position: inherit;
		float: left;
		width: 300px;
		height: 30px;
		margin-left: 50px;
	}
	.cF_move{
		position: inherit;
		float: right;
		width: 100px;
		height: 30px;
		margin-top: 25px;
		margin-right: 50px;
	}
	.customFilterList{
		display: flex;
		flex-direction: row;
	}
	.customFilterButton{
		width: 90px;
		height: 90px;
		margin: 150px auto;
		text-align: center;
		font-size: 60px;
		font-weight: 600;
		cursor: pointer;
	}
	.cFL_Res{
		position: relative;
		width : 328px;
		margin: 0px 2px;
	}
	.cFL_R_Img{
		width: 325px;
		height: 325px;
		background-color: 	#00CED1;
		margin: 0 auto;
	}
	.cFL_R_VT{
		position: absolute;
		top: 1px;
		margin: 0px;
		z-index: 10;
		background-color: white;
	}
	.cFL_R_Name{
		text-align: center;
		font-weight: 600;
		font-size: 30px;
		margin: 0 0;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		
	}
	.blank{
		margin-bottom: 200px;
	}

</style>
</head>
<body>

<c:import url="/main/header"/>

	<div class="banner">
	</div>
	<br>

	<!-- 맞춤 정보 제공 --> 
	<div class="custom">
		<!-- 식당 -->
		<div class="customFilterArea">
			<div class="cF_title"><h1>추천 식당</h1></div>
			<div class="cF_move"><h3><a href="<c:url value='/restaurant/list'/>">더보기...</a></h3></div>
		</div>
		<div class="customFilterList" id="restaurantList">
			<div class="customFilterButton">
				<i class="fi fi-rr-angle-double-left" id="restaurantButtonL"></i>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"><img src="#" alt="#" width="325px" height="325px"/></div>
				<div class="cFL_R_Con">
					<div class="cFL_R_Name"></div>
				</div>
				<div class="cFL_R_VT"></div>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"><img src="#" alt="#" width="325px" height="325px"/></div>
				<div class="cFL_R_Con">
					<div class="cFL_R_Name"></div>
				</div>
					<div class="cFL_R_VT"></div>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"><img src="#" alt="#" width="325px" height="325px"/></div>
				<div class="cFL_R_Con">
					<div class="cFL_R_Name"></div>
				</div>
					<div class="cFL_R_VT"></div>
			</div>
			<div class="customFilterButton">
				<i class="fi fi-rr-angle-double-right" id="restaurantButtonR"></i>
			</div>
		</div>
		
		<!-- 레시피 -->
		<div class="customFilterArea">
			<div class="cF_title"><h1>추천 레시피</h1></div>
			<div class="cF_move"><h3><a href="#">더보기...</a></h3></div>
		</div>
		<div class="customFilterList" id="restaurantList">
			<div class="customFilterButton">
				<i class="fi fi-rr-angle-double-left" id="restaurantButtonL"></i>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"><img src="#" alt="#" width="325px" height="325px"/></div>
				<div class="cFL_R_Con">
					<div class="cFL_R_VT"></div>
					<div class="cFL_R_Name"></div>
				</div>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"><img src="#" alt="#" width="325px" height="325px"/></div>
				<div class="cFL_R_Con">
					<div class="cFL_R_VT"></div>
					<div class="cFL_R_Name"></div>
				</div>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"><img src="#" alt="#" width="325px" height="325px"/></div>
				<div class="cFL_R_Con">
					<div class="cFL_R_VT"></div>
					<div class="cFL_R_Name"></div>
				</div>
			</div>
			<div class="customFilterButton">
				<i class="fi fi-rr-angle-double-right" id="restaurantButtonR"></i>
			</div>
		</div>
		
		<!-- 제품 -->
		<div class="customFilterArea">
			<div class="cF_title"><h1>추천 제품</h1></div>
			<div class="cF_move"><h3><a href="#">더보기...</a></h3></div>
		</div>
		<div class="customFilterList" id="restaurantList">
			<div class="customFilterButton">
				<i class="fi fi-rr-angle-double-left" id="restaurantButtonL"></i>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"><img src="#" alt="#" width="325px" height="325px"/></div>
				<div class="cFL_R_Con">
					<div class="cFL_R_VT"></div>
					<div class="cFL_R_Name"></div>
				</div>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"><img src="#" alt="#" width="325px" height="325px"/></div>
				<div class="cFL_R_Con">
					<div class="cFL_R_VT"></div>
					<div class="cFL_R_Name"></div>
				</div>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"><img src="#" alt="#" width="325px" height="325px"/></div>
				<div class="cFL_R_Con">
					<div class="cFL_R_VT"></div>
					<div class="cFL_R_Name"></div>
				</div>
			</div>
			<div class="customFilterButton">
				<i class="fi fi-rr-angle-double-right" id="restaurantButtonR"></i>
			</div>
		</div>
		
		<!-- 피드 -->
		<div class="customFilterArea">
			<div class="cF_title"><h1>추천 피드</h1></div>
			<div class="cF_move"><h3><a href="#">더보기...</a></h3></div>
		</div>
		<div class="customFilterList">
			<div class="customFilterL">
				<!-- 버튼 대체해야함 -->
				<div class="qwe">L</div>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"></div>
				<div class="cFL_R_Con">
					<p class="cFL_R_VT">#락토 #비건 # 오토</p>
					<h2 class="cFL_R_Name">식당 명</h2>
				</div>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"></div>
				<div class="cFL_R_Con">
					<p class="cFL_R_VT">#락토 #비건 # 오토</p>
					<h2 class="cFL_R_Name">식당 명</h2>
				</div>
			</div>
			<div class="cFL_Res">
				<div class="cFL_R_Img"></div>
				<div class="cFL_R_Con">
					<p class="cFL_R_VT">#락토 #비건 # 오토</p>
					<h2 class="cFL_R_Name">식당 명</h2>
				</div>
			</div>
			<div class="customFilterR">
				<!-- 버튼 대체해야함 -->
				<div class="qwe">R</div>
			</div>
		</div>
	
	</div>
		
	<div class="blank"></div>
	
<%-- <c:import url="/main/footer"/> --%>

</body>


<script>
var RFL;
var idx = 0;
var msg = "${msg}";
if(msg != ""){
	alert(msg);
}

$('#login').on('click',function(){
	location.href='member/login.go';
});

$('#addMaterial').on('click',function(){
	location.href='diet/addMaterial.go';
});

//위치 관련
var geodata = {};
navigator.geolocation.getCurrentPosition(geoSuccess, getError);
function geoSuccess(position){
	geodata.lat = position.coords.latitude;
	geodata.lng = position.coords.longitude;
	geoSubmit(geodata);
}
function getError() {
	geodata.lat = 37.4765;
	geodata.lng = 126.8802;
	geoSubmit(geodata);
}
function geoSubmit(data){
	$.ajax({
		type:'post',
		url:'main/RFL',
		data:data,
		dataType:'JSON',
		success:function(data){
			console.log(data);
			var shuffleRFL = data.RFL.slice().sort(() => Math.random() - 0.5); // 랜덤으로 정렬
			if(shuffleRFL.length > 6){
				RFL = shuffleFRL.slice(0,6);
			}else{
				RFL = shuffleRFL;
			}
			console.log(RFL);-
			restaurantListView(idx);
			console.log(data.FFL);
		},
		error:function(e){
			console.log(e);
		}
	});

}

function restaurantListView(idx){
	for (var i = 0; i < 3; i++) {
		$('.cFL_Res').eq(i).find($('img')).attr('src', '/photo/'+RFL[i+idx].server_file_name);
		$('.cFL_Res').eq(i).find($('img')).attr('alt', RFL[i+idx].title);
		$('.cFL_Res').eq(i).find($('.cFL_R_Name')).html(RFL[i+idx].title);
		var veganArr = RFL[i+idx].vegan.split(',');
		var vegan = [];
		veganArr.forEach(function(v, i){ // 비건 타입 중복 제거
			if(!vegan.includes(v)){
				vegan.push(v);
			}
		});
		var veganType = '';
		vegan.forEach(function(v, i){
			switch(v){
			case '1': veganType += '<p>1단계</p>'; break;
			case '2': veganType += '<p>2단계</p>'; break;
			case '3': veganType += '<p>3단계</p>'; break;
			case '4': veganType += '<p>4단계</p>'; break;
			case '5': veganType += '<p>5단계</p>'; break;
			case '6': veganType += '<p>6단계</p>'; break;
			case '7': veganType += '<p>7단계</p>'; break;
			case '8': veganType += '<p>8단계</p>'; break;
			case '9': veganType += '<p>9단계</p>'; break;
			}
		});
		$('.cFL_Res').eq(i).find($('.cFL_R_VT')).html(veganType);
	}
}

$('#restaurantButtonL').on('click',function(){
	console.log(idx);
	if(idx >= 3){
		idx -= 3;
		restaurantListView(idx);
	}
});

$('#restaurantButtonR').on('click',function(){
	console.log(idx);
	if(!(idx +3 >= RFL.lenght)){
		idx += 3;
		restaurantListView(idx);
	}
});


</script>
</html>