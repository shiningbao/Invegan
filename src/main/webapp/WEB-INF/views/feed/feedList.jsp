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
      
        /* 왼쪽 사이드바 메뉴 스타일 */
        .sidebar {
            width: 250px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        div.row {
            display: flex; /* 자식 요소를 수평으로 나란히 배치하기 위해 */
            justify-content: center;
        }

        #feedList {
            display: flex;
            flex-direction: column;
            max-width: 100%; /* 최대 너비를 100%로 설정하여 화면 크기에 맞게 조정됩니다. */
   		    width: auto; /* 가로 크기 자동 조정 */
        }

        /* 개별 게시물 스타일 */
        .post {
            width: 100%;
            height: 500px;
            border: 1px solid #e1e1e1;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* 게시물 헤더 스타일 */
        .post-header {
            display: flex;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #e1e1e1;
        }

        .post-header img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .username {
            font-weight: bold;
        }

        /* 게시물 이미지 스타일 */
        .post img {
            max-width: 100%;
            height: auto;
        }

        /* 게시물 캡션 스타일 */
        .post-caption {
            padding: 10px;
        }

        .post-caption .username {
            font-weight: bold;
        }

        /* 댓글 스타일 */
        .post-comments {
            padding: 10px;
        }

        .comment {
            margin-bottom: 10px;
        }

        .comment .username {
            font-weight: bold;
        }

        /* 게시물 업로드 시간 스타일 */
        .post-time {
            color: #999;
            padding: 10px;
        }

        .button:hover,
        .button.active {
            background: #7ea338;
            color: white;
        }

        .button:visited {
            background: #7ea338;
            color: white;
        }

        .button {
            border: 0;
            padding: 10px 30px;
            writing-mode: horizontal-tb;
        }

        .grid-menu {
            display: grid;
            grid-template-columns: repeat(3, 1fr); /* 3개씩 가로로 나열합니다 */
            gap: 10px; /* 버튼 간의 간격을 설정합니다 */
            width: 100px;
        }

        /* 사이드바 스타일 조정 */
        .col-2.sidebar {

            display: flex;
            flex-direction: column;
            gap: 10px;
            max-width: 100%; /* 최대 너비를 100%로 설정하여 화면 크기에 맞게 조정됩니다. */
   			 width: auto; /* 가로 크기 자동 조정 */
        }

        /* Feed 및 중앙 정렬 */
        .feed {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 20px;
            padding: 20px;
            margin: 0 auto;
            max-width: 800px;
        }
        .user-profile, .post-image {
		    max-width: 100%;
		    height: auto;
		    display: block; /* 이미지를 블록 요소로 표시하여 여백을 적용합니다. */
		}
		
    </style>
    
</head>
<body>
	
    <div class="container-fluid">
        <div class="row">
            <div class="col-2 sidebar"> 
                <!-- 사이드바 메뉴 내용 -->
                <h4>기본태그</h4>
                <ul class="grid-menu">
                
                    <button type="button" class="button" name="food" onclick="change_btn(event)">#식품</button>
					<button type="button" class="button" name="beauty"onclick="change_btn(event)" >#뷰티</button>
					<button type="button" class="button" name="fashion" onclick="change_btn(event)">#패션</button>
					<button type="button" class="button" name="daily" onclick="change_btn(event)">#일상</button>
					<button type="button" class="button" name="restaurant" onclick="change_btn(event)">#식당</button>
					<button type="button" class="button" name="recipe" onclick="change_btn(event)">#레시피</button>
                    <!-- 원하는 메뉴 항목 추가 -->
                </ul>
                <h4>검색</h4>
                 <ul class="search-menu">
                	
                    <button type="button" class="button" name="food" onclick="change_btn(event)">검색</button>
					 <button type="button" id="write-btn"  class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-xl">피드 게시글 작성</button>
                    <!-- 원하는 메뉴 항목 추가 -->
                </ul>
<             </div> 
   
        
<div class="feed">
    <!-- Instagram 피드 게시물들을 동적으로 추가하기 위한 영역 -->

    <div id="feedList" class="post">
    
    </div>

    <!-- 위와 같은 구조의 다른 Instagram 피드 게시물들을 추가 -->
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
	    	console.log(item.server_file_name);
	    	

	    	var tags = item.tag_content;
	    	console.log(item.tag_content);

	    	var allowedTags = ['#식품', '#패션', '#일상', '#레시피', '#뷰티', '#식당'];
	    	console.log(allowedTags);

	    	if (tags) {
	    	    allowedTags.forEach(function(tag) {
	    	        if (tags.includes(tag)) {
	    	            content += '<button class="tag-button">' + tag + '</button>';
	    	        }
	    	    });
	    	}
	    	
	    	content += '<div class="post">';
	    	content += '<div class="post-header">';
	    	content += '<div class="user-profile"><img src="/photo/' + item.profile_image + '"></div>'; // 사용자의 프로필 사진
	    	content += '<span class="username">' + item.nickname + '</span>';
	    	content += '</div>'; 
	    	content += '<div class="post-image"><img src="/photo/' + item.server_file_name + '"></div>';
	    	content += '<div class="tag-content">' + item.tag_content + '</div>';
	    	content += '<div class="post-caption">';
	    	content += '<span class="feed-content">' + item.content + '</span> ';
	    	content += '</div>';
	    	content += '<div class="post-comments">';
	    	content += '<div class="comment">';
	    	content += '<span class="username">' + item.comment_user_nickname + '</span> ' + item.comment_text;
	    	content += '</div>';
	    	content += '</div>';
	    	var date = new Date(item.date);
	    	var dateStr = date.toLocaleDateString("ko-KR"); //en-US
	    	content += '<div class="post-time">' + dateStr + '</div>';
	    	content += '</div>';
	    	content += '<hr>';
	       
	    });
	    $('#feedList').html(content);
	    
	} 
	// 버튼 색생 변경
	function change_btn(e) {
		  var btns = document.querySelectorAll(".button");
		  btns.forEach(function (btn, i) {
		    if (e.currentTarget == btn) {
		      btn.classList.add("active");
		    } else {
		      btn.classList.remove("active");
		    }
		  });
		  console.log(e.currentTarget);
		}
	
	$('.tag-button').on('click',function(){
		var tagbt = $('.tab-button').val();
		console.log(tagbt);
	});

</script>

</html>