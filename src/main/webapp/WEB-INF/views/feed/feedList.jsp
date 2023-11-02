<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<style>
	table, th, td{
	border:  1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

table{
	width: 500px;	
}

input[type="text"] {
	width: 100%;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* 테이블을 가운데로 정렬 */
        .centered-table {
            margin: 0 auto;
        }

        /* 왼쪽 사이드바 메뉴 스타일 */
        .sidebar {
            width: 250px;
            background-color: #f8f9fa; /* 사이드바 배경색 */
            float: left;
            height: 100vh; /* 페이지 높이에 맞게 조정 */
        }
        .centered-table {
		    margin: 0 auto;
		    width: 90%; /* 테이블 너비를 조정 */
		    border-collapse: collapse; /* 셀 경계를 겹치게 설정 */
		}
		
		.centered-table th, .centered-table td {
		    border: 1px solid #ccc; /* 셀 경계 스타일 설정 */
		    padding: 8px; /* 셀 내부 패딩 설정 */
		}
		
		.centered-table th {
		    background-color: #f2f2f2; /* 헤더 배경색 설정 */
		}
		
		.centered-table th, .centered-table td {
		    text-align: center; /* 텍스트 중앙 정렬 */
		}
		
		/* 이미지 컬럼의 스타일 */
		.centered-table .image-column {
		    width: 100px; /* 이미지 셀 너비 조정 */
		    text-align: center; /* 이미지 중앙 정렬 */
		}
		
		/* 홀수 행 배경색 설정 */
		.centered-table tbody tr:nth-child(odd) {
		    background-color: #f9f9f9;
		}
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-2 sidebar">
                <!-- 사이드바 메뉴 내용 -->
                <ul>
                    <li><a href="#">메뉴 항목 1</a></li>
                    <li><a href="#">메뉴 항목 2</a></li>
                    <!-- 원하는 메뉴 항목 추가 -->
                </ul>
            </div>
            <div class="col">
                <!-- 테이블을 가운데로 정렬 -->
                <button type="button" id="write-btn"  class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-xl">피드 게시글 작성</button>
                <table class="centered-table">
                    <thead>
                        <tr>
                            <th>닉네임</th>
                            <th>태그</th>
                            <th>본문내용</th>
                            <th>댓글내용</th>
                            <th>작성일</th>
                            <th>이미지</th>
                        </tr>
                    </thead>
                    <tbody id="feedList">
                        <!-- 여기에 게시글 목록이 동적으로 추가됩니다 -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
<script>
feedListCall();

    // 페이지 로딩 시 피드 목록을 불러오도록 호출
    
    
	$('#write-btn').on('click',function(){
		location.href="write.go";
	});
	
	function feedListCall(){
		$.ajax({
			type:'get',
			url:'feedListCall',
			data:{},
			success:function(data){
				console.log(data);
				drawList(data.list);
			},
			error:function(error){
				console.log(error);
			}
		});
		
	};
	function drawList(list) {
	    console.log(list);
	    var content = '';

	    list.forEach(function(item, idx) {
	        content += '<tr>';
	        content += '<td>' + item.nickname + '</td>';
	        content += '<td>' + item.tag_content + '</td>';
	        content += '<td>' + item.content + '</td>';
	        content += '<td>' + item.comment_text + '</td>';
	        var date = new Date(item.date);
			var dateStr = date.toLocaleDateString("ko-KR"); 
	        content += '<td>' + dateStr + '</td>';
	        content += '</tr>';
	    });

	    $('#feedList').html(content);
	}

</script>

</html>