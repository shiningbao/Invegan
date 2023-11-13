<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
/* 	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	} */
	
	.restaurantListContainer{
		width: 1000px;
		margin: 0px auto;
	}
	.restaurantListHead{
		width: 100%;
	}
	#restaurantListHeadTitle{
		display: inline-block;
		width: 850px;
		font-weight: 600;
		font-size: 50px;
		margin: 10px 0px;
	}
	#writeButton{
		display: inline-block;
		margin-top: 5px;
		margin-right: 20px;
	}
	.restaurantDiv{
		width: 100%;
		cursor: pointer;
	}
	.restaurantDiv_1{
		position: relative;	
		width: 24%;
		margin: 0px auto 10px auto;
		display: inline-block;
	}
	.veganType{
		position: absolute;
		top: 1px;
		margin: 0px;
		z-index: 1;
	}
	.veganType div{
		height: 30px;
		display: inline-block;
		border-radius: 10%;
		margin: 2px 2px;;
		padding: 0px 7px;
		background-color: #bbe8b7;
		line-height: 30px;
		text-align: center;
	 	border: 1px soild #black;
	}
	.restaurantDiv_1 img{
		width: 100%;
		height: 250px;
	}
	.res_title{
		text-align: center;
		font-weight: 600;
		font-size: 25px;
		margin: 0 0;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
	.res_dist{
		text-align: center;
		font-size: 15px;
		margin: 0 0;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}
</style>

</head>
<body>
<c:import url="/main/header"/>
	<div class="restaurantListContainer">
		<div class="restaurantListHead">
			<div id="restaurantListHeadTitle">식당 리스트</div>
			<c:if test="${admin eq 'yes'}">
			<button id="writeButton" type="button" onclick="location.href='write.go'">식당 작성</button>
			</c:if>	
		</div>
		<div class="restaurantDiv">
			<div class="restaurantDiv_1">
				<img src="<c:url value='/resources/main/logo.png'/>">
				<div class="res_title">게시물 없음</div>
				<div class="res_dist">-</div>
				<div class="veganType"></div>
			</div>
			<div class="restaurantDiv_1">
				<img src="<c:url value='/resources/main/logo.png'/>">
				<div class="res_title">게시물 없음</div>
				<div class="res_dist">-</div>
			</div>
			<div class="restaurantDiv_1">
				<img src="<c:url value='/resources/main/logo.png'/>">
				<div class="res_title">게시물 없음</div>
				<div class="res_dist">-</div>
			</div>
			<div class="restaurantDiv_1">
				<img src="<c:url value='/resources/main/logo.png'/>">
				<div class="res_title">게시물 없음</div>
				<div class="res_dist">-</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
</body>
<script>
$('#go_rest').css('box-shadow','#95df95 0px 2px 0px 0px');

for(var i = 0; i < 4; i++){
	var copyTag = document.getElementsByClassName('restaurantDiv')[0].cloneNode(true);
	document.getElementsByClassName('restaurantListContainer')[0].appendChild(copyTag);	
}

/* console.log(${restaurantList}); */

<c:forEach items="${restaurantList}" var ='item' varStatus="status">
	var veganType = ''
	var veganTypeList = '${item.getVegan()}';
	var veganTypeArr = veganTypeList.split(',');
	veganTypeArr.forEach(function(v,i){
		switch(v){
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
	var idx = ${status.index};
	$('.restaurantDiv_1').eq(idx).attr('post_id','${item.getPost_id()}');
	$('.restaurantDiv_1').eq(idx).find($('img')).attr('src','/photo/${item.getServer_file_name()}');
	$('.restaurantDiv_1').eq(idx).find($('.res_title')).html('${item.getTitle()}');
	$('.restaurantDiv_1').eq(idx).find($('.res_dist')).html('현재 위치와의 거리: ${item.getKm()}km');
	$('.restaurantDiv_1').eq(idx).find($('.veganType')).html(veganType);
</c:forEach>

$('.restaurantDiv_1').on('click',function(){
	var post_id = $(this).attr('post_id');
	if(post_id != null){
		location.href = 'detail?post_id='+post_id
	}
});




/*
for(var i = 0; i < ${restaurant})


<td><a href = "detail?post_id=${restaurant.getPost_id()}">${restaurant.getPost_id()}</a></td>
<td><a href = "detail?post_id=${restaurant.getPost_id()}">${restaurant.getServer_file_name()}</a></td>
<td><a href = "detail?post_id=${restaurant.getPost_id()}">${restaurant.getTitle()}</a></td>
<td><a href = "detail?post_id=${restaurant.getPost_id()}">${restaurant.getVegan()}</a></td>
<td><a href = "detail?post_id=${restaurant.getPost_id()}">${restaurant.getKm()}</a></td>
	<td><a href = "detail?post_id=${restaurant.getPost_id()}">${restaurant.getIs_hidden()}</a></td>
*/
</script>
</html>