<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1b7835be6802634d702664b5059fc0c&libraries=services"></script>
<style>
	.container{
		width: 1000px;
		margin: 0px auto;
	}
	
	.restaurantTop{
		width: 100%;
		position: relative;
		height: 400px;
		margin-bottom: 20px;
		
	}
	.restaurantImg_main{
		position: absolute;
		top: 5px;
		left: 0px;
		margin-bottom: 20px;
	}
	#img_main{
		width: 400px;
		height: 400px;		
	}
	.restaurantContent{
		display: inline-block;
		width: 600px;
		margin-left: 420px;
	}
	.contentTable{
		width: 100%;
		font-size: 28px;
	}
	.contentTable tr th{
		padding-bottom: 10px;
	}
	.contentTable tr td{
		padding-bottom: 10px;
	}
	.update_delete{
		position: absolute;
		top: 3px;
		right: 3px;
	}
	#favorite{
		position: absolute;
		top: 30px;
		right: 15px;
		width: 50px;
		height: 50px;
		border: 1px solid black;
		cursor: pointer;
	}
	
	
	.restaurantMenuList{
		position: relative;
		width: 100%;
	}
	.menuTable {
		width: 100%;
		border: 1px solid black;
		border-collapse: collapse;
		font-size: 20px;
		text-align: center;
	}
	.menuTable tr th{
		background-color: #E0E0E0;
		border: 1px solid black;
		border-collapse: collapse;
	}
	.menuTable tr td{
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
	
	.restaurantAddr{
		display: inline-block;
	    margin-right: 20px;
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
<div class="container">
	<h1>${restaurantDetail.getTitle()}</h1>
	<div class="restaurantTop">
		<div class="restaurantImg_main"><img id="img_main" src = "/photo/${photoList[0]}" alt="restaurantImg"/></div>
		<div class="restaurantContent">
			<c:forEach items="${menuDetail}" var = "menu">#${menu.getVegan_type()}  </c:forEach>
			<h1>${restaurantDetail.getTitle()}</h1>
			<h1>${restaurantDetail.getTitle()}</h1>
			<h1>${restaurantDetail.getTitle()}</h1>
			<h1>${restaurantDetail.getTitle()}</h1>
			<h1>${restaurantDetail.getTitle()}</h1>
			
			<img id="favorite" src="<c:if test='${favoriteChk eq 0}'><c:url value='/resources/main/X.png'/></c:if><c:if test='${favoriteChk eq 1}'><c:url value='/resources/main/O.png'/></c:if>" alt="favoriteIcon"/>
			<div>별점</div>
			<table class="contentTable">
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
		
		<div class="update_delete">
			<button id="update">수정</button>
			<button id="hidden">숨김</button>
			<button id="report">신고</button>
		</div>
		
	</div>
	
	<h1>비건 메뉴</h1>
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
	
	<h1>식당 사진</h1>
	<div id="restaurantImg">
		<div class="imgButton"><button id = "prevButton">뒤</button></div>
		<div id="imgList"></div>
		<div class="imgButton"><button id = "nextButton">앞</button></div>
	</div>
	
	<div class="restaurantAddr"><h1>식당 위치</h1></div>
	<div class="restaurantAddr"><h2>${restaurantDetail.getAddress()}</h2></div>
	<div class="restaurantMap">
		
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
		location.href="hidden?post_id="+${restaurantDetail.getPost_id()};
	}else{
		console.log('숨김 취소 클릭');
	}
});

// 즐겨찾기
$('#favorite').on("click",function(){
	console.log('즐겨찾기 클릭');
	var param = {};
	param.user_no = '${loginInfo.getUser_no()}';
	param.post_id = '${restaurantDetail.getPost_id()}';	
	$.ajax({
		type:'post',
		url:'favorite',
		data:param,
		dataType:'JSON',
		success:function(data){
			console.log(data);
			if(data.result == '0'){
				$('#favorite').attr('src','<c:url value="/resources/main/X.png"/>');
			}else{
				$('#favorite').attr('src','<c:url value="/resources/main/O.png"/>');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
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
		iwContent += '<a href="https://map.kakao.com/link/search/'+addr+'" style="color:blue" target="_blank">큰지도보기</a>    ';
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


</script>
</html>