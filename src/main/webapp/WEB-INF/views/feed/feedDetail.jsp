<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<style>
	/* 이미지 컨테이너를 왼쪽으로 이동 */
.previews {
    overflow: hidden;
    position: relative;
    width: 450px; /* 원하는 너비로 설정 */
    height: 450px; /* 원하는 높이로 설정 */
    float: left; /* 왼쪽 정렬 추가 */
    margin-right: 20px; /* 슬라이드와의 간격을 설정 */
}
/* 슬라이드 이미지 스타일 */

.slide {
    width: 100%; /* 슬라이드를 100% 너비로 설정하여 부모에 맞게 크기 조절 */
    height: 100%; /* 슬라이드를 100% 높이로 설정하여 부모에 맞게 크기 조절 */
    display: none;
    float: left;
    margin-right: 10px; /* 슬라이드 간의 간격 조정 */
}

</style>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <title>Feed Form</title>
</head>
<body>
  

<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myExtraLargeModalLabel">피드 상세보기</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
		            
		            <div id="feedList" class="post">
    
    				</div>
		          
        </div>
    </div>
</div>
 
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
<script>



    
        $('.bd-example-modal-xl').modal();
    
    	// 모달 창 닫힐 때 이벤트 처리
        $('.bd-example-modal-xl').on('hidden.bs.modal', function () {
            // 모달 창이 닫힐 때 수행할 작업
//             location.href = "list.go"; // 현재 있는 feedList 페이지로 이동
        });
     // 현재 페이지 URL에서 post_id 파라미터 추출
        function getParameterByName(name, url) {
            if (!url) url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
        }

        // 현재 페이지에서 post_id 값을 가져옴
        var post_id = getParameterByName('post_id');
        
        console.log(post_id);
        

	    	$.ajax({
	 		type:'get',
	 		url:'feedDetailCall',
	 		data: {post_id : post_id},
	 		success:function(data){
	 			console.log(data); 	
	 			drawList(data.list);
	 		},
	 		error:function(e){
	 			console.log(e);
	 		}
	 		});
    	
	    	function drawList(list) {
	       	    console.log(list);
	       	    var content = '';
	       		
	       	    list.forEach(function(item) {
	       	    	console.log(item.server_file_name);
	       	    	console.log(post_id)

	       	    	
	       	    	
	       	    	content += '<div class="post">';
	       	    	content += '<div class="post-header">';
	       	    	content += '<div class="user-profile"><img src="/photo/' + item.profile_image + '"></div>'; // 사용자의 프로필 사진
	       	    	content += '<span class="username">' + item.nickname + '</span>';
	       	    	content += '</div>'; 
	       	    	content += '<div class="post-image"><a href="detail.go?post_id=' + post_id + '"><img src="/photo/' + item.server_file_name + '"></a></div>';
	       	    	content += '<div class="tag-content">' + item.tag_content + '</div>';
	       	    	content += '<div class="post-caption">';
	       	    	content += '<span class="feed-content">' + item.content + '</span> ';
	       	    	content += '</div>';
	       	    	content += '<div class="post-comments">';
	       	    	content += '<div class="comment">';
	       	    	content += '<span class="username">' + item.comment_user_nickname + '</span> ';
	       	    	content += '<div class="detail-href">';
	       	    	content += '<span class="comment">' + item.comment_text + '</span> '
	       	    	content += '</div">';
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



</script>

</html>