<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<style>
		
		</style>
	</head>
	<body>
		<c:import url="/main/header"/>
		<div id = "box">
			<table>
				<thead>
					<tr>
						<th>글 번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>요청 구분</th>
						<th>처리여부</th>
						<th>작성날짜</th>
					</tr>
				</thead>
				<tbody id ="requestBody">
					<!-- 요청리스트 출력 -->
				</tbody>
			</table>
		</div>
		<%@include file="/WEB-INF/views/main/footer.jsp"%>
	</body>
	<script>
		listCall();
		
		function listCall(){
			$.ajax({
				type:'get',
				url:'requestList.do',
				data:{},
				dataType:'json',
				success:function(data) {
					console.log(data);
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	</script>
</html>