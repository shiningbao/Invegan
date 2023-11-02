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
	<h2>캘린더 페이지</h2>
	<!-- 도훈이 테스트 영역 -->
	
		<input id="loginId" name=loginId type="text" placeholder="임시 로그인 영역"/>
		<input id="selectDate" name="selectDate" type="date"/>
		<input type="button" onclick="chkData()"  value="메뉴 추가 페이지" />
	<!--  -->
</body>
<script>
	//도훈이 테스트 영역
	
	function chkData() {
		var loginId = $('#loginId').val();
		var selectDate = $('#selectDate').val(); 
		alert(loginId+"님 안녕하세요\n선택한 날짜는 "+$('#selectDate').val()+" 입니다");
		
		window.open("addMenu.go?loginId="+loginId, "pop", "width=1000,height=800,scrollbars=yes")
		
	}
	//
</script>
</html>