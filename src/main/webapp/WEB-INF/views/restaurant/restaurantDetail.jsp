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
	.restauranTop{
		background-color: red;
		width: 1000px;
		height: 600px;	
		margin: 0 auto;
	}
	.restaurantMenuList{
		background-color: orange;
		width: 1000px;
		height: 600px;
		margin: 0 auto;
	}
	.restaurantImg{
		background-color: yellow;
		width: 1000px;
		height: 600px;
		margin: 0 auto;
	}
	.restaurantMap{
		background-color: green;
		width: 1000px;
		height: 600px;
		margin: 0 auto;
	}
	
	
	.map{

	}
	
	
	
	
	
	
	
	
</style>
</head>
<body>
<%@include file="/WEB-INF/views/main/header.jsp"%>
<h1>식당 상세보기</h1>
${restaurantDetail}
${menuDetail}
${photoList}

	<div class="restaurantTop">
		<div class="restaurantMainImg"></div>
		<div class="restaurantContent"></div>
	</div>
	
	
	<div class="restaurantMenuList">
	</div>
	
	<div class="restaurantImg">
	</div>
	
	<div class="restaurantMap">
	<div id="map"></div>
	</div>
	
	
	
	





















<%@include file="/WEB-INF/views/main/footer.jsp"%>
</body>

<script>


</script>
</html>