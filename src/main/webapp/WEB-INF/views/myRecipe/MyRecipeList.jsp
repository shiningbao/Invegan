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
				border-collapse: collapse;
				padding : 5px 10px;
				width: 700px;
				text-align: center;
			}
			
			tr {
				height: 30px;
			}
			
			th, td { 
				border-collapse: collapse;
				padding : 5px 10px;
				text-align: center;
			}

			
			#thead{
				width: 710px;
				border : solid 1px black;
			}
			
			#mrbody {
				width : 710px;
				height: 186px;
				border : solid 1px black;
				border-top: none;
				overflow-x : hidden;
				overflow-y : scroll;	
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
			
			#main {
				width: 1200px;
			}
			
			.button {
			    background-color : white;
			    padding: 10px;
			    margin: 5px;
			    cursor: pointer;
			}
			
			.button.active {
				background-color : lightgreen;
			}
			
			.modal {
				 display: none;
				 position: fixed;
				 z-index: 1;
				 left: 0;
				 top: 0;
				 width: 100%;
				 height: 100%;
				 background-color: rgba(0, 0, 0, 0.7);
			}
			
			#modal-content {
				 position: absolute;
				 background-color: #fefefe;
				 margin: 15% auto;
				 padding: 20px;
				 border: 1px solid #888;
				 width: 80%;
			}
			

		</style>
	</head>
	<body>
		<div id="main">
			<div>		
				<button class="button" id="breakfast">아침</button>
				<button class="button" id="lunch">점심</button>
				<button class="button" id="dinner">저녁</button>
				<button class="button" id="other">기타</button>
				<button onclick="rinsert()">+</button>
				<button onclick="rdel()">-</button>
				<div id = "thead">
					<table>
						<tr>
							<th id = food_name>식품명</th>
							<th>1회 제공량(g)</th>
							<th>에너지(kcal)</th>
						</tr>
					</table>
				</div>
				<div id = mrbody>
					<div id = tbody>
						<table id=mrList>				
							<!-- 레시피 데이터 출력 -->
						</table>
					</div>
					<table id=rinsertbox>
						<!-- 레시피 이름 입력칸 -->
					</table>
				</div>
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
			<input type="button" onclick="dinsert()" value="완료"/>
			<br>
			<table id = "rNutriList">
				<!-- 레시피 영양소 출력 -->
			</table>
		</div>
		
		<div id="mModal" class="modal">
			<div id="modal-content">
				<!-- 모달의 내용이 출력됨 -->
				<p>모달 내용을 이곳에 추가하세요.</p>
			</div>	
		</div>
	</body>
	<script>
		listCall();
		var category = "나만의 레시피";
		var food_id;
		var menu_id;
		var material_id;
		var diet_category;
		var selectDate = $('#getDate').val();
		
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
				content += '<tr>'+ '<td colspan="2">'+item.recipe_name+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'제공량 '+'</td>'+'<td>'+item.grams+'g'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'열량 '+'</td>'+'<td>'+item.kcal+'kcal'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'탄수화물 '+'</td>'+'<td>'+item.carb+'g'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'단백질 '+'</td>'+'<td>'+item.prot+'g'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'지방 '+'</td>'+'<td>'+item.fat+'g'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'수분 '+'</td>'+'<td>'+item.h2o+'g'+'</td>'+'</tr>';			
				content += '<tr>'+'<td>'+'총 당류 '+'</td>'+'<td>'+item.sugar+'g'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'총 식이섬유 '+'</td>'+'<td>'+item.fiber+'g'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'칼슘 '+'</td>'+'<td>'+item.ca+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'철 '+'</td>'+'<td>'+item.fe+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'마그네슘 '+'</td>'+'<td>'+item.mg+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'인 '+'</td>'+'<td>'+item.p+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'칼륨 '+'</td>'+'<td>'+item.k+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'나트륨 '+'</td>'+'<td>'+item.na+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'아연 '+'</td>'+'<td>'+item.zn+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'비타민A '+'</td>'+'<td>'+item.vit_a+'ug'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'비타민B6 '+'</td>'+'<td>'+item.vit_b6+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'비타민B12 '+'</td>'+'<td>'+item.vit_b12+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'비타민C '+'</td>'+'<td>'+item.vit_c+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'필수 아미노산 '+'</td>'+'<td>'+item.essential+'mg'+'</td>'+'</tr>';
				content += '<tr>'+'<td>'+'오메가3 '+'</td>'+'<td>'+item.omega3+'mg'+'</td>'+'</tr>';
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
				content += '<td style="display : none;">'+item.material_id+'</td>';
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
	       	material_id = $(this).find('td:eq(0)').text();
	        $(this).css('border','2px solid green');
	        console.log('클릭한 재료의 id : '+material_id);
		});
		
		function minsert() {
			if (menu_id == null){
				alert('재료를 추가할 레시피를 선택해주세요');
			} else {
				
				var modal = document.getElementById("mModal");
				modal.style.display = "block";		
				$('#modal-content').load("<c:url value='../myRecipe/addRecipeMaterial'/>");
				
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
				/* location.href = 'addRecipeMaterial';*/
			}
		}
		
        function mdel() {
        	
			if (material_id == null) {
				alert('제거하실 재료를 선택해주세요');
				listCall();
			} else{
				var deletechk = confirm('재료를 삭제하시겠습니까?');
				if (deletechk == true){
					
					$.ajax({
		        		type:'get',
		        		url:'mdelete.do',
		        		data:{"material_id":material_id},
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
		
		// 아,점,저,기 버튼
		var buttons = document.querySelectorAll('.button');
		buttons.forEach(button => {
		    button.addEventListener('click', () => {
		        buttons.forEach(b => b.classList.remove('active'));
		        button.classList.add('active');
		        
		        diet_category = button.innerText;
		        console.log("클릭한 버튼의 텍스트 : "+diet_category);
		        console.log("날짜 : " + selectDate);
		    });
		});
		
		function dinsert() {
			if (diet_category == null) {
				alert('아침, 점심, 저녁, 기타 중 하나를 선택해주세요');
			} else if (menu_id == null) {
				alert('레시피를 선택해 주세요');
			} else {
				var param = {};
				param.diet_category = diet_category;
				param.menu_id = menu_id;
				param.date = selectDate;
				
				console.log(param);
				
				$.ajax ({
					type:'post',
					url:'dinsert',
					data:param,
					dataType:'json',
					success:function(data) {
						console.log(data);
					},
					error:function(e) {
						console.log(e);
					}
				});
			}
		}
		
		
	</script>
</html>