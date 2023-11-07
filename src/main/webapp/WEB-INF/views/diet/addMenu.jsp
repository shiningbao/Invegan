<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가하기</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	
	ul{
		padding: 0;
	}
	li{
		display: inline-block;
	}
	#tapMenu{
		width: inherit;
		height: 30px;
		border-bottom: 1px solid black; 
		text-align: center;
	}
	#tapMenu li{
		margin: 0 10px;
	}
	#tapMenu li:hover{
		cursor: pointer;
	}
	#top {
		text-align: right;
		float: right;
		position: relative;
		top:-35px;
		right: 20px;
	}
	#top input{
		cursor: pointer;
		background: none;
		border: none;
		font-size: 25px;
	}
	
</style>

</head>
<body style="overflow-x:hidden; overflow-y:auto;">
	<input id="getDate" type=hidden value="${date} "/>
	<div id="tapMenu">
		<ul>
			<li id="default" onclick="defaultMenu()">기본메뉴</li>
			<li id="myRecipe" onclick="myRecipeMenu()">나만의 레시피 메뉴</li>
		</ul>
		<div id="top">
			<input type="button" value="Χ" onclick="winClose()"/>
		</div>
	</div>
	<div id="contents">
	
	</div>
</body>
<script>
	var selectDate = $('#getDate').val();
	defaultMenu();
	
	function winClose(){
		console.log("닫기 클릭");
		if(confirm("입력된 내용은 사라집니다\n창을 닫으시겠습니까?")){
			self.close();
		} 
	} 
	
	var menu_category;
	var recipe_name;
	
	function defaultMenu(){
		$('#contents').load("<c:url value='defaultMenu.go'/>");
		menu_category = $('#default').text();
		recipe_name ='-';
	}
	
	function myRecipeMenu(){
		$('#contents').load("<c:url value='../myRecipe/MyRecipeList.go'/>");
		menu_category = $('#myRecipe').text();
	}
	
	
	
</script>
</html>