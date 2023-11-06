<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html>
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
      <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
      <style>
        /* 왼쪽 사이드바 메뉴 스타일 */
        
        body { 
       margin: 0 auto;
         width: 1000px;/
       } 
      input[type="text"] {
        width: 100%;
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
        
        .post img {
          max-width: 100%;
          height: auto;
        }
        .mainFeedPhoto{
          width: 200%; 
         height: 200%;
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

        .user-profile,
        .post-image {
          max-width: 100%;
          height: auto;
          display: block;
          /* 이미지를 블록 요소로 표시하여 여백을 적용합니다. */
        }
        
        hr {
		    border: none;
		    height: 3px; 
		    background-color: #000; 
		  }

        .feedWriteModal {  
          display: none;  
        }  
         
        .feedDetailModal {  
          display: none;  
        }  
        .commentFeedWrite {
          float:right;
        }
         
        .post-del-btn,
        .post-edit-btn {
        	float:right;
        	
        }
             
      </style>

    </head>

    <body>
    
   <div class="body">
   
      <div id="feedWriteModal" class="feedWriteModal">
        <%@ include file="feedWrite.jsp" %>
      </div>
      
      <div id="feedDetailModal" class="feedDetailModal">
        <%@ include file="feedDetail.jsp" %>
      </div>
      
      
      
       
      

        <div class="row">
          <div class="col-2 sidebar">
            <!-- 사이드바 메뉴 내용 -->
            <h4>기본태그</h4>
            <button type="button" class="searchtag" name="food">#식품</button>
            <button type="button" class="searchtag" name="beauty">#뷰티</button>
            <button type="button" class="searchtag" name="fashion">#패션</button>
            <button type="button" class="searchtag" name="daily">#일상</button>
            <button type="button" class="searchtag" name="restaurant">#식당</button>
            <button type="button" class="searchtag" name="recipe">#레시피</button>
            <!-- 원하는 메뉴 항목 추가 -->
            <h4>검색</h4>
            <button>검색</button>
            <button type="button" id="write-btn" class="btn btn-primary" data-toggle="modal"
              data-target=".bd-example-modal-xl">피드 게시글 작성</button>        
          </div>
          
          
            <div id="feedList" class="feedListPost">
            <!-- 피드 리스트  -->
            </div>          
         
  </div>
</div>
            <!-- 위와 같은 구조의 다른 Instagram 피드 게시물들을 추가 -->

      


    </body>
    <script>
    
      $(document).ready(function () {
        feedListCall();
        
        
        
        $('body').css('overflow', 'auto');
        $('#write-btn').on('click', function () {

          $('#writeModal').modal('dispose');
          $('#writeModal').modal();
          $('.feedWriteModal').css({ 'display': 'block' });
          $('.modal-backdrop').css({ 'display': 'block' });
          $('body').css('overflow', 'hidden');

        })
        
      
// feedList 처리
        function feedListCall() {
          $.ajax({
            type: 'get',
            url: 'feedListCall',
            data: {},
            success: function (data) {
              console.log(data);
              drawList(data.list);
            },
            error: function (error) {
              console.log(error);
            }
          });
        };
        function drawList(list) {
          console.log(list);
          var content = '';

          list.forEach(function (item, idx) {
            console.log(item.server_file_name);

            var tags = item.tag_content;
            console.log(item.tag_content);

            var allowedTags = ['#식품', '#패션', '#일상', '#레시피', '#뷰티', '#식당'];
            console.log(allowedTags);

            if (tags) {
              allowedTags.forEach(function (tag) {
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
            content += '<div class="post-details">';
            content += '<div class="post-image">';
            content += '<a href="#" class="post-link" data-post-id="' + item.post_id + '" data-toggle="modal" data-target="#detailModal" style="display: block; width: 100%; height: 100%;">';
            content += '<img src="/photo/' + item.server_file_name + '" class="mainFeedPhoto">';
            content += '</a>';
            content += '</div>';
            content += '<div class="post-content">';
            content += '<span class="feed-content">' + item.content + '</span>';
            content += '<div class="post-caption">';
            
            content += '</div>';
            content += '<div class="post-comments">';
            content += '<div class="comment">';
            content += '<span class="username">' + item.comment_user_nickname + '</span>';
            content += '<div class="detail-href">';
            content += '<span class="comment">' + item.comment_text + '</span>';
            content += '</div>';
            content += '</div>';
            content += '</div>';
            content += '</div>';
            var date = new Date(item.date);
            var dateStr = date.toLocaleDateString("ko-KR"); //en-US
            content += '<div class="tag-content">' + item.tag_content + '</div>';
            content += '<div class="post-time">' + dateStr + '</div>';
            content += '</div>';
            content += '<hr>';
            

          });
          $('#feedList').html(content);
          
         
          
        }
        
        
    
        
        
        $('#detailModal').on('hidden.bs.modal', function () {
            // 디테일 모달 창이 닫힐 때 수행할 작업
            console.log('detail');
            $('#detailModal').modal('dispose');
            $('.modal-backdrop').css({ 'display': 'none' });
            $('body').css('overflow', 'auto');
            $('.modal-backdrop').remove();
         $('.feedDetailModal').css({ 'display': 'none' });

          }); 
           
           
      
        
           
      
             

         
       
        
        
        
        $('#writeModal').on('hidden.bs.modal', function () {
            // 모달 창이 닫힐 때 수행할 작업
            console.log('example');
             $('.bd-example-modal-xl').modal('dispose');
            $('.modal-backdrop').css({ 'display': 'none' });
            $('body').css('overflow', 'auto');
            $('.modal-backdrop').remove();
          $('.feedWriteModal').css({ 'display': 'none' });

          });
        
        
       

       

        $(document).on('click', '.searchtag', function () {
          var searchbt = $(this).text();
          console.log(searchbt);
        });
        $(document).on('click', '.tag-button', function () {
          var tagbt = $(this).text();
          console.log(tagbt);
        });
        
        
      });
   
      



    </script>

    </html>