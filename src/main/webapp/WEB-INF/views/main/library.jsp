<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- bootstrap : 디자인을 위한 프레임 워크 -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
		<!-- jquery는 사용하는 플러그인과 다른 라이브리와의 충돌 여부를 확인해야 한다. -->
		<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>    
		<!-- 페이징 처리를 위한 라이브러리 -->
		<script src="../resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
		<style>
			#box {
				width : 100%;
				height: 100%;
				position: relative;
				display: flex;
				justify-content: center;
			}
			
			#box table,
			#box table th,
			#box table td {
				border : 1px solid black;
				border-collapse: collapse;
				padding: 5px 10px;
				white-space: nowrap;
				text-align: center;
			}

			#box table {
				width: 1000px;
				position : absolute;
				top: 100px;
			}
			
			.container {
				position : absolute;
				top: 800px;
			}
			
			input[name="rqWrite"] {
				position : absolute;
				top: 800px;
				right: 300px;
			}
		</style>
	</head>
	<body>
	</body>
	<script></script>
</html>