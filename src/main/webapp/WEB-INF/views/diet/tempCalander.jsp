<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<h2>식단관리 페이지</h2>
	<!-- 도훈이 테스트 영역 -->
		<input id="loginId" name=loginId type="text" placeholder="임시 로그인 영역" value="admin01"/>
		<input id="selectDate" name="selectDate" type="date" value="2023-10-31"/>
		<input type="button" onclick="chkData('add')"  value="메뉴 추가 페이지" />
		<input type="button" onclick="chkData('update')"  value="메뉴 수정 페이지" />
	<!--  -->
</body>
<script>
	//도훈이 테스트 영역
	
	function chkData(chk) {
		var loginId = $('#loginId').val();
		var chk = chk;
		var selectDate = $('#selectDate').val(); 
		alert(loginId+"님 안녕하세요\n선택한 날짜는 "+$('#selectDate').val()+" 입니다");
		
		window.open("addMenu.go?chk="+chk+"&loginId="+loginId, "pop", "width=1100,height=700,top=100,left=300,scrollbals=no")
		
	}
	//
</script>
</html>