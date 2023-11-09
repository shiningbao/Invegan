<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
</style>

</head>
<body>
<c:import url="/main/header"/>
<h1>식당 리스트</h1>
<button type="button" onclick="location.href='write.go'">식당 작성</button>
<button type="button" onclick="location.href='detail?post_id=145'">식당 상세보기</button>

	<table>
		<tr>
			<th>포스트 아이디</th>
			<th>식당명</th>
			<th>작성자</th>
			<th>숨김여부</th>
		</tr>
		<c:forEach items="${restaurantList}" var = "restaurant">
			<tr>
				<td><a href = "detail?post_id=${restaurant.getPost_id()}">${restaurant.getPost_id()}</a></td>
				<td><a href = "detail?post_id=${restaurant.getPost_id()}">${restaurant.getTitle()}</a></td>
				<td><a href = "detail?post_id=${restaurant.getPost_id()}">${restaurant.getUser_no()}</a></td>
				<td><a href = "detail?post_id=${restaurant.getPost_id()}">${restaurant.getIs_hidden()}</a></td>
			<tr>
		</tr>
		</c:forEach>
	</table>
<%@include file="/WEB-INF/views/main/footer.jsp"%>
</body>
<script>


</script>
</html>