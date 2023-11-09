<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<style>
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
/*         .feedUpdateModal {   */
/*           display: none;   */
/*         }   */
.detail-href {
	
}
</style>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>Feed Detail</title>
</head>

<body>
	<!--       <div id="feedUpdateModal" class="feedUpdateModal"> -->
	<%--         <%@ include file="feedUpdate.jsp" %> --%>
	<!--       </div> -->

	<!-- detail.jsp -->
	<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog"
		aria-labelledby="myExtraLargeModalLabel" aria-hidden="true"
		data-backdrop="true" id="detailModal">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myExtraLargeModalLabel">피드 상세보기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body" id="feedDetail"></div>

			</div>
		</div>
	</div>


</body>
<script>
  var loginInfo;

  // feedDetail 처리
  $(document).on('click', '.post-link', function() {
     var post_id = $(this).data('post-id');
     console.log(post_id);
//      $('#detailModal').modal('show');
     $('.modal-backdrop').css({ 'display': 'block' });
     $.ajax({
         type: 'GET',
         url: 'feedDetailCall', // 데이터를 제공하는 서버의 엔드포인트로 변경
         data: { post_id: post_id },
         success: function(data) {
             // 데이터를 성공적으로 받았을 때 모달 내용 업데이트
//              console.log(data);
//              console.log(data.detailList);
//              console.log(data.findBoardUserno);
//              console.log(data.user_no);
//              console.log(data.findCommentUserno);
			 	
			 	for (var i = 0; i < data.commentList.length; i++) {
			 		console.log("aaaa");
			 		console.log(data.commentList[i]);
					
				}
             drawdetailList(data.detailList,data.findBoardUserno,data.user_no); // 게시글 상세보기 리스트
             drawcommentList(data.commentList,data.user_no);
             loginInfo = data.loginInfo;
             console.log(loginInfo);
             
             $('.feedDetailModal').css({ 'display': 'block' });
         },
         error: function(error) {
             console.log('데이터 가져오기에 실패했습니다: ' + error);
         }
     });
       
  });
  
  function drawcommentList(commentList, user_no) {
	    var commentContent = '';

	    console.log(commentList);
	    console.log(user_no);
	    commentContent += '<div class="comment">';
	    commentList.forEach(function (item, index) {       
	    	console.log(item.comment_id);
	        commentContent += '<div class="detail-href">';
	        commentContent += '<span class="username">' + item.comment_user_nickname + '</span> ';     
	        commentContent += '<span class="commentTxt">' + item.comment_text + '</span> ';
		
	        var commentUserNo = user_no;
			console.log('aaaaaaaaaa'+commentUserNo);
			console.log(item.user_no);
				if (item.user_no == commentUserNo) {
		            console.log('사용자가 이 댓글을 작성한 댓글이 있습니다.');
		            commentContent += '<button class="comment-edit-btn" data-comment-id="' + item.comment_id + '" data-feed-content="' + item.comment_text + '">수정</button>';
		            commentContent += '<button class="comment-del-btn" data-comment-id="' + item.comment_id + '">삭제</button>';
		        } else {
		            console.log('사용자가 이 댓글을 작성하지 않았습니다.');
		        }
			commentContent += '</div>';
	  
	    });
	    commentContent += '</div>';
	    // 댓글을 추가하려는 요소에 commentContent를 추가
	    // 예를 들어, 아래처럼 HTML 요소에 추가할 수 있습니다.
	    $('#feedDetail .post-comments').html(commentContent);
	   
	}
  $(document).on('click', '.comment-edit-btn', function () {
	  
	  
	    if (confirm("댓글을 수정하시겠습니까?")) {
	        var commentTxt = $(this).parent().find('.commentTxt');
	        var originalComment = commentTxt.text();
	        var commentId = $(this).data('comment-id');
	        $('.comment-edit-btn').prop('disabled', true);
	        $('.comment-del-btn').prop('disabled', true);
	        // "commentTxt"를 input 태그로 대체
	        commentTxt.html('<input type="text" class="comment-input" value="' + originalComment + '">');
	        // 저장 버튼과 취소 버튼 추가
	        commentTxt.append('<button class="save-comment-button" data-comment-id="' + commentId + '">저장</button>');
	        commentTxt.append('<button class="cancel-comment-button">취소</button>');
			//문제없음
			
	        $('.save-comment-button').on('click', function () {
	            if (confirm("댓글을 저장하시겠습니까?")) {
	                var commentId = $(this).data('comment-id');
	                var commentTxt = $(this).parent().find('input.comment-input').val();
	                var commentTxtElement = $(this).parent();
	                
	                if (commentTxt.trim() === "") {
	                    alert("댓글을 입력해주세요.");
	                    return; // 빈 댓글일 경우 아래 로직을 실행하지 않고 함수 종료
	                }
	                $.ajax({
	                    url: 'feedEditComment/update',
	                    data: {
	                        'commentId': commentId,
	                        'commentTxt': commentTxt
	                    },
	                    success: function (data) {
	                        console.log(data);
	                        alert('댓글이 수정되었습니다.');
	                        commentTxtElement.html(commentTxt);
	                        $('.comment-edit-btn').prop('disabled', false);
	            	        $('.comment-del-btn').prop('disabled', false);
	                    },
	                    error: function (e) {
	                        console.log("댓글 수정에러발생 " + e);
	                    },
	                });
	            }
	        });
	    }
	});

  $(document).on('click', '.cancel-comment-button', function () {
	    if (confirm("댓글 수정을 취소하시겠습니까?")) {
	        var commentTxt = $(this).parent();
	        var commentId = $(this).siblings('.save-comment-button').data('comment-id'); // 취소 버튼의 형제로부터 commentId 가져옴
	        commentTxt.html(commentTxt.find('input.comment-input').val());
	        $('.comment-edit-btn').prop('disabled', false);
	        $('.comment-del-btn').prop('disabled', false);
	    } else {
	        // 사용자가 수정 취소를 선택한 경우 추가 동작을 정의할 수 있습니다.
	    }
	});

  
  $(document).on('click','.comment-del-btn',function(){
	  var commentElement = $(this).closest('.detail-href');
		if(confirm("댓글을 삭제하시겠습니까z?")){
			var commentId =$(this).data('comment-id');
			$.ajax({
				url:'feedDelComment/delete',
				data:{'commentId':+commentId},
				success:function(data){
					console.log(data);
					alert('댓글이 삭제되었습니다.');
					commentElement.remove();
				},
				error:function(e){
					console.log("댓글 삭제에러발생 "+e);
				},
			});
	  }else{
		  
	  }
  })
	
  	
  // 게시글 상세보기 리스트  
  function drawdetailList(detailList, findBoardUserno, user_no) {
      console.log(detailList);
      var content = '';

      detailList.forEach(function (item) {
    	  
          content += '<div class="post">';
          content += '<div class="post-header">';
          content += '<div class="user-profile"><img src="/photo/' + item.profile_image + '"></div>';
          content += '<span class="username">' + item.nickname + '</span>';
          content += '</div>';
          
           if (loginInfo != null && user_no == findBoardUserno) {
        	  content += '<button class="post-del-btn" data-post-id="' + item.post_id + '">삭제</button>';
         	  content += '<button class="post-edit-btn" data-post-id="' + item.post_id + '" data-feed-content="' + item.content + '">수정</button>';     
          }
          
          var imageFiles = item.server_file_name.split(','); // 쉼표로 이미지 파일 이름 분리

          for (var i = 0; i < imageFiles.length; i++) {
              content += '<div class="post-image"><img src="/photo/' + imageFiles[i] + '"></div>';
          }             
          content += '<div class="post-caption">';
          content += '<span class="feed-content">' + item.content + '</span> ';
          content += '</div>';
          content += '<div class="post-comments">';
          content += '<div class="comment">';             
//           content += '<span class="username">' + item.comment_user_nickname + '</span> ';
          content += '<div class="detail-href">';
//           content += '<span class="comment">' + item.comment_text + '</span> '
            if (item.commentList) {
            drawcommentList(item.commentList);
        }
          
          content += '</div>';
          content += '</div>';
          content += '</div>';
          var date = new Date(item.date);
          var dateStr = date.toLocaleDateString("ko-KR");
          content += '<div class="tag-content">' + item.tag_content + '</div>';
          content += '<div class="post-time">' + dateStr + '</div>';
          content += '</div>';
          
       	  content += '<div class="comment-box">';
          content += '<input type="text" class="feedComment" name="feedComment" placeholder="댓글을 입력하세요...">';
          content += '<button class="commentFeedWrite" data-post-id="' + item.post_id + '">작성</button>';
          content += '</div>';
          
          
          content += '<hr>';
      });
      $('#feedDetail').html(content);
      // 비회원이 댓글작성했을떄 이벤트
      $('#feedDetail').on('click', '.commentFeedWrite', function () {
		    if (loginInfo == null) {
		        alert('로그인이 필요합니다.');
		        location.href="/invegan/member/login.go";
		    } else {
		        
		    }
		})
      // "수정" 버튼 클릭 이벤트 핸들러 등록
      $('.post-edit-btn').on('click', function () {
    	  if(confirm("게시글을 수정하시겠습니까?")){
    		  console.log(this);
              var post_id = $(this).data('post-id');
              var feed_content = $(this).parent().find('.feed-content');
              
              var postId = $(this).data('post-id');
            
              console.log(feed_content.text());
              console.log(post_id);
              console.log('수정');
              
           	  // 현재 "feed-content"의 텍스트 내용 가져오기
              var originalContent = feed_content.text();
              
              // "feed-content"를 input 태그로 대체
              feed_content.html('<input type="text" class="feed-content-input" value="' + originalContent + '">');
              // 저장 버튼과 취소 버튼 추가
              feed_content.append('<button class="save-button" data-post-id="' + post_id + '">저장</button>');
              feed_content.append('<button class="cancel-button">취소</button>');
              feed_content.append('<input type="file" id="photos" name="photos" multiple>');    
              
          	 
              // 수정 버튼 비활성화
              $(this).prop('disabled', true);
              
              
              
              $('.save-button').on('click', function () {
             	  
            	  if(confirm("게시글을 저장하시겠습니까?")){
            		  console.log('click');
            		  $('.post-edit-btn').prop('disabled', false);
                      console.log(this);
                      var post_id = $(this).data('post-id');
                      var feed_content = $(this).parent().find('.feed-content-input'); // 수정된 내용을 가져옵니다.
                      console.log(post_id);
                      console.log(feed_content.val()); // 수정된 내용을 가져옵니다.
                      var formData = new FormData();
                      formData.append("feed_content", feed_content.val());
                      formData.append("post_id", post_id);
                      // 여기에서 수정된 내용을 서버로 전송하거나 다른 작업을 수행할 수 있습니다.
                      $.ajax({
                    	  type:'POST',
                    	  url:'feedUpdatePost/update',
                    	  data: formData,
                    	  processData: false,
                          contentType: false,
                    	  success:function(data){
                    		  console.log(data);
                    		  var editContent = feed_content.val();
                    		  var feedContent = '<div class="feed-content">' + editContent + '</div>';
                    		  console.log(this);            		  
						      $('#feedDetail .post-caption').html(feedContent);
                    	  },
                    	  error:function(e){
                    		  console.log('저장실패');
                    	  },
                      });
            	  }else{
            		  
            	  };
                  
              });
              $('.cancel-button').on('click', function () {
            	  if(confirm("게시글 수정을 취소하시겠습니까?")){
            		  var feedContent = '<span class="feed-content">' + originalContent + '</span>'; // 원본 내용으로 복원
                      $('#feedDetail .post-caption').html(feedContent);
                      $('.post-edit-btn').prop('disabled', false);
            	  }else{
            		  
            	  }
                  console.log('click');
                  
                  
              });
    	  }else{
    		  
    	  };

       });
      

      // "삭제" 버튼 클릭 이벤트 핸들러 등록
      $('.post-del-btn').on('click', function () {
          var post_id = $(this).data('post-id');
          console.log(post_id);
          console.log('삭제');
          var delmsg = confirm('삭제하시겠습니까?');
          if(delmsg){
        	  //확인
        	  deletePost(post_id);
          }else{
        	  console.log('삭제취소');
          }
          
      });
      function deletePost(post_id) {
    	  
    	  
    	    $.ajax({
    	        type: 'POST',
    	        url: 'feedDelPost/delete',
    	        data: { post_id: post_id },
    	        success: function (data) {
    	            console.log('게시글 삭제 성공!');
    	            
    	            location.href="list.go";            
    	        },
    	        error: function (error) {
    	            console.log('게시글 삭제에 실패했습니다: ' + error);
    	        }
    	    });
    	}
      

    }
		  //댓글 작성
		  $(document).on('click', '.commentFeedWrite', function() {
		    var comment_text = $(this).closest('.comment-box').find('.feedComment').val();
		    var post_id = $(this).data('post-id');
		    console.log(post_id);
		    console.log(comment_text);
		    console.log('click');
		     
		    if(comment_text.trim()== ""){
		       alert("댓글을 입력해주세요.");
		       return;
		    }
		    
		    
		    $.ajax({
		       type:'get',
		       url:'feedWriteComment',
		       data : {comment_text : comment_text,
		      		 post_id:post_id },
		         success: function (data) {
		           console.log(data);
		           console.log(data.user_no);
		           console.log(data.comment_text);
		           console.log(data.post_id);
		           console.log(data.comment_user_nickname);
		   
		            var newComment = '<div class="detail-href">'; // 수정
			        newComment += '<span class="username">' + data.comment_user_nickname + '</span> ';
			        newComment += '<span class="comment">' + data.comment_text + '</span> ';
			        newComment += '</div>';
		           // 댓글을 추가하려는 요소에 newComment를 추가
		           $('#feedDetail .post-comments').append(newComment);
		
		           // 입력 필드 비우기
		           $('.feedComment').val('');
		           drawcommentList(data.commentList, data.user_no);
		         },
		         error: function (e) {
		           console.log(e);
		           console.log("댓글 입력 에러 ");
		         }
		       
		    });
		    
		});
  
  


  </script>

</html>