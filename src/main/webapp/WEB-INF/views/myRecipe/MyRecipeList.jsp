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
			<button onclick="rinsert()">+</button>
			<button onclick="rdel()">-</button>
			<table id = "mRecipeList">	
				<thead>
					<tr>
						<th id = food_name>식품명</th>
						<th>1회 제공량(g)</th>
						<th>에너지(kcal)</th>
					</tr>
				</thead>
				<tbody id=mrList>				
					<!-- 레시피 데이터 출력 -->
				</tbody>
				<tbody id=rinsertbox>
					<!-- 레시피 이름 입력칸 -->
				</tbody>
			</table>
		</div>
		<br>
		<table>
			<thead>
				<tr>
					<th colspan="2"  style="width : 350px;">재료</th>
					<th>
						<button onclick="minsert()">+</button>
						<button onclick="mdel()">-</button>
					</th>
				</tr>
				<tr>
					<th style="width : 300px;">재료 이름</th>
					<th>1회 제공량(g)</th>
					<th>에너지(kcal)</th>
				</tr>
			<tbody  id = "rMaterialList">
				<!-- 재료 출력 -->
			</tbody>
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
		var food_id;
		var menu_id;
		
		// 레시피 리스트 불러오기
		function listCall() {
			
			var rparam = {};
			
			$.ajax({
				type:'post',
				url:'listCall',
				data:{'user_no' : 1},
				dataType:'json',
				success:function(data){
					console.log(data);
					drawList(data.mrlist);
				},
				error:function(e) {
					console.log(e);
				}
			});
		}
		
		// 레시피 추가
		function rinsert() {
		    var content = '';
		    content += '<tr>';
		    content += '<td>';
		    content += '<input type="text" name="recipe_name" placeholder="레시피의 이름을 입력해 주세요" style="border:none; width:300px"/>';
		    content += '<input type="button" id="rNameinsert" value="확인"/>';
		    content += '</td>';
		    content += '</tr>';		
			$('#rinsertbox').empty();
		    $('#rinsertbox').append(content);

		    // 나만의 레시피 이름 입력창
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
				listCall();
				$('#rinsertbox').empty();
			});
		};
		
		

		// 리스트 그리기
		function drawList(mrlist) {
			console.log(mrlist);
			var content = "";
			mrlist.forEach(function(item, idx){
				content += '<tr>';
				content += '<td style="display : none;">'+item.menu_id+'</td>';
				content += '<td>'+item.recipe_name+'</td>';
				content += '<td>'+item.grams+'</td>';
				content += '<td>'+item.kcal+'</td>';
				content += '</tr>';
			});
			$('#rMaterialList').empty();
			$('#mrList').empty();
			$('#mrList').append(content);
		
		}
		
		// 레시피에 들어있는 재료 리스트
		$('#mrList').on('click', 'tr', function() {
        	$('#mrList tr').css('border', 'none');
            menu_id = $(this).find('td:eq(0)').text();
            var rName = $(this).find('td:eq(1)').text();
            $(this).css('border','2px solid green');
            console.log('클릭한 food_name: ' + rName);
            console.log('클릭한 레시피 번호 :'+menu_id);
		
            $.ajax({
            	type:'post',
            	url:'rMaterial.do',
            	data:{"menu_id":menu_id},
            	success:function(data){
            		console.log(data.rMaterial);
            		drawmList(data.rMaterial);
            	},
            	error:function(e) {
            		console.log(e);
            	}
            });
       });
		
		// 재료 리스트 그리기
		function drawmList(rMaterial) {
			console.log(rMaterial);
			var content = "";
			rMaterial.forEach(function(item, idx){
				content += '<tr>';
				content += '<td style="display : none;">'+item.food_id+'</td>';
				content += '<td>'+item.food_name+'</td>';
				content += '<td>'+item.grams+'</td>';
				content += '<td>'+item.kcal+'</td>';
				content += '</tr>';
			});
			$('#rMaterialList').empty();
			$('#rMaterialList').append(content);	
		};
		
		$('#rMaterialList').on('click', 'tr', function() {
	       	$('#rMaterialList tr').css('border', 'none');
	        food_id = $(this).find('td:eq(0)').text();
	        var fName = $(this).find('td:eq(1)').text();
	        $(this).css('border','2px solid green');
	        console.log('클릭한 food_name: ' + fName);
	        console.log('클릭한 재료 번호 :'+food_id);
		});
		
		function minsert() {
			
		}
		
        function mdel() {
        	
			if (food_id == null) {
				alert('제거하실 재료를 선택해주세요');
				listCall();
			} else{
				var deletechk = confirm('재료를 삭제하시겠습니까?');
				if (deletechk == true){
					
					$.ajax({
		        		type:'get',
		        		url:'mdelete.do',
		        		data:{"food_id":food_id, "menu_id":menu_id},
		        		dataType:'json',
		        		success:function(data){
		        			console.log(data);
		        			if (data.mdelete == true) {
		        				alert('재료가 삭제되었습니다.');
		        				listCall();
		        			}

		        		},
		        		error:function(e){
		        			console.log(e);
		        		}
		        	});
				}
			}
        }
        
		function rdel(){
			if (menu_id == null) {
				alert('제거하실 레시피를 선택해주세요');
				listCall();
			} else {
				var deletechk = confirm('레시피를 삭제하시겠습니까?');
				if(deletechk == true){
					$.ajax({
		        		type:'get',
		        		url:'rdelete.do',
		        		data:{"menu_id":menu_id},
		        		dataType:'json',
		        		success:function(data){
		        			console.log(data);
		        			if (data.rdelete == true) {
		        				alert('레시피가 삭제되었습니다.');
		        				listCall();
		        			}

		        		},
		        		error:function(e){
		        			console.log(e);
		        		}
		        	});
				} else {
					listCall();
				}
			}
		}
	</script>
</html>