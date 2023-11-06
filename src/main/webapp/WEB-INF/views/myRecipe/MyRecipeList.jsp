<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<style>
				
			ul{
				padding: 0;
			}
			
			li{
				display: inline-block;
			}
			
			#top {
				text-align: right;
				float: right;
				position: relative;
				top:-10px;
				right: 20px;
			}
			
			#top input{
				cursor: pointer;
				background: none;
				border: none;
				font-size: 25px;
			}
					
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
			
			input[name="meal"] {
				  width: 20px;
				  height: 20px; 
				  background-color: #007BFF;
				  border-radius: 50%;
				  display: inline-block;
				  margin-right: 10px;
				  cursor: pointer;
				}
			
		</style>
	</head>
	<body>
		<div>		
			<label><input type="radio" name="meal"/>아침</label>
			<label><input type="radio" name="meal"/>점심</label>
			<label><input type="radio" name="meal"/>저녁</label>
			<label><input type="radio" name="meal"/>기타</label>
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
		<input type="button" name="dinsert"value="완료"/>
		<br>
		<table id = "rNutriList">
			<!-- 레시피 영양소 출력 -->
		</table>
	</body>
	<script>
		listCall();
		var category = "나만의 레시피";
		var food_id;
		var menu_id;
		
		// 레시피 리스트 불러오기
		function listCall() {
			
			$.ajax({
				type:'post',
				url:'mrlistCall',
				data:{},
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
				console.log("레시피 이름 : "+recipe_name);
				
				$.ajax({
					type:'post',
					url:'rlistUpdate.do',
					data:{"recipe_name" : recipe_name},
					success:function(data){
						console.log(data);
					},
					error:function(e) {
						console.log(e);
					}
				});
				$('#mrList').empty();
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
            
            $.ajax({
            	type:'get',
            	url:'rNutri.do',
            	data:{"menu_id":menu_id},
            	success:function(data){
            		console.log(data);
            		drawrNList(data.rNutri);
            	},
            	error:function(e) {
            		console.log(e);
            	}
            });
       });
		
		// 레시피 영양소 그리기
		function drawrNList(rNutri) {
			console.log(rNutri);
			var content = "";
			rNutri.forEach(function(item, idx){
				content += '<tr>';
				content += '<td>'+item.recipe_name+'</td>';
				content += '<td>'+'제공량 '+item.grams+'g'+'</td>';
				content += '<td>'+'열량 '+item.kcal+'kcal'+'</td>';
				content += '<td>'+'탄수화물 '+item.carb+'g'+'</td>';
				content += '<td>'+'단백질 '+item.prot+'g'+'</td>';
				content += '<td>'+'지방 '+item.fat+'g'+'</td>';
				content += '<td>'+'수분 '+item.h2o+'g'+'</td>';			
				content += '<td>'+'총 당류 '+item.sugar+'g'+'</td>';
				content += '<td>'+'총 식이섬유 '+item.fiber+'g'+'</td>';
				content += '<td>'+'칼슘 '+item.ca+'mg'+'</td>';
				content += '<td>'+'철 '+item.fe+'mg'+'</td>';
				content += '<td>'+'마그네슘 '+item.mg+'mg'+'</td>';
				content += '<td>'+'인 '+item.p+'mg'+'</td>';
				content += '<td>'+'칼륨 '+item.k+'mg'+'</td>';
				content += '<td>'+'나트륨 '+item.na+'mg'+'</td>';
				content += '<td>'+'아연 '+item.zn+'mg'+'</td>';
				content += '<td>'+'비타민A '+item.vit_a+'ug'+'</td>';
				content += '<td>'+'비타민B6 '+item.vit_b6+'mg'+'</td>';
				content += '<td>'+'비타민B12 '+item.vit_b12+'mg'+'</td>';
				content += '<td>'+'비타민C '+item.vit_c+'mg'+'</td>';
				content += '<td>'+'필수 아미노산 '+item.essential+'mg'+'</td>';
				content += '<td>'+'오메가3 '+item.omega3+'mg'+'</td>';
				content += '</tr>';
			});
			$('#rNutriList').empty();
			$('#rNutriList').append(content);
		};
		
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
			if (menu_id == null){
				alert('재료를 추가할 레시피를 선택해주세요');
			} else {
				$.ajax({
					type:'post',
					url:'minsert.do',
					data:{"menu_id" : menu_id},
					dataType:'json',
					success:function(data){
						console.log(data);
					},
					error:function(e){
						console.log(e);
					}
				});
				location.href = 'addRecipeMaterial';
			}
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