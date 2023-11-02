<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
		<style>
			table, th, td {
				border : solid 1px black;
				border-collapse: collapse;
				padding : 5px 10px;
				width: 500px;
			}
		</style>
	</head>
	<body>
		<h2>메뉴추가</h2>
		<h4>기본 메뉴 | 나만의 레시피 메뉴</h4>
		<button>취소</button>
		<hr>
		<div>		
			<button>아침</button>
			<button>점심</button>
			<button>저녁</button>
			<button>기타</button>
			<button>+</button>
			<button>-</button>
			<table>
					<tr>
						<th>식품명</th>
						<th>1회 제공량(g)</th>
						<th>에너지(kcal)</th>
					</tr>
					<tr>
						<td>버섯 칼국수</td>
						<td>230</td>
						<td>67</td>
					</tr>
					<tr>
						<td colspan="3"><input type="text" value="레시피의 이름을 입력해 주세요"/><button>확인</button></td>
					</tr>
			</table>
		</div>
		<br>
		<table>
			<tr>
				<th colspan="2">재료</th>
				<th>
					<button onclick="location.href='mlist.go'">+</button>
					<button>-</button>
				</th>
			</tr>
			<tr>
				<td>해바라기씨, 볶은것</td>
				<td>20g</td>
				<td>13.4 kcal</td>
			</tr>
		</table>
		<br>
		<button>완료</button>
		<br>
		<table>
			<tr>
				<th colspan="2">
					해바라기 씨를 곁들인 콩나물 감자볶음
				</th>
			</tr>
			<tr>
				<td>아무튼 영양소</td>
			</tr>
		</table>
	</body>
	<script>
		
	</script>
</html>