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
		position: absolute;
		width: 400px;
		height: 400px;		
	}
	.veganType{
		margin-bottom: 5px;;
	}
	.veganType div{
		height: 28px;
		display: inline-block;
		border-radius: 10%;
		margin: 2px 1px;;
		padding: 0px 4px;
		background-color: #bbe8b7;
		line-height: 28px;
		text-align: center;
	 	border: 0.5px solid #30492a;
	 	font-size: 17px;
	}
	.restaurantContent{
		display: inline-block;
		width: 600px;
		margin-left: 420px;
	}
	.restaurantContent h2, .restaurantContent h3 {
     	display: inline-block;
     	margin-right: 4px;
     	margin-bottom: 15px;
     }
   	.restaurantContent p {
   		margin-right: 4px;
   		margin-top: 0px;
   		margin-bottom: 0px;
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
		<img id="favorite" 
			src="<c:if test='${favoriteChk eq 0}'><c:url value='/resources/main/favorite_X.png'/></c:if>
				<c:if test='${favoriteChk eq 1}'><c:url value='/resources/main/favorite_O.png'/></c:if>" 
			alt="favoriteIcon"/>
	</div>
	<div class="restaurantTop">
		<div class="restaurantImg_main"><img id="img_main" src = "/photo/${photoList[0]}" alt="restaurantImg"/></div>
		<div class="restaurantContent">
			<div class="veganType"></div>
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
				<button id="hidden">
					<c:if test="${restaurantDetail.getIs_hidden() eq 0}">숨김</c:if>
					<c:if test="${restaurantDetail.getIs_hidden() eq 1}">숨김 해제</c:if>
				</button>
			</c:if>
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
</div>	
</body>

<script>
// header 카테고리 선택유지
$('#go_rest').css('box-shadow','#95df95 0px 2px 0px 0px');

var hidden = '${restaurantDetail.getIs_hidden()}';
if(hidden != 0){
	var img = '<c:url value="/resources/main/hidden.png"/>';
	$('.restaurantImg_main').append(
		'<img class="restaurnatHidden" src="'+img+'" style="width:400px; height:400px; z-index:1,back-ground-color:grey; opacity:0.7"}/>'
	);
}

var veganArr = [];
<c:forEach items="${menuDetail}" var = "menu">
 	var v = '${menu.getVegan_type()}';
 	if(!veganArr.includes(v)){
 		veganArr.push(v);
 	}
</c:forEach>
var veganType = '';
veganArr.sort();
veganArr.forEach(function(v,i){
	 switch (v) {
		case '1': veganType += '<div>#플루테리언</div>'; break;
		case '2': veganType += '<div>#비건</div> '; break;
		case '3': veganType += '<div>#락토</div> '; break;
		case '4': veganType += '<div>#오보</div> '; break;
		case '5': veganType += '<div>#락토오보</div> '; break;
		case '6': veganType += '<div>#폴로</div> '; break;
		case '7': veganType += '<div>#페스코</div>'; break;
		case '8': veganType += '<div>#폴로페스코</div>'; break;
		case '9': veganType += '<div>#플렉시테리언</div>'; break;
	}
});
$('.veganType').html(veganType);


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


// 수정 컨펌
$('#update').on('click',function(){
	if(confirm('수정하시겠습니까?')){
		location.href='update.go?post_id='+${restaurantDetail.getPost_id()};
	}else{
	}
});


// 숨김 컨펌
$('#hidden').on('click',function(){
		console.log('hidden click');
		var checkbox = hidden == 0 ? '숨기시겠습니까?':'숨김을 해제하시겠습니까?';
		if(confirm(checkbox)){
			location.href='hidden?post_id='+${restaurantDetail.getPost_id()}+'&is_hidden='+hidden;
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