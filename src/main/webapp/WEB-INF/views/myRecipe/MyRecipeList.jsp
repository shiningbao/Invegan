<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<style>
			table{
				border : solid 1px black;
				border-collapse: collapse;
				padding : 5px 10px;
				width: 700px;
				text-align: center;
			}
			
			th, td { 
				border-collapse: collapse;
				padding : 5px 10px;
				text-align: center;
			}
			
			#food_name {
				width : 400px;
			}
			
		</style>
	</head>
	<body>
		<h2>메뉴추가</h2>
		<h4>기본 메뉴 | 나만의 레시피 메뉴</h4>
		<button>취소</button>
		<hr>
		<div>		
			<button>아침</button>
			<button>점심</button>
			<button>저녁</button>
			<button>기타</button>
			<input type="button" value="+" id="rinsert"/>
			<input type="button" value="-" id="rdelete"/>
			<table id = "mRecipeList">	
				<thead>
					<tr>
						<th id = food_name>식품명</th>
						<th>1회 제공량(g)</th>
						<th>에너지(kcal)</th>
					</tr>
				</thead>
				<tbody id=rList>
					<!-- 레시피 데이터 출력 -->
				</tbody>
				<tbody id=rinsertbox>
					<!-- 레시피 이름 입력칸 -->
				</tbody>
			</table>
		</div>
		<br>
		<table id = "mMaterialList">
			<tr>
				<th colspan="2">재료</th>
				<th>
					<button onclick="location.href='mlist.go'">+</button>
					<button>-</button>
				</th>
			</tr>
			<tr>
				<td>해바라기씨, 볶은것</td>
				<td>20g</td>
				<td>13.4 kcal</td>
			</tr>
		</table>
		<br>
		<button>완료</button>
		<br>
		<table>
			<tr>
				<th colspan="2">
					해바라기 씨를 곁들인 콩나물 감자볶음
				</th>
			</tr>
			<tr>
				<td>아무튼 영양소</td>
			</tr>
		</table>
	</body>
	<script>
		listCall();
		
		var category = "나만의 레시피";
		$('#rinsert').on('click', function() {
		    var content = '';
		    content += '<tr>';
		    content += '<td>';
		    content += '<input type="text" name="recipe_name" placeholder="레시피의 이름을 입력해 주세요" style="border:none; width:300px"/>';
		    content += '<input type="button" id="rNameinsert" value="확인"/>';
		    content += '</td>';
		    content += '</tr>';		
			$('#rinsertbox').empty();
		    $('#rinsertbox').append(content);

		    
		    $('#rNameinsert').on('click', function(){
				var recipe_name = $('input[name="recipe_name"]').val();
				// 추후 수정
				var user_no = "1";
				console.log("레시피 이름 : "+recipe_name);
				console.log(user_no);
				console.log(category);
				
				var param = {};
				param.recipe_name = recipe_name;
				param.user_no = user_no;
				param.category = category;
				
				$.ajax({
					type:'post',
					url:'rlistUpdate.do',
					data:param,
					success:function(data){
						console.log(data);
					},
					error:function(e) {
						console.log(e);
					}
				});
			});
		});
		
		function listCall() {
			$.ajax({
				type:'get',
				url:'listCall',
				data:{},
				dataType:'json',
				success:function(data){
					console.log(data);
					drawList(data.list);
				},
				error:function(e) {
					console.log(e);
				}
			});
		}
		
		function drawList(mRecipeList)		 
		
	</script>
</html>