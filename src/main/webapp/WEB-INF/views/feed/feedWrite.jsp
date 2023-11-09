<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>

  <html>
  <style>
     /*이미지 컨테이너를 왼쪽으로 이동 */
/*      .previews {   */
/*         overflow: hidden;   */
/*         position: relative;   */
/*         width: 450px;   */
/*         height: 450px;   */
/*         float: left;   */
/*         margin-right: 20px;   */
/*         }   */
	.previews {
        width: 100%;  /* 원하는 너비 설정 */
        height: 100%; /* 원하는 높이 설정 */
        border: 1px solid #000;  /* 테두리 스타일 설정 (원하는 스타일로 변경) */
        padding: 10px;  /* 여백 설정 (원하는 여백으로 변경) */
    }
	.previews img {
        max-width: 100%;  /* 원하는 최대 너비 설정 */
        max-height: 100%; /* 원하는 최대 높이 설정 */
        margin: 5px;       /* 이미지 간격 설정 (원하는 크기로 조절) */
        
    }
/* 	.previews::before { */
/*         content: "사진을 등록해주세요"; /* 표시할 메시지 */ */
/* /*         position: absolute; /* 절대 위치 설정 */ */ */
/* /*         top: 50%; /* 상단 위치 조정 (원하는 위치로 변경) */ */ */
/* /*         left: 50%; /* 왼쪽 위치 조정 (원하는 위치로 변경) */ */ */
/*         transform: translate(-50%, -50%); /* 중앙 정렬 */ */
/*     }     */
    /* 슬라이드 이미지 스타일 */

/*     .slide { */
/*       width: 100%; */
/*       /* 슬라이드를 100% 너비로 설정하여 부모에 맞게 크기 조절 */ */
/*       height: 100%; */
/*       /* 슬라이드를 100% 높이로 설정하여 부모에 맞게 크기 조절 */ */
/*       display: none; */
/*       float: left; */
/*       margin-right: 10px; */
/*       /* 슬라이드 간의 간격 조정 */ */
/*     } */
  </style>

  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
      <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
    <title>Feed Write</title>
  </head>

  <body>


    <div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel"
      aria-hidden="true" data-backdrop="static" id="writeModal">
      <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="myExtraLargeModalLabel">피드 게시글 작성</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>

          <div>

            <div class="previews">
            
            
            </div>
            <button class="previews-delbtn">이미지전체삭제</button>
<!--             <button id="prevButton">이전</button> -->
<!--             <button id="nextButton">다음</button> -->
            <table>
              
              <tr>
                <td colspan="2">
                  <button type="button" class="writefood" name="food">#식품</button>
                  <button type="button" class="writebeauty" name="beauty">#뷰티</button>
                  <button type="button" class="writefashion" name="fashion">#패션</button>
                  <button type="button" class="writedaily" name="daily">#일상</button>
                  <button type="button" class="writerestaurant" name="restaurant">#식당</button>
                  <button type="button" class="writerecipe" name="recipe">#레시피</button>
                </td>
              </tr>
              <tr>
                <th>내용</th>
                <td><textarea name="content" placeholder="내용을 입력하세요.."></textarea></td>
              </tr>
              <tr>
                <th>태그</th>
                <td><textarea name="feedTag" placeholder="태그를 입력해주세요"></textarea></td>
              </tr>
              <tr>
                <th>사진</th>
                <td>
                  <input type="file" id="photos" name="photos" multiple>
                </td>
              </tr>
              <tr>
                <th colspan="2">
                  <input type="button" value="취소" id="feedWriteCancle"/>
                  <button id="feedSave">작성</button>
                </th>
              </tr>
         </table>
          </div>

        </div>
      </div>
    </div>

    
  </body>
  <script>


    $(document).ready(function () {

	var previews = $('.previews');

    // 파일을 선택하기 전에 메시지를 표시
    var message = document.createElement("div");
    message.textContent = "사진을 추가해주세요";
    previews.append(message);
    
	 $("#photos").on('change',function(e){
		 var files = e.target.files;
		 previews = $('.previews');
 		 previews.empty();
		 console.log(files);
		 if(files.length == 0){
			 message.textContent = "사진을 추가해주세요";
		 }else{
			 message.textContent = "";
		 for(var i =0; i <files.length; i++){
			 var file = files[i];
			 if(file){
				 var reader = new FileReader();
				 reader.onload = function(e){
					 var img = document.createElement("img");
					 img.setAttribute("src",e.target.result);
					 $('.previews').append(img);
				 
			 		}
				 reader.readAsDataURL(file);
			 }
		 }
		 }
	 })
     $('.previews-delbtn').on('click',function(){
    	 if(confirm("이미지를 삭제하시겠습니까? 이미지가 전체삭제됩니다. 다시등록")){
    		 previews.empty();
        	 $('#photos').val('');
    	 }else{
    		 
    	 }
    	 
    	 
     });


      // 버튼클릭 이벤트
      $('.writefood').click(function () {
    	  
        var $foodbtn = $('.writefood').text();
        addToTextArea($foodbtn);
      });

      $('.writebeauty').click(function () {
        var $beautybtn = $('.writebeauty').text();
        addToTextArea($beautybtn);
      });

      $('.writefashion').click(function () {
        var $fashionbtn = $('.writefashion').text();
        addToTextArea($fashionbtn);
      });

      $('.writedaily').click(function () {
        var $dailybtn = $('.writedaily').text();
        addToTextArea($dailybtn);
      });

      $('.writerestaurant').click(function () {
        var $restaurantbtn = $('.writerestaurant').text();
        addToTextArea($restaurantbtn);
      });

      $('.writerecipe').click(function () {
        var $recipebtn = $('.writerecipe').text();
        addToTextArea($recipebtn);
      });

      function addToTextArea(textToAdd) {

        var currentValue = $('textarea[name="feedTag"]').val();

        if (currentValue.indexOf(textToAdd) == -1) {
          if (currentValue) {
            $('textarea[name="feedTag"]').val(currentValue + textToAdd);
          } else {
            $('textarea[name="feedTag"]').val(textToAdd);
          }
          console.log(textToAdd);
        }
      }


      // 작성 버튼 클릭 시 이벤트 처리
      $('#feedSave').click(function () {
    		
    		 var content = $('textarea[name="content"]').val();
    	        var feedTag = $('textarea[name="feedTag"]').val();
    	        var photos = $('#photos')[0].files;
				
    	        if (content.trim() === "") {
    	          alert("내용을 입력하세요.");
    	        } else if (feedTag.trim() === "") {
    	          alert("피드 태그를 입력하세요.");
    	        } else if (photos.length === 0) {
    	          alert("파일을 선택하세요.");
    	        } else if (
    	          !feedTag.includes("#식품") &&
    	          !feedTag.includes("#패션") &&
    	          !feedTag.includes("#일상") &&
    	          !feedTag.includes("#레시피") &&
    	          !feedTag.includes("#뷰티") &&
    	          !feedTag.includes("#식당")
    	        ) {
    	          alert("6개의 태그 중 하나 이상을 입력해주세요.");
    	          return;
    	        } else {
    	          var formData = new FormData();
    	          formData.append("content", content);
    	          formData.append("feedTag", feedTag);

    	          for (var i = 0; i < photos.length; i++) {
    	            formData.append("photos", photos[i]);
    	          }

    	          // 이제 formData에 데이터가 정상적으로 추가되었으므로 서버로 요청을 보냅니다.
    	          $.ajax({
    	            type: 'post',
    	            url: 'write',
    	            data: formData,
    	            processData: false,
    	            contentType: false,
    	            success: function (e) {
    	              console.log(e);
    	            },
    	            error: function (e) {
    	              console.log(e);
    	            }
    	          });
    	          location.href = "list.go";
    	        }
    	  
    	 
              
      });






      $('#feedWriteCancle').on('click', function () {
        if (!confirm("작성을 취소하시겠습니까?")) {

        } else {
          location.href="list.go";
        }


      });
    });






  </script>

  </html>