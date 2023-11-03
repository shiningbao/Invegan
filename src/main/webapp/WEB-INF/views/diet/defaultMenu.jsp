<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메뉴 추가하기</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	


}
	
</style>

</head>
<body>
	<div id="listArea">
		<ul>
			<li ><input id="breakfast" class="mealBtn" type="button" value="아침" onclick="meal(this)"/></li> 
			<li ><input id="lunch" class="mealBtn" type="button" value="점심" onclick="meal(this)"/></li> 
			<li ><input id="dinner" class="mealBtn" type="button" value="저녁" onclick="meal(this)"/></li> 
			<li ><input id="etc" class="mealBtn" type="button" value="기타" onclick="meal(this)"/></li> 
			<li><input id=searchBox type="text" placeholder="식품 검색" /><button type="button" onclick="searchFood()">검색</button></li>
			<li><input id="gBox" type="text"/>g</li>
		</ul>
		<div>
		<table id="foodListHead">
			<colgroup>
				<col width="5%">
				<col width="50%">
				<col width="20%">
				<col width="15%">
				<col width="15%">
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
			<table id="foodList">
			
			<!-- 검색결과 영역 -->
			</table>
		</div>
		</div>
	</div>
	<div id="showNutri">
		<table>
			<tr> <td colspan="2"><h2 id="food_name"></h2></td> </tr>
			<tr> <td>1회 제공량</td> <td id="serving_size"></td> </tr>
			<tr> <td>kcal</td> <td id="kcal"></td> </tr>
			<tr> <td>탄수화물</td> <td id="carb"></td> </tr>
			<tr> <td>단백질</td> <td id="prot"></td> </tr>
			<tr> <td>지방</td> <td id="fat"></td> </tr>
			<tr> <td>수분</td> <td id="h2o"></td> </tr>
			<tr> <td>총 당류</td> <td id="sugar"></td> </tr>
			<tr> <td>총 식이섬유</td> <td id="fiber"></td> </tr>
			<tr> <td>칼슘</td> <td id="ca"></td> </tr>
			<tr> <td>철</td> <td id="fe"></td> </tr>
			<tr> <td>마그네슘</td> <td id="mg"></td> </tr>
			<tr> <td>인</td> <td id="p"></td> </tr>
			<tr> <td>칼륨</td> <td id="k"></td> </tr>
			<tr> <td>나트륨</td> <td id="na"></td> </tr>
			<tr> <td>아연</td> <td id="zn"></td> </tr>
			<tr> <td>비타민A</td> <td id="vit_a"></td> </tr>
			<tr> <td>비타민B6</td> <td id="vit_b6"></td> </tr>
			<tr> <td>비타민B12</td> <td id="vit_b12"></td> </tr>
			<tr> <td>비타민C</td><td id="vit_c"></td> </tr>
			<tr> <td>필수 아미노산</td> <td id="essential"></td> </tr>
			<tr> <td>오메가3</td> <td id="omega3"></td> </tr>
		</table>
	</div>
	<div>
		<input type="button" value="완료" onclick="addMenu()"/>
	</div>
</body>
<script>
	var selectDate = opener.document.getElementById('selectDate').value;
	var foodId;
	var diet_category; // 아침/ 점심 /저녁/ 기타
	var gram;
	 // 기본메뉴 / 나만의 레시피 메뉴
	
	function addMenu() {
		gram = $('#gBox').val();
		console.log('foodId : '+foodId +" / diet_category : "+diet_category+ " / gram : "+ gram);
		if(foodId == null){
			alert("식품을 선택해주세요");
			$('#searchBox').focus();
		}else if(diet_category == null){
			alert("아침 / 점심 / 저녁 / 기타 중에 선택해 주세요");
		}else if(gram == null){
			alert("선택한 식품의 섭취량을 입력해주세요");		
		}
		
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
				
			},
			error:function(e){
				console.log(e);
			}
		});
		
		
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
		var keyword = $('#searchBox').val();
		console.log(keyword);
		
		$.ajax({
			type:'get',
			url:'searchFood',
			data:{'keyword':keyword},
			dataType:'JSON',
			success:function(data){
				drawList(data);
			},
			error:function(e){
				console.log(e);
			}
		});
	};
	
	function drawList(data) {
		var content = '';
		
		if(data.success == 0){
			content += '<h3>'+data.msg+'</h3>';
		}else{
			content += '<colgroup><col width="5%"><col width="50%"><col width="20%"><col width="15%"><col width="15%"></colgroup>';
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
		$('#foodList').empty();
		$('#foodList').append(content);
	};
	
	function selectFood(obj) {
		foodId = $(obj).find('.foodId').val();
	
        $('.foodItem').css('border-color', 'white');
        $(obj).css('border','1px solid green');
		
		
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
			$('#serving_size').html(nutri.serving_size);
			$('#kacl').empty();
			$('#kcal').html(nutri.kcal);
			$('#carb').empty();
			$('#carb').html(nutri.carb);
			$('#prot').empty();
			$('#prot').html(nutri.prot);
			$('#fat').empty();
			$('#fat').html(nutri.fat);
			$('#h2o').empty();
			$('#h2o').html(nutri.h2o);
			$('#sugar').empty();
			$('#sugar').html(nutri.sugar);
			$('#fiber').empty();
			$('#fiber').html(nutri.fiber);
			$('#ca').empty();
			$('#ca').html(nutri.ca);
			$('#fe').empty();
			$('#fe').html(nutri.fe);
			$('#mg').empty();
			$('#mg').html(nutri.mg);
			$('#p').empty();
			$('#p').html(nutri.p);
			$('#k').empty();
			$('#k').html(nutri.k);
			$('#na').empty();
			$('#na').html(nutri.na);
			$('#zn').empty();
			$('#zn').html(nutri.zn);
			$('#vit_a').empty();
			$('#vit_a').html(nutri.vit_a);
			$('#vit_b6').empty();
			$('#vit_b6').html(nutri.vit_b6);
			$('#vit_b12').empty();
			$('#vit_b12').html(nutri.vit_b12);
			$('#vit_c').empty();
			$('#vit_c').html(nutri.vit_c);
			$('#essential').empty();
			$('#essential').html(nutri.essential);
			$('#omega3').empty();
			$('#omega3').html(nutri.omega3);
		}
	};
	
</script>
</html>