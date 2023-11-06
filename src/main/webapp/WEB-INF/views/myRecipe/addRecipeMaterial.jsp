<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<style>	
			   table {
			    border-collapse: collapse;
			    white-space: nowrap;
			  }
			
			  th, td {
			    padding: 8px;
			    text-align: left;
			    height: 40px;
			  }
			  
			  div.scrollbar{
			  	overflow : auto;
			  	width : 1000px;
			  	height: 457.6px;
			  	border: 1px solid black;
			  }
			  
			  #box {
			  	width : 1000px;
			  }
			  
			  #name {
			  	width : 300px;
			  }
			  
			  #sbutton, #gram {
			  	float: right;
			  	padding : 0px 0px 5px 0px;
			  }
			  
			  #down {
			  	padding : 5px 0px 0px 0px;
			  }
		</style>
	</head>
	<body>
		<div id = "box">
			<div id = "sbutton">
				<input type="text" name="fname" placeholder="재료 검색"/> <input type="button" id="msearch" value="검색"/>
			</div>
			<div class="scrollbar">
				<table>
					<thead>
						<tr>
							<th>No.</th>
							<th>식품명</th>
							<th>분류</th>
							<th>1회 제공량(g)</th>
							<th>에너지(kcal)</th>
							<th>수분(g)</th>
							<th>단백질(g)</th>
							<th>지방(g)</th>
							<th>탄수화물(g)</th>
							<th>총 당류(g)</th>
							<th>총 식이섬유(g)</th>
							<th>칼슘(mg)</th>
							<th>철(mg)</th>
							<th>마그네슘(mg)</th>
							<th>인(mg)</th>
							<th>칼륨(mg)</th>
							<th>나트륨(mg)</th>
							<th>아연(mg)</th>
							<th>비타민A(ug)</th>
							<th>비타민B6(mg)</th>
							<th>비타민B12(mg)</th>
							<th>비타민C(mg)</th>
							<th>필수 아미노산(mg)</th>
							<th>오메가 3(g)</th>
						</tr>
					</thead>				
					<tbody id = "materialList">
						<!-- 여기에 입력 -->
					</tbody>
				</table>
			</div>
			<div id="down">
				<a href='#'>찾으시는 식재료가 없으신가요?</a>
				<a><input type="text" name="gram"/> g</a>	
			</div>
			<input type="button" id ="mMaterial" value="완료"/>
		</div>
	</body>
	<script>
		var food_id; // food_id
		var fName;
		var mName; // material_name
		var grams; // gram

		$('#msearch').on('click', function(){
			fName = $('input[name="fname"]').val();
			
			console.log('food_name : '+fName); 
			
				$.ajax({
					type:'get',
				    url:'mlist.do',
				    data:{'fName' : fName},
				    dataType:'json',
				    success:function(data){
				       console.log(data);
				       drawList(data.mlist);
				    },
				    error:function(e){
				       console.log(e);
				    }
				});
		});
		
		function drawList(mlist) {
			console.log(mlist);
			var content = '';
			mlist.forEach(function(item, idx){
					content += '<tr>';
					content += '<td>'+(idx+1)+'</td>';
					content += '<td style="display : none;">'+item.food_id+'</td>';
					content += '<td>'+item.food_name+'</td>';
					content += '<td>'+item.food_category+'</td>';
					content += '<td>'+item.serving_size+'</td>';
					content += '<td>'+item.kcal+'</td>';
					content += '<td>'+item.h2o+'</td>';
					content += '<td>'+item.prot+'</td>';
					content += '<td>'+item.fat+'</td>';
					content += '<td>'+item.carb+'</td>';
					content += '<td>'+item.sugar+'</td>';
					content += '<td>'+item.fiber+'</td>';
					content += '<td>'+item.ca+'</td>';
					content += '<td>'+item.fe+'</td>';
					content += '<td>'+item.mg+'</td>';
					content += '<td>'+item.p+'</td>';
					content += '<td>'+item.k+'</td>';
					content += '<td>'+item.na+'</td>';
					content += '<td>'+item.zn+'</td>';
					content += '<td>'+item.vit_a+'</td>';
					content += '<td>'+item.vit_b6+'</td>';
					content += '<td>'+item.vit_b12+'</td>';
					content += '<td>'+item.vit_c+'</td>';
					content += '<td>'+item.essential+'</td>';
					content += '<td>'+item.omega3+'</td>';
					content += '</tr>';
			});
			$('#materialList').empty();
			$('#materialList').append(content);
		}
		
        $('#materialList').on('click', 'tr', function() {
        	$('#materialList tr').css('border', 'none');
            food_id = $(this).find('td:eq(1)').text();
            fName = $(this).find('td:eq(2)').text();
            $(this).css('border','2px solid green');
            console.log('클릭한 food_name: ' + fName);
        });
        
        $('#mMaterial').on('click', function() {
        	grams = $('input[name="gram"]').val();
        	console.log('전송한 food_name : ' + mName);
        	console.log('입력한 grams 수 : '+grams);
        	
        	// gram에 문자가 있을경우 alert
        	var regex = new RegExp('[a-zA-Zㄱ-ㅎ가-힣]');
        	var match = regex.test(grams);
        	if (match) {
        		alert('숫자만 넣어주세요');
        		$('input[name="gram"]').val('');
        	}
        	
        	$.ajax({
        		type:'get',
        		url:'mMaterial',
        		data:{"food_id":food_id, "grams":grams},
        		dataType:'JSON',
        		success:function(data){
        			console.log(data);
        		},
        		error:function(e) {
        			console.log(e);
        		}
        	});
			location.href='MyRecipeList.go';
        });
		
	</script>
</html>