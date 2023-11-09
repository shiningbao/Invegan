<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
.vl {
	border-left: 6px solid black;
	height: 500px;
}

table {
	margin-left: auto;
	margin-right: auto;
}

input[id="addM"] {
	margin-top: 30px;
	height: 30px;
}
</style>
</head>
<body>
	<h3 align="center">식재료 추가</h3>
	<hr />
	<form action="addMaterial.do" method="post">
		<table>
			<tr style="vertical-align: top">
				<td id="food_semi"
					style="width: 400px; border-right: 1px solid gray; padding-right: 12px; text-align: justify">
					식품명 : <input type="text" id="food_name" name="food_name"
					placeholder="* 식품명 입력" />
				<p>
						분류 : <input type="text" id="food_category" name="food_category"
							placeholder="* 분류명 입력" />
					<p>
						1회 제공량(g) : <input type="text"
							name="serving_size" placeholder="* g 입력" />
				</td>
				<td style="padding-left: 100px" id="food_detail">열량 <input
					type="text" name="kcal" placeholder="* kcal 입력" /> kcal
					<p>
						탄수화물 <input type="text" name="carb" placeholder="* g입력" />
						g
					<p>
						단백질 <input type="text" name="prot" placeholder="* g입력" />
						g
					<p>
						지방 <input type="text"name="fat" placeholder="* g입력" /> g
					<p>
						총 당류 <input type="text" name="sugar"
							placeholder="* g입력" /> g
					<p>
						총 식이섬유 <input type="text" name="fiber"
							placeholder="* g입력" /> g
					<p>
						칼슘 <input type="text" name="ca" placeholder="* mg입력" /> mg
					<p>
						철 <input type="text" name="fe" placeholder="* mg입력" /> mg
					<p>
						마그네슘 <input type="text" name="mg" placeholder="* mg입력" />
						mg
					<p>
						인 <input type="text" name="p" placeholder="* mg입력" /> mg
					<p>
						칼륨 <input type="text" name="k" placeholder="* mg입력" /> mg
					<p>
						나트륨 <input type="text" name="na" placeholder="* mg입력" />
						mg
					<p>
						아연 <input type="text" name="zn" placeholder="* mg입력" /> mg
					<p>
						비타민A <input type="text" name="vit_a"
							placeholder="* ㎍입력" /> ㎍
					<p>
						비타민B6 <input type="text" name="vit_b6"
							placeholder="* ㎍입력" /> ㎍
					<p>
						비타민B12 <input type="text" name="vit_b12"
							placeholder="* ㎍입력" /> ㎍
					<p>
						비타민C <input type="text" name="vit_c"
							placeholder="* ㎍입력" /> ㎍
					<p>
						필수 아미노산 <input type="text" name="essential"
							placeholder="* mg입력" /> mg
					<p>
						오메가 3 <input type="text" name="omega3"
							placeholder="* g입력" /> g</td>
			</tr>

			<!-- <input type="submit"  value="(관리자) 식재료 추가-submit" /> -->
		</table>
		<input type="submit" value="(관리자) 식재료 추가"/>
	</form>



</body>
<script>
/*
$(document).ready(function() {
    $("#addM").click(function() {
        var formData = {
            food_name: $("#food_name").val(),
            food_category: $("#food_category").val(),
            serving_size: $("#serving_size").val(),
            kcal: $("#kcal").val();
        	carb: $("#carb").val();
        	prot: $("#prot").val();
        	fat: $("#fat").val();
        };

        $.ajax({
            type: "POST",
            url: "/food_addM",  // 컨트롤러의 URL
            data: formData,
            success: function(data) {
                console.log(data);
    			alert(data.msg);
            },
            error: function(e) {
            	console.log(e);
            }
        });
    });
});
*/
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}


</script>
</html>