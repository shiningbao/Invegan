<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1b7835be6802634d702664b5059fc0c&libraries=services"></script>
<style>
	.restaurantcontainer{
		width: 1000px;
		margin: 0px auto;
	}
	#restaurantTitle{
		display: flex;
		align-items: center
	}
	#restaurantTitle h1{
		display: inline-block;
	}
	#favorite{
		display: inline-block;
		width: 50px;
		height: 50px;
		cursor: pointer;
		margin-left: 20px;
	}
	
	.restaurantTop{
		width: 100%;
		position: relative;
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

	.update_delete{
		position: absolute;
		top: 3px;
		right: 3px;
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
		text-align: center;
	}
	.menuTable tr td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	
	
	.restaurantImg{
		background-color: yellow;
		width: 1000px;
		margin: 0 auto;
		display: inline-block;
	}
	.imgButton{
		display: inline-block;
	}
	#imgList{
		width: 100%;
		display: inline-block;
	}
	.divImg{
		width: 325px;
		margin: 3px;
		display: inline-block;
	}
	.imgDetail{
		width: 100%;
		height: 325px;
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
     h2, h3 {
     	display: inline-block;
     	margin-right: 4px;
     }
     #blankdiv{
     	width: 100%;
     	height: 200px;
     }
</style>
</head>
<body>
<c:import url="/main/header"/>
<div class="restaurantcontainer">
	<div id="restaurantTitle">
	<h1>${restaurantDetail.getTitle()}</h1>
	<img id="favorite" src="<c:if test='${favoriteChk eq 0}'><c:url value='/resources/main/favorite_X.png'/></c:if><c:if test='${favoriteChk eq 1}'><c:url value='/resources/main/favorite_O.png'/></c:if>" alt="favoriteIcon"/>
	</div>
	<div class="restaurantTop">
		<div class="restaurantImg_main"><img id="img_main" src = "/photo/${photoList[0]}" alt="restaurantImg"/></div>
		<div class="restaurantContent">
			<c:forEach items="${menuDetail}" var = "menu">#${menu.getVegan_type()}  </c:forEach>
			<h1>${restaurantDetail.getTitle()}</h1>			
			<h2>식당 위치</h2>
			<h3>${restaurantDetail.getAddress()}</h3><br>
			<h2>전화 번호  </h2>
			<h3>${restaurantDetail.getPhone()}</h3><br>
			<h2>영업 시간  </h2>
			<h3>${restaurantDetail.getHours()}</h3><br>
			<h2>식당 소개 </h2>
			<p>${restaurantDetail.getContent()}</p>
		</div>
		
		<div class="update_delete">
			<c:if test="${admin eq 'yes'}">
				<button id="update">수정</button>
				<button id="hidden">숨김</button>
			</c:if>
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
					<td width="50%">${menu.getMenu_name()}</td>
					<td width="25%">${menu.getPrice()}</td>
					<td width="25%">${menu.getVegan_type()}</td>
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
	
	<div id="blankdiv"></div>
	<!-- 
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

	
 -->
</div>	
</body>

<script>
// header 카테고리 선택유지
$('#go_rest').css('box-shadow','#95df95 0px 2px 0px 0px');
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
				$('#favorite').attr('src','<c:url value="/resources/main/favorite_X.png"/>');
			}else{
				$('#favorite').attr('src','<c:url value="/resources/main/favorite_O.png"/>');
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
});



/*
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
*/



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