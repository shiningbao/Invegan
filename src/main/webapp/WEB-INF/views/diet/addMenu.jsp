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
	
	table, th, td{
		border-collapse: collapse;
		padding: 3px 10px;
		font-size: 13px;
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
	.mealBtn{
		border: 1px solid black;
		background-color: white;
		border-radius: 4px;
	}
	.mealBtn:hover{
		cursor: pointer;
	}
	#foodListHead{
		height: 30px;
		width: 600px;
		border: 1px solid black;
	}
	#foodListHead th{
		height: 25px;
		border: 1px solid black;
	}
	#foodListBox{
		height: 430px;
		width: 600px;
		overflow: auto;
		overflow-x:hidden; 
	}
	/* #foodListBox::-webkit-scrollbar{
		width: 3px;
	}
	#foodListBox::-webkit-thumb{
		width: 3px;
	}
	#foodListBox::-webkit-track{
		width: 3px;
	} */
	#foodList{
		width: inherit;
	}
	#foodList tr{
		border: 1px solid blue;
	}
	
	#showNutri table{
		width: 300px;
		height:540px;
	}
	.foodItem:hover{
		cursor: pointer;
	}
	ul{
		padding: 0;
	}
	li{
		display: inline-block;
	}
	#gBox{
		width: 30px;
	}
	#listArea, #showNutri{
		display: inline-block;
	}
	
		
}
	
</style>

</head>
<body style="overflow-x:hidden; overflow-y:hidden;">
	<h2>메뉴 추가</h2>
	<div id="tapMenu">
		<ul>
			<li id="default" onclick="defaultMenu()">기본메뉴</li>
			<li id="myRecipe" onclick="myRecipeMenu()">나만의 레시피 메뉴</li>
		</ul>
	</div>
	<div id="contents">
	</div>
</body>
<script>
	defaultMenu();
	
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