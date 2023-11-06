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
	<h2>식단캘린더 페이지</h2>
	<!-- 도훈이 테스트 영역 -->
		<input id="selectDate" name="selectDate" type="date" value="2023-10-31"/>
		<input class="dietMgmt"type="button" onclick="dietMgmt()" value="식단관리 페이지"/>
		
	<!--  -->
</body>
<script>
	//도훈이 테스트 영역
	function dietMgmt() {
		console.log('go mgmt click')
		location.href="dietMgmt?date="+$(selectDate).val();
	}
	
	//
</script>
</html>