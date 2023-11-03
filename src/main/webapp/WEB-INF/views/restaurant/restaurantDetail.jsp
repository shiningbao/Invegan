<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1b7835be6802634d702664b5059fc0c"></script>
<style>
	#mainImg_div{
		width: 500px;
		height: 500px;
		right: 300px;
	}
	#map{
		width: 100%;
		height: 350px;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/main/header.jsp"%>
<h1>식당 상세보기</h1>
<button type="button" onclick="location.href='/write'">식당 작성</button>

<table>
	<tr>
		<td>사진, 설명 들어가는 칸<div id="mainImg_div">식당 사진</div></td>
	</tr>
	<c:if test="${menuList.size() == 0}">
	<tr>
		<td><h2>비건메뉴</h2></td>
	</tr>
	<tr>
		<td>
			<table id="menuTable">
				<tr><th>메뉴명</th><th>가격</th><th>비건타입</th></tr>
				<c:forEach items="${menuList}" var="menu">
					<tr>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</table>
		</td>
	</tr>
	</c:if>
	<tr>
		<td><h2>식당 사진</h2></td>
	</tr>
	<tr>
		<td>사진 들어가는 칸</td>
	</tr>
	<tr>
		<td><h2>식당 위치</h2> <h3>서울기 금천구/가져온 주소 입력되도록</h3></td>
	</tr>
	<tr>
		<td><div id="map"></div></td>
	</tr>
	<tr>
		<td><button>리뷰</button><button>식당</button></td>
	</tr>
	<tr>
		<td></td>
	</tr>




</table>


<%@include file="/WEB-INF/views/main/footer.jsp"%>
</body>

<script>


	// 지도 관련 스크립트
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = { 
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};
	
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	//마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
	
	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
	position: markerPosition
	});
	
	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	var iwContent = '<div style="padding:5px;">Hello World! <br>
		<a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> 
		<a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', 
    iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
	
	//인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	position : iwPosition, 
	content : iwContent 
	});
	
	//마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 



</script>
</html>