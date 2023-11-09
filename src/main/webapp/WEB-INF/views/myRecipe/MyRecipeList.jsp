<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<style>					
			table{
				border-collapse: collapse;
			}
			
			/* 카테고리 버튼 */
			.button {
				height: 22px;
				border: 1px solid black;
				background-color: white;
				border-radius: 4px;
				cursor: pointer;
				text-align: center;
			}
			
			/* 큰 테두리 */
			#main {
				width: 1200px;
				height: 600px;
				margin : 0px 10px 0px 0px;
				position: relative;
			}
			
			/* r:레시피 */
			#rbox {
				width : 720px;
				margin: 46px 0px 0px 30px;
			}
			
			#rbox table {
				width: 700px;
				text-align: center;
				font-size: 15px;
			}
			#rbox th {
				height: 38px;
			}
			
			#rbox td {
				height: 33px;
			
			}
			
			#thead{
				width: 718.4px;
				height: 40px;
				border : solid 1px black;
				margin: 15px 0px 0px 0px;
			}
			
			#mrbody {
				width : 718.4px;
				height: 210px;
				border : solid 1px black;
				border-top: none;
				overflow-x : hidden;
				overflow-y : scroll;	
			}
			
			.ibutton {
				margin-left: 405px;
			}
			
			.fbutton {
				margin-left: 35px;
			}
			
			/* rm:재료 */
			#rmbox {
				width: 720px;
				margin: 46px 10px 0px 30px;
				position: absolute;
				bottom: 14px;
			}
			
			#rmbox table{
				width: 700px;
				text-align: center;
				font-size : 15px;
			}
			#rmbox th {
				height: 38px;
			}
			#rmbox td {
				height: 33px;
			}
			
			#rmbody {
				width: 718.4px;
				height: 210px;
				border : 1px solid black;
				overflow-x : hidden;
				overflow-y : scroll;	
			}
			
			#rmtop {
				width : 720px;
			}
			
			#rmhead {
				width: 718.4px;
				border: solid 1px black;
				border-bottom: none;
			}
			
			#rmhead table{
				width: 700px;
			}

			/* rN:영양소 표시 */			
			#rNutri {
				width: 310px;
				height: 560px;
				border-left: 2px solid lightgray;
				position: absolute;
				top : 24px;
				right: 100px;
			}
			
			#rNutri table{
				width: 300px;
				padding : 5px 10px;
				margin-left: 10px; 
			}
			
			#rNutri th {
				height : 29px;
				font-size: 15px;
				padding : 3px;
			}
			
			#rNutri td{
				width : 150px;
				height: 19px;
				font-size: 13px;
				padding : 3px 10px;
			}
			
			td.nutri {
				text-align: center;
			}
			
			/* 모달창 */		
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
				 margin : 5% 0% 5% 11%;
				 padding: 20px;
				 border: 1px solid #888;
				 width: 800px;
			}

		</style>	
	</head>
	<body>
		<div id="main">
			<div id="rbox">		
				<input type="button" class="button" id="breakfast" value="아침"/>
				<input type="button" class="button" id="lunch" value="점심"/>
				<input type="button" class="button" id="dinner" value="저녁"/>
				<input type="button" class="button" id="other" value="기타"/>
				<button class="ibutton" onclick="rinsert()">+</button>
				<button onclick="rdel()">-</button>
				<input type="button" class="fbutton" onclick="dinsert()" value="완료"/>
				<div id = "thead">
					<table>
						<colgroup>
							<col width="50%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tr>
							<th>식품명</th>
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
			<div id="rmbox">
				<div id="mtop">
					<table>
						<colgroup>
							<col width="50%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tr>
							<th colspan="2"  style="width : 350px;">재료</th>
							<th>
								<button onclick="minsert()">+</button>
								<button onclick="mdel()">-</button>
							</th>
						</tr>
					</table>
				</div>
				<div id="rmhead">
					<table>
						<colgroup>
							<col width="50%">
							<col width="25%">
							<col width="25%">
						</colgroup>
						<tr>
							<th>재료 이름</th>
							<th>1회 제공량(g)</th>
							<th>에너지(kcal)</th>
						</tr>
					</table>				
				</div>
				<div id="rmbody">
					<table  id = "rMaterialList">
						<!-- 재료 출력 -->
					</table>
				</div>
			</div>
			<br>
			<br>
			<div id="rNutri">
				<table id = "rNutriList">
					<!-- 레시피 영양소 출력 -->
				</table>
			</div>
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
		var grams;
		
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
		    content += '<td>'+'</td>'+'<td>'+'</td>';
		    content += '</tr>';		
			$('#rinsertbox').empty();
		    $('#rinsertbox').append(content);

		    // 나만의 레시피 이름 입력창
		    $('#rNameinsert').on('click', function(){
				recipe_name = $('input[name="recipe_name"]').val();
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
				myRecipeMenu();
			});
		};
		
		

		// 리스트 그리기
		function drawList(mrlist) {
			console.log(mrlist);
			var content = "";
			mrlist.forEach(function(item, idx){	
				if (item.hidden == 0){
					content += '<tr>';
					content += '<td style="display : none;">'+item.menu_id+'</td>';
					content += '<td width="50%">'+item.recipe_name+'</td>';
					content += '<td width="25%">'+item.grams+'</td>';
					content += '<td width="25%">'+item.kcal+'</td>';
					content += '</tr>';
				}
			});
			$('#rMaterialList').empty();
			$('#mrList').empty();
			$('#mrList').append(content);
		
		}
		
		// 레시피 리스트
		$('#mrList').on('click', 'tr', function() {
			$('#rNutriList').empty();
        	$('#mrList tr').css('background', 'none');
            menu_id = $(this).find('td:eq(0)').text();
            var rName = $(this).find('td:eq(1)').text();
            grams = $(this).find('td:eq(2)').text();
            $(this).css('background','#87878754');
            console.log('클릭한 레시피 번호: '+menu_id);
            console.log('클릭한 레시피 이름: ' + rName);
            console.log('클릭한 레시피 무게: '+grams);
		
            // 레시리 재료 리스트
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
            
            // 레시피 영양소
            $.ajax({
            	type:'get',
            	url:'rNutri.do',
            	data:{"menu_id":menu_id},
            	success:function(data){
            		console.log(data);
            		drawrNList(data.rNutri, data.success);
            	},
            	error:function(e) {
            		console.log(e);
        			$('#rNutriList').empty();
            	}
            });
       });
		
		// 레시피 영양소 그리기
		function drawrNList(rNutri, success) {
			console.log(rNutri);
				var content = '';
				rNutri.forEach(function(item, idx){
					content += '<tr>'+ '<th colspan="2">'+item.recipe_name+'</th>'+'</tr>';
					content += '<tr>'+'<td>'+'제공량 '+'</td>'+'<td class="nutri">'+item.grams+'g'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'열량 '+'</td>'+'<td class="nutri">'+item.kcal+'kcal'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'탄수화물 '+'</td>'+'<td class="nutri">'+item.carb+'g'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'단백질 '+'</td>'+'<td class="nutri">'+item.prot+'g'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'지방 '+'</td>'+'<td class="nutri">'+item.fat+'g'+'</td>'+'</tr>';		
					content += '<tr>'+'<td>'+'총 당류 '+'</td>'+'<td class="nutri">'+item.sugar+'g'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'총 식이섬유 '+'</td>'+'<td class="nutri">'+item.fiber+'g'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'칼슘 '+'</td>'+'<td class="nutri">'+item.ca+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'철 '+'</td>'+'<td class="nutri">'+item.fe+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'마그네슘 '+'</td>'+'<td class="nutri">'+item.mg+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'인 '+'</td>'+'<td class="nutri">'+item.p+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'칼륨 '+'</td>'+'<td class="nutri">'+item.k+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'나트륨 '+'</td>'+'<td class="nutri">'+item.na+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'아연 '+'</td>'+'<td class="nutri">'+item.zn+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'비타민A '+'</td>'+'<td class="nutri">'+item.vit_a+'ug'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'비타민B6 '+'</td>'+'<td class="nutri">'+item.vit_b6+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'비타민B12 '+'</td>'+'<td class="nutri">'+item.vit_b12+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'비타민C '+'</td>'+'<td class="nutri">'+item.vit_c+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'필수 아미노산 '+'</td>'+'<td class="nutri">'+item.essential+'mg'+'</td>'+'</tr>';
					content += '<tr>'+'<td>'+'오메가3 '+'</td>'+'<td class="nutri">'+item.omega3+'mg'+'</td>'+'</tr>';
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
				content += '<td width="50%">'+item.food_name+'</td>';
				content += '<td width="25%">'+item.grams+'</td>';
				content += '<td width="25%">'+item.kcal+'</td>';
				content += '</tr>';
			});
			$('#rMaterialList').empty();
			$('#rMaterialList').append(content);	
		};
		
		// 레시피 재료 클릭
		$('#rMaterialList').on('click', 'tr', function() {
	       	$('#rMaterialList tr').css('background', 'none');
	       	material_id = $(this).find('td:eq(0)').text();
	        $(this).css('background-color','#87878754');
	        console.log('클릭한 재료의 id : '+material_id);
		});
		
		// 재료 추가
		function minsert() {
			if (menu_id == null){
				alert('재료를 추가할 레시피를 선택해주세요');
			} else {
				
				// 재료추가 모달창
				var modal = document.getElementById("mModal");
				modal.style.display = "block";		
				$('#modal-content').load("<c:url value='../myRecipe/addRecipeMaterial'/>");
				$(document).click(function(event) {
					  if (event.target === document.getElementById("myModal")) {
					    closeModal(); // 모달 외부 클릭 시 모달 닫기
					  }
				});
				
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
		
		// 재료 삭제
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
		        			if (data.success == true) {
		        				alert('재료가 삭제되었습니다.');
		        				myRecipeMenu();
		        			}

		        		},
		        		error:function(e){
		        			console.log(e);
		        		}
		        	});
				}
			}
        }
        
        // 레시피 삭제
		function rdel(){
			if (menu_id == null) {
				alert('제거하실 레시피를 선택해주세요');
				listCall();
			} else {
				if(!confirm('레시피를 삭제하시겠습니까?')){
					return false
				}else {
					$.ajax({
		        		type:'get',
		        		url:'rdelete.do',
		        		data:{"menu_id":menu_id},
		        		dataType:'json',
		        		success:function(data){
		        			console.log(data);
		        			if (data.success == true) {
		        				alert('레시피가 삭제되었습니다.');
		        				myRecipeMenu();
		        			}	
		        		},
		        		error:function(e){
		        			console.log(e);
		        		}
		        	});
				}
			}
		}
		
		// 아,점,저,기 버튼
		$('.button').on('click', function(){
			$('.button').css('background-color','');
			diet_category = $(this).val();
			console.log("식단의 카테고리 : "+diet_category);
			$(this).css('background-color','lightgreen');
		});
		
		// 식단 추가
		function dinsert() {
			if (diet_category == '') {
				alert('아침, 점심, 저녁, 기타 중 하나를 선택해주세요');
			} else if (menu_id == null) {
				alert('레시피를 선택해 주세요');
			} else if (grams == 0) {
				alert('레시피에 재료를 추가해 주세요');
			} else {
				if(!confirm("선택한 레시피를 식단에 추가하시겠습니까?")){
					return false;
				}else{
					var param = {};
					param.diet_category = diet_category;
					param.menu_id = menu_id;
					param.date = selectDate;
					
					console.log(param);
					
					$.ajax ({
						type:'get',
						url:'dinsert.do',
						data:param,
						dataType:'json',
						success:function(data) {
							console.log(data);
							opener.location.reload();
							self.close();
						},
						error:function(e) {
							console.log(e);
						}
					});
				}
			}
		}
		
		
	</script>
</html>