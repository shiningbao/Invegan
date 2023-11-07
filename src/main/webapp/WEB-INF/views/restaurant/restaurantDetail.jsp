<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1b7835be6802634d702664b5059fc0c&libraries=services"></script> -->
<style>
	.restauranTop{
		background-color: red;
		width: 1000px;
		height: 600px;	
		margin: 0 auto;
	}
	.restaurantImg_main{
	
	}
	#img_main{
		width: 330px;
		height: 330px;		
	}
	.restaurantContent{
	}
	
	.restaurantMenuList{
		background-color: orange;
		width: 1000px;
		margin: 0 auto;
	}
	.menuTable {
		width: 1000px;
		border: 1px solid black;
		border-collapse: collapse;
		font-size: 20px;
		text-align: center;
	}
	.menuTable tr th, .menuTable tr td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	
	.restaurantImg{
		background-color: yellow;
		width: 1100px;
		height: 600px;
		margin: 0 auto;
		display: inline-block;
	}
	.imgButton{
		display: inline-block;
	}
	#imgList{
		width: 980px;
		display: inline-block;
	}
	.divImg{
		width: 320px;
		margin: 3px;
		display: inline-block;
	}
	.imgDetail{
		width: 320px;
		height: 320px;
	}
	
	
	.restaurantMap{
		background-color: green;
		width: 1000px;
		height: 600px;
		margin: 0 auto;
	}
	#map{
		width: 1000px;
		height: 600px;
	}
 
 

</style>
</head>
<body>
<c:import url="/main/header"/>
<h1>식당 상세보기</h1>
${restaurantDetail}
${menuDetail}
${photoList}

	<div class="restaurantTop">
		<div class="restaurantImg_main"><img id="img_main" src = "/photo/${photoList[0]}" alt="restaurantImg"/></div>
		<div class="restaurantContent">
			비건 단계
			${restaurantDetail.getTitle()} 즐겨찾기
			별점
			<div class="update_delete">
				<button id="update">수정</button>
				<button id="hidden">숨김</button>
				<button id="report">신고</button>
			</div>
			<table >
				<tr>
					<th>식당 소개</th>
					<td>${restaurantDetail.getContent()}</td>
				</tr>
				<tr>
					<th>식당 위치</th>
					<td>${restaurantDetail.getAddress()}</td>
				</tr>
				<tr>
					<th>전화 번호</th>
					<td>${restaurantDetail.getPhone()}</td>
				</tr>
				<tr>
					<th>영업 시간</th>
					<td>${restaurantDetail.getHours()}</td>
				</tr>
			</table>
			
		</div>
	</div>
	
	
	<div class="restaurantMenuList">
		<table class="menuTable">
			<tr>
				<th>메뉴</th>
				<th>가격</th>
				<th>비건 단계</th>
			</tr>
			<c:forEach items="${menuDetail}" var = "menu">
				<tr>
					<td>${menu.getMenu_name()}</td>
					<td>${menu.getPrice()}</td>
					<td>${menu.getVegan_type()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
	<div id="restaurantImg">
		<div class="imgButton"><button id = "prevButton">뒤</button></div>
		<div id="imgList"></div>
		<div class="imgButton"><button id = "nextButton">앞</button></div>
	</div>
	
	
	<div class="restaurantMap">
		<h2>식당 위치</h2>  <p>${restaurantDetail.getAddress()}</p>
		<div id="map"></div>
	</div>
	
	<button id="review">리뷰</button>
	<button id="feed">관련 피드</button>
	
	<div class="reviewDiv">
		<p>리뷰</p>
		<p>리뷰 작성자 닉네임 : </p>
		
		<p>리뷰 작성 : ${loginInfo.getNickname()}</p>
		<input name="wirteReview" type="text"/>
		<select name="rating">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
		</select>
		<button id="send_writeReview">리뷰 작성</button>
	</div>
	
	
	
	
<c:import url="/main/footer"/>
</body>

<script>

var $imgList = document.getElementById('imgList');

var photoArr = [];
<c:forEach items="${photoList}" var ='item'>
	photoArr.push("${item}");
</c:forEach>
console.log(photoArr);

var cnt = 0;
photoView(cnt);

function photoView(cnt){
	$imgList.innerHTML = '';
	for(var i = 0; i < 3; i++){
		var idx = cnt+i;
		if(idx < photoArr.length){
			var divTag = document.createElement('div');
			divTag.className = 'divImg';
			$imgList.appendChild(divTag);
			
			var img = new Image();
			img.className = 'imgDetail';
			var imgsrc = '/photo/'+photoArr[idx];
			console.log(imgsrc);
			img.src = imgsrc;
			divTag.appendChild(img);			
		}
	}	
}

$('#prevButton').on('click', function(){
	if(cnt > 0){cnt -= 3;}
	photoView(cnt);
});

$('#nextButton').on('click', function(){
	if(!(cnt + 3 >= photoArr.length)){cnt += 3;}
	photoView(cnt);
});

// 수정
$('#update').on('click',function(){
	console.log('update click');
	if(confirm('수정하시겠습니까?')){
		location.href='update.go?post_id='+${restaurantDetail.getPost_id()};
	}else{
		console.log('수정 취소 클릭');
	}
});

// 숨김
$('#hidden').on('click',function(){
	console.log('hidden click');
	if(confirm('숨기시겠습니까?')){
		console.log('숨김 확인 클릭');
		//location.href="update.go?post_id="+post_id;
	}else{
		console.log('숨김 취소 클릭');
	}
});

$('#send_writeReview').on('click',function(){
	if($('input[name="wirteReview"]').val() != ''){
		if(confirm('리뷰를 작성하시겠습니까?')){
			console.log('리뷰 확인 클릭');
			var param = {};
			param.user_no = '${loginInfo.getUser_no()}';
			param.comment_text = $('input[name="wirteReview"]').val();
			param.rating = $('select[name="rating"]').val();
			param.post_id = '${restaurantDetail.getPost_id()}';
			
			console.log(param);
			
			$.ajax({
				type:'post',
				url:'reviewWrite',
				data:param,
				dataType:'JSON',
				success:function(data){
					console.log(data);
				},
				error:function(e){
					console.log(e);
				}
			});
			
			
			
		}else{
			console.log('리뷰 취소 클릭');
		}
	}else{
		alert('리뷰를 입력해주세요');
	}
});



/*
//지도 부분
var title = '${restaurantDetail.getTitle()}'; // 식당 이름
var addr = '${restaurantDetail.getAddress()}'; // 식당 주소

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
    	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    	level: 3 // 지도의 확대 레벨
	};

var map = new kakao.maps.Map(mapContainer, mapOption);

//주소-좌표 변환 객체 생성
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(addr, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
     	
        map.setCenter(coords);
        console.log(coords);
        console.log(coords.La);
        console.log(coords.Ma);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        
		var infoContrn
		var iwContent = '<div style="width:150px; padding:5px; text-align: center; margin: 0 auto;">'+title+'<br>';
		iwContent += '<a href="https://map.kakao.com/link/search/'+addr+'" style="color:blue" target="_blank">큰지도보기</a>';
		iwContent += '<a href="https://map.kakao.com/link/to/'+addr+'" style="color:blue" target="_blank">길찾기</a></div>';
		
        // 인포윈도우로 장소에 대한 설명을 표시합니다
		var infowindow = new kakao.maps.InfoWindow({
            map: map,
            position: coords,
           	content: iwContent
		});
		
        infowindow.open(map, marker);
    } 
});
*/

</script>
</html>