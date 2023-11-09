<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Invegan - 식단관리</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
#container {
	height: 800px;
	width: 1000px;
	margin: 0 auto;
	display: flex;
	padding: 20px 0;
}

.contents {
	width: 500px;
	height: 100%;
	/* 임시 border */
	border: 1px solid lightgrey;
	padding: 10px 20px;
}

.contents>div {
	width: 95%;
}

#vertical-line {
	height: 100%;
	border-right: 2px solid lightgray;
}

#contents-left-header {
	display: flex;
	justify-content: space-between;
	border-bottom: 1px solid gray;
	vertical-align: middle;
	padding: 10px;
}

#contents-left-header>* {
	cursor: pointer;
	margin: 0px;
}

#contents-left-header button {
	background: none;
	border: none;
	height: 30px;
	width: 30px;
	padding: 0px;
}

#contents-left-content {
	/* border: 1px solid lightgrey; */
	height: auto;
	margin: 20px auto;
	padding: 0 10px;
	]
}

#emptyList {
	height: 100px;
	border: 2px dashed gray;
	border-radius: 15px;
	position: relative;
	margin-top: 20px;
	cursor: pointer;
	color: gray;
}

#emptyList:hover {
	color: #6b6b6b;
	border: 2px solid #6b6b6b;
}

#emptyList p {
	font-size: large;
	font-weight: 600;
	position: absolute;
	top: 30%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#list-items {
	text-align: right;
}

.menu-item td {
	padding-bottom: 7px;
	padding-left: 5px;
}

.menu_name {
	padding-left: 20px;
	text-align: left;
}

.menu_name label {
	cursor: pointer;
}

.diet-category {
	font-size: 19px;
	font-weight: 600;
	text-align: left;
	padding-left: 0;
}

/* 세로 줄 */
.li-vertical-line {
    border-right: 1px solid black;
}

/* 영양성분 */
#contents-right-header {
	border-bottom: 1px solid gray;
	width: 100%;
	height: 39px;
}

#contents-right-header ul {
	margin: 11px auto;
	padding: 0;
	display: flex;
	justify-content: center;
}

#contents-right-header ul li {
	display: inline-block;
	justify-content: center;
}

#contents-right-header ul li:not(.li-vertical-line) {
	padding: 3px 16px;
	cursor: pointer;
	margin: 0 10px;
}

#contents-right-header ul li:not(.li-vertical-line):hover {
	border-bottom: 2px solid #95df95;
}
#contents-right-content{
    width: 100%;
    padding: 10px 0px;
    text-align: center;
}
#contents-right-content h4, #contents-right-content label{
    margin: 8px auto;
}



/* 원형 그래프*/

#kcal, #carb, #prot, #fat  {
    width: calc(83% - 0px);
    padding-bottom: calc(97% - 19px);
    margin: 7px auto;
    border-radius: 50%;
    position: relative;
    text-align: center;
    background: conic-gradient(#3F8BC9 0% 72%, #F2F2F2 72% 100%); 
}

#kcal::before, #carb::before, #prot::before, #fat::before {
    color: #black;
    width: 68%;
    padding: calc(35%   - 1.3vw) 0;
    background: #FFFFFF;
    border-radius: 50%;
    position: absolute;
    left: 16%;
    top: 15%;
    content: attr(data-percent)'%';
    transform: skew(-0.03deg);
    margin: auto;
    font-size: 1.1vw;
    font-size: 23px;
    padding: calc(43% - 1.3vw) 0;
    
}
.graph-box{
    display: inline-block;
    width: 23%;
}
/*막대 그래프*/
.graph-bar{
    height: 20px;
    background-color: skyblue;
    border-radius: 20px;
}
.graph-bar span{
    display: block;
    padding: 0px 10px;
    width: 75%;
    height: 20px;
    line-height: 20px;
    text-align: right;
    background: blue;
    border-radius: 20px;
    box-sizing: border-box;
    color: #FFF; 
.li-vertical-line {
	border-right: 1px solid black;
}
</style>
</head>
<body>
	<c:import url="/main/header" />
	<div id="container">
		<!-- 식단 영역 -->
		<div class="contents">
			<div id=contents-left-header>
				<h2 id="selectDate">${date}</h2>
				<button id="addMenuBtn" onclick="upsertMenu('0')">
					<i class="xi-plus xi-2x"></i>
				</button>
			</div>
			<c:if test="${dietListSize == 0 }">
				<div id="emptyList" onclick="upsertMenu('0')">
					<p>
						<i class="xi-plus-circle"></i> 메뉴를 추가해 주세요
					</p>
				</div>
			</c:if>
			<c:if test="${dietListSize > 0 }">
				<div id="contents-left-content">
					<table id="list-items">
						<colgroup>
							<col width="300px">
							<col width="50px">
							<col width="70px">
						</colgroup>
						<!-- 아침 리스트 -->
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'아침' and not hasBreakfast}">
									<tr>
										<td colspan="3" class="diet-category">${list.diet_category}</td>
									</tr>
									<c:set var="hasBreakfast" value="true" />
								</c:when>
							</c:choose>
						</c:forEach>
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'아침'}">
									<tr class="menu-item">
										<c:if test="${list.category eq'기본메뉴'}">
											<td class="menu_name"><label onclick="">${list.food_name }</label></td>
										</c:if>
										<c:if test="${list.category eq'나만의레시피'}">

											<td class="menu_name"><label onclick="">${list.recipe_name }</label></td>
										</c:if>
										<td>${list.grams}g</td>
										<td>${list.kcal}kcal</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
						<!-- 점심 리스트 -->
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'점심' and not hasLunch}">
									<tr>
										<td colspan="3" class="diet-category">${list.diet_category}</td>
									</tr>
									<c:set var="hasLunch" value="true" />
								</c:when>
							</c:choose>
						</c:forEach>
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'점심'}">
									<tr class="menu-item">
										<c:if test="${list.category eq'기본메뉴'}">
											<td class="menu_name"><label onclick="">${list.food_name }</label></td>
										</c:if>
										<c:if test="${list.category eq'나만의레시피'}">
											<td class="menu_name"><label onclick="">${list.recipe_name }</label></td>
										</c:if>
										<td>${list.grams}g</td>
										<td>${list.kcal}kcal</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
						<!-- 저녁 리스트 -->
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'저녁' and not hasDinner}">
									<tr>
										<td colspan="3" class="diet-category">${list.diet_category}</td>
									</tr>
									<c:set var="hasDinner" value="true" />
								</c:when>
							</c:choose>
						</c:forEach>
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'저녁'}">
									<tr class="menu-item">
										<c:if test="${list.category eq'기본메뉴'}">
											<td class="menu_name"><label onclick="">${list.food_name }</label></td>
										</c:if>
										<c:if test="${list.category eq'나만의레시피'}">
											<td class="menu_name"><label onclick="">${list.recipe_name }</label></td>
										</c:if>
										<td>${list.grams}g</td>
										<td>${list.kcal}kcal</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
						<!-- 기타 리스트 -->
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'기타' and not hasEtc}">
									<tr>
										<td colspan="3" class="diet-category">${list.diet_category}</td>
									</tr>
									<c:set var="hasEtc" value="true" />
								</c:when>
							</c:choose>
						</c:forEach>
						<c:forEach var="list" items="${dietList}">
							<c:choose>
								<c:when test="${list.diet_category eq'기타'}">
									<tr class="menu-item">
										<c:if test="${list.category eq'기본메뉴'}">
											<td class="menu_name"><label onclick="">${list.food_name }</label></td>
										</c:if>
										<c:if test="${list.category eq'나만의레시피'}">
											<td class="menu_name"><label onclick="">${list.recipe_name }</label></td>
										</c:if>
										<td>${list.grams}g</td>
										<td>${list.kcal}kcal</td>
									</tr>
								</c:when>
							</c:choose>
						</c:forEach>
					</table>
				</div>
			</c:if>
		</div>

		<div id="vertical-line"></div>

		<!-- 영양정보 영역 -->
		<div class="contents">
			<div id="contents-right-header">
				<ul>
					<li onclick="getNutri(this)">전체</li>
					<li class="li-vertical-line"></li>
					<li onclick="getNutri(this)">아침</li>
					<li class="li-vertical-line"></li>
					<li onclick="getNutri(this)">점심</li>
					<li class="li-vertical-line"></li>
					<li onclick="getNutri(this)">저녁</li>
					<li class="li-vertical-line"></li>
					<li onclick="getNutri(this)">기타</li>
				</ul>
			</div>
			<!-- 영양성분 / 원형 그래프  -->
			<div id="contents-right-content">
				                <div class="graph-box">
                    <label>열량</label>
                    <div id="kcal" class="circle"></div>
                    <h4 id="kcal-data"></h4>
                </div>
                <div class="graph-box">
                    <label>탄수화물</label>
                    <div id="carb" class="circle"></div>
                    <h4 id="carb-data"></h4>
                </div>
                <div class="graph-box">
                    <label>단백질</label>
                    <div id="prot" class="circle"></div>
                    <h4 id="prot-data"></h4>
                </div>
                <div class="graph-box">
                    <label>지방</label>
                    <div id="fat" class="circle"></div>
                    <h4 id="fat-data"></h4>
                </div>
                <!-- 영양성분 - 막대 그래프 -->
                <div>
                    <h4>총 당류</h4>
                    <div id="sugar-bar" class="graph-bar">
                        <span>85%</span>
                    </div>
                    <h4>85 / 100</h4>
                </div>
                <div>
                    <h4>총 식이섬유</h4>
                    <div id="fiber-bar" class="graph-bar">
                        <span>45%</span>
                    </div>
                    <h4>45 / 100</h4>
                </div>
                <div>
                    <h4>칼슘</h4>
                    <div id="cal-bar" class="graph-bar">
                        <span>25%</span>
                    </div>
                    <h4>25 / 100</h4>
                </div>
				<!-- 그려질 영역 -->
			</div>
		</div>
	</div>
	<c:import url="/main/footer" />
</body>
<script>


	// 페이지 로드시 바로 실행
	getNutri($('#contents-right-header ul li:first'));

	// 캘린더 화면으로 이동
	$('#selectDate').on('click', function() {
		console.log('date click');
		location.href = "tempCalander";
	});

	// 메뉴 등록 팝업 창 열기
	function upsertMenu(sort) {
		var sort = sort;
		var selectDate = $('#selectDate').text();
		console.log("upsert 분류 : " + sort);
		window.open("addMenu.go?sort=" + sort + "&date=" + selectDate, "pop",
				"width=1200,height=700,top=100,left=300,scrollbals=no");
	}

	// 영양소 가져오기
	function getNutri(obj) {
		console.log('getNutri() 실행');
		var dietCate = $(obj).text();
		var selectDate = '${date}';
		
	
		console.log(selectDate+' / '+dietCate);
	
		$.ajax({
			type : 'get',
			url : 'getNutri',
			data : {'selectDate' : selectDate , 'dietCate': dietCate} ,
			dataType : 'JSON',
			success : function(data) {
				console.log(data.nutriInfo);
                drawNutri(data.nutriInfo);
			},
			error : function(data) {

			}
		});
	}
    
    
    
    function drawNutri(nutr) {
        console.log(nutr);
        // 태그 가져오기
        var kcal = document.querySelector("#kcal");
        var carb = document.querySelector("#carb");
        var prot = document.querySelector("#prot");
        var fat = document.querySelector("#fat");
        console.log("가져온 태그 확인 : "+kcal+"/"+carb+"/"+prot+"/"+fat);
        
        // 가져온 태그에 data-percent 속성 추가
        kcal.setAttribute("data-percent",56);
        carb.setAttribute("data-percent",100);
        prot.setAttribute("data-percent",24);
        fat.setAttribute("data-percent",47);
        
        // 태그의 data-percent 속성의 값을 변수에 저장
        var percentKcal = kcal.getAttribute("data-percent");
        var percentCarb = carb.getAttribute("data-percent");
        var percentProt = prot.getAttribute("data-percent");
        var percentFat = fat.getAttribute("data-percent");
        console.log(percentKcal+"/"+percentCarb+"/"+percentProt+"/"+percentFat);
        
        
        // 태그의 background 속성 변경
        kcal.style.background = 'conic-gradient(#3F8BC9 0% '+percentKcal+'%, transparent 10% 15%, rgb(222 222 222) '+percentKcal+'% 100%)';
        carb.style.background = 'conic-gradient(#3F8BC9 0% '+percentCarb+'%, rgb(222 222 222) '+percentCarb+'% 100%)';
        prot.style.background = 'conic-gradient(#3F8BC9 0% '+percentProt+'%, rgb(222 222 222) '+percentProt+'% 100%)';
        fat.style.background = 'conic-gradient(#3F8BC9 0% '+percentFat+'%, rgb(222 222 222) '+percentFat+'% 100%)';
        
        // kcal chk
        $('#kcal-data').empty();
        $('#kcal-data').append('<h4>'+nutr.kcal+'<br/>/ 2700kcal</h4>');
        // kcal chk
        $('#carb-data').empty();
        $('#carb-data').append('<h4>'+nutr.carb+'<br/>/ 100g</h4>');
        // kcal chk
        $('#prot-data').empty();
        $('#prot-data').append('<h4>'+nutr.prot+'<br/>/ 55g</h4>');
        // kcal chk
        $('#fat-data').empty();
        $('#fat-data').append('<h4>'+nutr.fat+'<br/>/ 60g</h4>');
        
        var sugarBar = document.querySelector($('#sugar-bar'));
        /* console.log(sugarBar+" / "+fiberBar+" / "+calVar); */
        sugar.style.width = ntur.sugar;
        
    }
</script>
</html>