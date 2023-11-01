<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<style>			
			  table, th, td {
			    
			    width: 100%;
			  }
			  
			   table {
			    border-collapse: collapse;
			    white-space: nowrap;
			  }
			
			  th {
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
		</style>
	</head>
	<body>
		<div>
			<input type="text" name="fname"/><input type="button" id="msearch" value="검색"/>
		</div>
		<br>
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
						<th>비타민C(mg)</th>
						<th>필수 아미노산(mg)</th>
						<th>오메가 3(g)</th>
					</tr>
				</thead>				
				<tbody id = "materiallist">
					<!-- 데이터 출력 -->
				</tbody>
			</table>
		</div>
		<a href='#'>찾으시는 식재료가 없으신가요?</a>
		<a><input type="text"/>g</a>
		<button>완료</button>
	</body>
	<script>

		$('#msearch').on('click', function(){
			var fname = $('input[name="fname"]').val();
			
			console.log('food_name : '+fname); 
			
				$.ajax({
					type:'get',
				    url:'mlist.do',
				    data:{'fname' : fname},
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
				content += '<td>'+item.food_name+'</td>';
				content += '<td>'+item.food_category+'</td>';
				content += '<td>'+item.serving_size+'</td>';
				content += '<td>'+item.kcal+'</td>';
				content += '<td>'+item.h2o+'</td>';
				content += '<td>'+item.prot+'</td>';
				content += '<td>'+item.fat+'</td>';
				content += '<td>'+item.carb+'</td>';
				content += '<td>'+item.suger+'</td>';
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
			$('#materiallist').empty();
			$('#materiallist').append(content);
		}
		
	</script>
</html>