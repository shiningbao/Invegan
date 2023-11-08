<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invegan - 식단관리</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	table, th, td{
		border-collapse: collapse;
		padding: 3px 10px;
		font-size: 13px;
	}
	
	#listArea, #showNutri, #layerBox{
		display: inline-block;
	}
	#listArea{
		margin: 0px 10px 0px 30px;
		border-right: 2px solid lightgray;
	}
	
	.mealBtn{
		border: 1px solid black;
		background-color: white;
		border-radius: 4px;
	}
	.mealBtn:hover{
		cursor: pointer;
	}
	#listBox{
		width: 810px;
		margin: 0;
	}
	#foodListHead{
		height: 30px;
		width: 95%;
		border: 1px solid black;
	}
	#foodListHead th{
		height: 25px;
		border: 1px solid black;
	}
	#foodListBox{
		height: 430px;
		width: 94.8%;
		overflow: auto;
		overflow-x:hidden; 
		border: 1px solid black;
	}
	#msg{
		text-align: center;
	}
/* 	#foodListBox::-webkit-scrollbar{
		width: 3px;
	}
	#foodListBox::-webkit-thumb{
		width: 3px;
	}
	#foodListBox::-webkit-track{
		width: 3px;
	} */
	#foodList{
		width: 104%;
	}
	#showNutri table{
		width: 300px;
		height:540px;
	}
	.foodItem:hover{
		cursor: pointer;
	}	
	#gBox{
		width: 30px;
	}
</style>
</head>
<body>
	<div id="defaultMenuBox">
		<div id="listArea">
			<ul>
				<li ><input id="breakfast" class="mealBtn" type="button" value="아침" onclick="meal(this)"/></li> 
				<li ><input id="lunch" class="mealBtn" type="button" value="점심" onclick="meal(this)"/></li> 
				<li ><input id="dinner" class="mealBtn" type="button" value="저녁" onclick="meal(this)"/></li> 
				<li ><input id="etc" class="mealBtn" type="button" value="기타" onclick="meal(this)"/></li> 
				<li><input id=searchBox type="text" placeholder="식품 검색" /><button type="button" onclick="searchFood()">검색</button></li>
				<li><input id="gBox" name="gram" type="text"/> g</li>
				<li><input type="button" value="완료" onclick="addMenu()"/></li>
			</ul>
			
			<div id="listBox">
				<table id="foodListHead">
					<colgroup>
						<col width="5%">
						<col width="60%">
						<col width="20%">
						<col width="8%">
						<col width="7%">
					</colgroup>
					<tr>
						<th>No.</th>
						<th>식품명</th>
						<th>분류</th>
						<th>제공량(g)</th>
						<th>kcal</th>
					</tr>
				</table>
				<div id="foodListBox">
					<div id="msg">
						<h3>식품을 검색해 주세요</h3>
					</div>
					<table id="foodList">
					
					<!-- 검색결과 영역 -->
					</table>
				</div>
			</div>
		</div>
		<div id="showNutri">
			<table>
				<tr> <td colspan="2"><h2 id="food_name">식품을 선택해주세요</h2></td> </tr>
				<tr> <td>1회 제공량</td> <td id="serving_size">0 g</td> </tr>
				<tr> <td>kcal</td> <td id="kcal">0 kcal</td> </tr>
				<tr> <td>탄수화물</td> <td id="carb">0 g</td> </tr>
				<tr> <td>단백질</td> <td id="prot">0 g</td> </tr>
				<tr> <td>지방</td> <td id="fat">0 g</td> </tr>
				<tr> <td>수분</td> <td id="h2o">0 g</td> </tr>
				<tr> <td>총 당류</td> <td id="sugar">0 g</td> </tr>
				<tr> <td>총 식이섬유</td> <td id="fiber">0 g</td> </tr>
				<tr> <td>칼슘</td> <td id="ca">0 mg</td> </tr>
				<tr> <td>철</td> <td id="fe">0 mg</td> </tr>
				<tr> <td>마그네슘</td> <td id="mg">0 mg</td> </tr>
				<tr> <td>인</td> <td id="p">0 mg</td> </tr>
				<tr> <td>칼륨</td> <td id="k">0 mg</td> </tr>
				<tr> <td>나트륨</td> <td id="na">0 mg</td> </tr>
				<tr> <td>아연</td> <td id="zn">0 mg</td> </tr>
				<tr> <td>비타민A</td> <td id="vit_a">0 µg</td> </tr>
				<tr> <td>비타민B6</td> <td id="vit_b6">0 mg</td> </tr>
				<tr> <td>비타민B12</td> <td id="vit_b12">0 mg</td> </tr>
				<tr> <td>비타민C</td><td id="vit_c">0 mg</td> </tr>
				<tr> <td>필수 아미노산</td> <td id="essential">0 mg</td> </tr>
				<tr> <td>오메가3</td> <td id="omega3">0 g</td> </tr>
			</table>
			
		</div>
		
	</div>
</body>
<script>
	var foodId = 0;;
	var diet_category = ''; // 아침/ 점심 /저녁/ 기타
	var gram = 0;
	
	function addMenu() {
		gram = $('#gBox').val();
		console.log('foodId : '+foodId +" / diet_category : "+diet_category+ " / gram : "+ gram);
		if(diet_category == ""){
			alert("아침 / 점심 / 저녁 / 기타 중에 선택해 주세요");
		}else if(foodId == ""){
			alert("식품을 선택해주세요");
			$('#searchBox').focus();
		}else if(gram == 0){
			alert("선택한 식품의 섭취량을 입력해주세요");		
		}else if(isNaN(gram)){
			alert("중량에는 숫자만 입력해주세요");
		}else{
			if(!confirm($('#food_name').text()+" "+gram+"g 을 "+diet_category+"에 추가하시겠습니까?")){
				return false;
			}else{
				var params = { };
				params.select_date = selectDate;
				params.food_id = foodId;
				params.diet_category = diet_category;
				params.menu_category = menu_category;
				params.recipe_name = recipe_name; 
				params.gram = gram;
				
				$.ajax({
					type:'get',
					url:'addMenu.do',
					data:params,
					dataType:'JSON',
					success:function(data){
						opener.location.reload();
						self.close();
					},
					error:function(data){
					}
				});
			}
		}
		
		
		
		
		
	}
	
	function meal(obj){
		diet_category = obj.value;
		if(diet_category === '아침'){
			$('#breakfast').css('border','2px solid green');
			$('#lunch').css('border','1px solid black');
			$('#dinner').css('border','1px solid black');
			$('#etc').css('border','1px solid black');
			$('#searchBox').focus();
		}else if(diet_category === '점심'){
			$('#breakfast').css('border','1px solid black');
			$('#lunch').css('border','2px solid green');
			$('#dinner').css('border','1px solid black');
			$('#etc').css('border','1px solid black');
			$('#searchBox').focus();
		}
		else if(diet_category === '저녁'){
			$('#breakfast').css('border','1px solid black');
			$('#lunch').css('border','1px solid black');
			$('#dinner').css('border','2px solid green');
			$('#etc').css('border','1px solid black');
			$('#searchBox').focus();
		}else if(diet_category === '기타'){
			$('#breakfast').css('border','1px solid black');
			$('#lunch').css('border','1px solid black');
			$('#dinner').css('border','1px solid black');
			$('#etc').css('border','2px solid green');
			$('#searchBox').focus();
		}
	}
	
	
	function searchFood(){
		var keyword = $('#searchBox').val().trim();
		
		if(keyword == ''){
			$('#searchBox').val('');
		}else{
			console.log(keyword);
			
			$.ajax({
				type:'get',
				url:'searchFood',
				data:{'keyword':keyword},
				dataType:'JSON',
				success:function(data){
					drawList(data);
					console.log(data.success);
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	};
	
	function drawList(data) {
		var content = '';
		
		if(data.success === 0){
			$('#foodList').empty();
			$('#msg h3').css('display','block');
			$('#msg h3').html("검색 결과가 없습니다");
			console.log($('#msg h3').css());
			console.log($('#msg h3').html());
		}else{
			content += '<colgroup><col width="5%"><col width="60%"><col width="20%"><col width="8%"><col width="7%"></colgroup>';
			data.findFoodList.forEach(function(item, idx) {
				
				content += '<tr class="foodItem" onclick="selectFood(this)">';
				content += '<td style="display:none"><input type="text" class="foodId" value="'+item.food_id+'"/></td>';
				content += '<td>'+(idx+1)+'</td>';
				content += '<td>'+item.food_name+'</td>';
				content += '<td>'+item.food_category+'</td>';
				content += '<td>'+item.serving_size+'</td>';
				content += '<td>'+item.kcal+'</td>';
				content += '</tr>';
			});
		}
		$('#msg h3').css('display', 'none');
		$('#foodList').empty();
		$('#foodList').append(content);
	};
	
	function selectFood(obj) {
		foodId = $(obj).find('.foodId').val();
	
        $('.foodItem').css('background','none');
        $(obj).css('background-color','#87878754');
		
		
		$('#gBox').focus();
		
		$.ajax({
			type:'get',
			url:'showNutri',
			data:{'foodId' : foodId },
			dataType:'JSON',
			success:function(data){
		 		var nutri = data.showNutri;
				drawNutri(nutri);
			},
			error:function(e){
				console.log(e);
			}
		});
	};
	
	function drawNutri(nutri) {
		if(nutri!=null){
			$('#food_name').empty();
			$('#food_name').html(nutri.food_name);
			$('#serving_size').empty();
			$('#serving_size').html(nutri.serving_size +" g");
			$('#kacl').empty();
			$('#kcal').html(nutri.kcal+" kcal");
			$('#carb').empty();
			$('#carb').html(nutri.carb +" g");
			$('#prot').empty();
			$('#prot').html(nutri.prot +" g");
			$('#fat').empty();
			$('#fat').html(nutri.fat +" g");
			$('#h2o').empty();
			$('#h2o').html(nutri.h2o +" g");
			$('#sugar').empty();
			$('#sugar').html(nutri.sugar +" g");
			$('#fiber').empty();
			$('#fiber').html(nutri.fiber +" g");
			$('#ca').empty();
			$('#ca').html(nutri.ca +" mg");
			$('#fe').empty();
			$('#fe').html(nutri.fe+" mg");
			$('#mg').empty();
			$('#mg').html(nutri.mg+" mg");
			$('#p').empty();
			$('#p').html(nutri.p+" mg");
			$('#k').empty();
			$('#k').html(nutri.k+" mg");
			$('#na').empty();
			$('#na').html(nutri.na+" mg");
			$('#zn').empty();
			$('#zn').html(nutri.zn+" mg");
			$('#vit_a').empty();
			$('#vit_a').html(nutri.vit_a+" µg");
			$('#vit_b6').empty();
			$('#vit_b6').html(nutri.vit_b6+" mg");
			$('#vit_b12').empty();
			$('#vit_b12').html(nutri.vit_b12+" mg");
			$('#vit_c').empty();
			$('#vit_c').html(nutri.vit_c+" mg");
			$('#essential').empty();
			$('#essential').html(nutri.essential+" mg");
			$('#omega3').empty();
			$('#omega3').html(nutri.omega3+" g");
		}
	};
	
</script>
</html>