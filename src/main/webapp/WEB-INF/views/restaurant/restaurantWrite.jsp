<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	div{
		background-color: lightslategray;
		margin: 3px 0px;
	}
	#base{
		width: 900px;
	}
	#sub{
		width: 700px;
	}
	.head{
		font-size: 25px;
		width: 200px;
	}
	input{
		width: 100%;
		height: 24px;
		margin: 1px 1px;
	}
	td{
		height: 25px;
	}
	#thum{
		height: 250px;
		overflow-x: scroll;
	}
	select{
		width: 100%;
		height: 24px;
		margin: 1px 1px
	}
	.img_class{
		border: 1px solid black;
		
	}

</style>
</head>
<body>
<%@include file="/WEB-INF/views/main/header.jsp"%>
<table id = "base">
	<tr>
		<th class="head">식당 이름</th>
		<td><input type="text" name="title"/></td>
	</tr>
	<tr>
		<th class="head">식당 주소</th>
		<td><button type="button" id="daumPostcode">주소 검색</button><br/><input type="text" name="address"/></td>
	</tr>
	<tr>
		<th class="head">식당 소개</th>
		<td><input type="text" name="content"/></td>
	</tr>
	<tr>
		<th class="head">연락처</th>
		<td><input type="text" name="phone"/></td>
	</tr>
	<tr>
		<th class="head">영업시간</th>
		<td><input type="text" name="hours"/></td>
	</tr>
	
	<tr>
		<th class="head">사진 등록</th>
		<td><input type="file" name="images" id="img" multiple="multiple"/></td>
	</tr>
	<tr>
		<th class="head">미리보기</th>
		<th>
			<div id="thum"></div>
		
		</th>
	</tr>	
	<tr>
		<th class="head">메뉴 등록</th>
		<td><button id="menuAdd" type="button">메뉴 추가</button></td>	
	</tr>
	<tr>
	<th></th>
	<td id = "menu">
	<div>
		<table id = "sub">
			<tr>
				<th>메뉴명</th>
				<td><input type="text" name="menu_name"/></td>
				<th rowspan="3"><button onclick="menuDel(this)">삭제</button></th>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price"/></td>		
			</tr>	
			<tr>
				<th>비건단계</th>
				<td>
					<select name="vegan_type">
						<option value="1">플루테리언</option>
						<option value="2">비건</option>
						<option value="3">락토</option>
						<option value="4">오보</option>
						<option value="5">락토오보</option>
						<option value="6">폴로</option>
						<option value="7">페스코</option>
						<option value="8">폴로페스코</option>
						<option value="9">플렉시테리언</option>
					</select>
				</td>
			</tr>
		</table>
	</div>
	</td>
	</tr>


</table>
<button type="button" id="write">작성</button>
<%@include file="/WEB-INF/views/main/footer.jsp"%>
</body>

<script>

// 메뉴 추가 작성 항목
$('#menuAdd').on('click',function(){
	var menuContent = '<div>메뉴명<input type="text" name="menu_name"/><br/>가격<input type="text" name="price"/>';
		menuContent += '<button onclick="menuDel(this)">삭제</button><br/>비건단계<select name="vegan_type">';
		menuContent += '<option value="1">플루테리언</option><option value="2">비건</option><option value="3">락토</option>';
		menuContent += '<option value="4">오보</option><option value="5">락토오보</option><option value="6">폴로</option>';
		menuContent += '<option value="7">페스코</option><option value="8">폴로페스코</option><option value="9">플렉시테리언</option></select></div>';
	$('#menu').append(menuContent);
});

// 메뉴 삭제
function menuDel(e){
	$(e).parent().remove();
};

// 주소 검색
$('#daumPostcode').on('click',function(){
    new daum.Postcode({
        oncomplete: function(data) {
        	$('input[name="address"]').val(data.address);
        }
    }).open();	
});

$('#write').on('click',function(e){
	
	var $title = $('input[name="title"]');
	var $address = $('input[name="address"]');
	var $content = $('input[name="content"]');
	var $phone = $('input[name="phone"]');
	var $hours = $('input[name="hours"]');
	var $menu_name = $('input[name="menu_name"]');
	var $price = $('input[name="price"]');
	var $vegan_type = $('input[name="vegan_type"]');

	var blankcnt = 0;
	var len = $menu_name.length;
/*	
	if($title.val() == ''){
		alert('식당 이름');
		blankcnt ++;
		$title.focus();
	}else if($address.val() == ''){
		alert('식당 주소');
		blankcnt ++;
		$address.focus();
	}else if($content.val() == ''){
		alert('식당 소개');
		blankcnt ++;
		$content.focus();
	}else if($phone.val() == ''){
		alert('식당 연락처');
		blankcnt ++;
		$phone.focus();
	}else if($hours.val() == ''){
		alert('영업시간');
		blankcnt ++;
		$hours.focus();
	}else{
		for(var i = 0; i < len; i++){
			if($menu_name.eq(i).val() == ''){
				alert('메뉴');
				blankcnt ++;
				$menu_name.eq(i).focus();
				break;
			}else if($price.eq(i).val() == ''){
				alert('가격');
				blankcnt ++;
				$price.eq(i).focus();
				break;
			}
			// price에 문자가 들어있는지
			var regex = new RegExp('[a-zA-Zㄱ-ㅎ가-힣]');
			var match = regex.test($price.eq(i).val()); // 패턴이 일치하면 true, 아니면 false
			if(match){
				alert('가격에 숫자만');
				blankcnt ++;
				break;
			}
		}
	}
	
	console.log("공백 및 패턴 확인 blankcnt : ");
	console.log(blankcnt);	
*/	
	if(blankcnt == 0){
		var formData = new FormData();

		// 메뉴 배열-맵 묶기
		var menu = new Array(len);
		/*
		for(var i = 0; i < len; i++){
			menu[i] = new Map();
			menu[i].set('menu_name',$('input[name="menu_name"]').eq(i).val());
			menu[i].set('price',$('input[name="price"]').eq(i).val());
			menu[i].set('vegan_type',$('input[name="vegan_type"]').eq(i).val());
			
		}
		
		*/
		for(var i = 0; i < len; i++){
			menu[i] = new Array(3);
			menu[i][0] = $('input[name="menu_name"]').eq(i).val();
			menu[i][1] = $('input[name="price"]').eq(i).val();
			menu[i][2] = $('select[name="vegan_type"]').eq(i).val();
			console.log($('select[name="vegan_type"]').eq(i).val());
		}
		
		console.log(menu);
		
		// ajax 전송할 폼데이터
		var uploadImages = $('input[name="images"]')[0].files;
		console.log(uploadImages.length);
		for(var i = 0; i < uploadImages.length; i++){
			console.log(uploadImages[i]);
			formData.append('uploadImages', uploadImages[i]);
		}
		//formData.append('uploadImages', uploadImages);
		formData.append('title', $title.val());
		formData.append('address', $address.val());
		formData.append('content', $content.val());
		formData.append('phone', $phone.val());
		formData.append('hours', $hours.val());
		formData.append('menu', menu);
		
		
		$.ajax({
			type:'post',
			url:'write.do',
			data:formData,
			contentType:false,
			processData:false,
			enctype : 'multipart/form-data',
			success:function(data){
				console.log('a');
			},
			error:function(e){
				console.log(e);
			}
		});	
	}
});

var thum = document.getElementById('thum');
$('#img').on('change',function(){
	thum.innerHTML = '';
	var imageType = 'image';
	var imgArr= [];
	var reader = new FileReader();
	var uploadImages = $('input[name="images"]')[0].files
	for(var i = 0; i < uploadImages.length; i++){
		var imgFile = uploadImages[i];
		console.log(imgFile.type);
		imgArr.push(imgFile);
		console.log(imgArr);
		
		// 업로드 파일 삭제 기능 추가 필요
		if(imgFile.type.includes('image')){ // 이미지타입 확인

			var spanTag = document.createElement('span');
			spanTag.id = 'img_id_'+i;
			spanTag.style.width = '200px';
			spanTag.style.height = '200px';
			spanTag.style = {'border' : '1px solid black', 'margin': '1px'};
			spanTag.className = 'img_class';
			thum.appendChild(spanTag);

			var img = new Image();
			img.classList.add('preview-image');
			img.file = imgFile;
			img.style.width='inherit';
            img.style.height='inherit';
            img.style.cursor='pointer';
			spanTag.appendChild(img);	
			
			var reader = new FileReader();
			reader.onload = (function(aImg) {
                return function(e) {
                    aImg.src = e.target.result;
                };
            })(img);
			
			reader.readAsDataURL(imgFile);		
	
		}else{
			alert('이미지 파일 아님');
		}	
	}
});



</script>










</html>













