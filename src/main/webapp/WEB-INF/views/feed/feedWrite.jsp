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
        width: 500vw; 
		transition: transform 0.1s;
    }
    .img-slider{
    	width: 100vw; 
		float:left;
    }
    
	.previews img {
        width: 400px;  /* 원하는 최대 너비 설정 */
        height: 300px; /* 원하는 최대 높이 설정 */      /* 이미지 간격 설정 (원하는 크기로 조절) */
        
    }
/*     .img-containerbox{ */
/*     	width:300px; */
/*     	height:300px; */
/*     } */
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

	#writeModal .modal-content{
		width:1000px;
	}
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
            <h5 class="modal-title" id="myExtraLargeModalLabel">피드 게시글</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>

          
			
	            	<div class="previews">
	            
	            	</div>
            <div>
	            <button class="past">이전</button>
	          	<button class="next">다음</button>
	            <button class="previews-delbtn">이미지전체삭제</button>
            </div>

            <div>
			    <div>
			        <button type="button" class="btn btn-outline-dark" name="food">#식품</button>
			        <button type="button" class="btn btn-outline-dark" name="beauty">#뷰티</button>
			        <button type="button" class="btn btn-outline-dark" name="fashion">#패션</button>
			        <button type="button" class="btn btn-outline-dark" name="daily">#일상</button>
			        <button type="button" class="btn btn-outline-dark" name="restaurant">#식당</button>
			        <button type="button" class="btn btn-outline-dark" name="recipe">#레시피</button>
			    </div>
			    <div>
			        <label>내용</label>
			        <textarea name="content" placeholder="내용을 입력하세요.."></textarea>
			    </div>
			    <div>
			        <label>태그</label>
			        <textarea name="feedTag" placeholder="태그를 입력해주세요"></textarea>
			    </div>
			    <div>
			        <label>사진</label>
			        <input type="file" id="photos" name="photos" multiple>
			    </div>
			    <div>
			        <input type="button" value="취소" id="feedWriteCancle"/>
			        <button id="feedSave">작성</button>
			    </div>
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
        message.classList.add("img-containerbox")
        message.textContent = "사진을 추가해주세요";
        previews.append(message);

        $("#photos").on('change', function (e) {
        	var currentImageIndex = 0;
            var maxImageIndex = 0;
            var files = e.target.files;
            var previews = $('.previews'); // .previews 엘리먼트 선택
            $('.img-slider').empty(); // 기존 내용 비우기
            maxImageIndex = 0;
            maxImageIndex = files.length -1;
        	console.log(maxImageIndex);
            console.log(files);
            maxImageCount = 5; // 최대 5개 이미지
			
            if (files.length == 0) {
            	previews.append(message);
                $(".past, .next").prop("disabled", true);
            } else if (files.length > maxImageCount) {
                message.textContent = "최대 5개 이미지까지 선택할 수 있습니다.";
                alert("최대 5개 이미지까지 선택할 수 있습니다.");
                // 파일 입력을 비우고 이미지 업로드를 막음
                $('#photos').val('');
            } else {
                message.textContent = "";
                $(".past, .next").prop("disabled", false);
                for (var i = 0; i < files.length; i++) {
                	
                    var file = files[i];
                    if (file) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            var img = document.createElement("img");
                            img.setAttribute("src", e.target.result);

                            var slider = document.createElement("div");
                            slider.classList.add("img-slider");
                            slider.appendChild(img);

                            previews.append(slider);
                        };
                        reader.readAsDataURL(file);
                    }
                }
                
             // 이전 버튼 클릭 이벤트 핸들러
                $(".past").on('click', function () {
                    if (currentImageIndex > 0) {
                    	console.log('aa'+currentImageIndex);
            	    	console.log('bb'+maxImageIndex);
                        currentImageIndex--;
                        showCurrentImage();
                    }
                    
                });

                // 다음 버튼 클릭 이벤트 핸들러
                $(".next").on('click', function () {
                	console.log('aa'+currentImageIndex);
        	    	console.log('bb'+maxImageIndex);
                    if (currentImageIndex < maxImageIndex) {
                        currentImageIndex++;
                        showCurrentImage();
                    }
                    
                });
                
                // 현재 이미지를 표시하는 함수
                function showCurrentImage() {
                    // 현재 이미지 엘리먼트를 선택합니다.
                	var translateValue = -100 * currentImageIndex + 'vw';
            	    $('.previews').css('transform', 'translate(' + translateValue + ')');
                }
                
               
            }
        });
        
        $('.previews-delbtn').on('click', function () {
            if (confirm("이미지를 삭제하시겠습니까? 이미지가 전체 삭제됩니다. 다시 등록")) {
                $('.img-slider').empty();
                $('#photos').val('');
                console.log(message)
                message.textContent = "사진을 추가해주세요";
                previews.append(message);
               
            } else {

            }
        });
        

     
	
      
     


      // 버튼클릭 이벤트
     $('.btn').click(function () {
    	 var text = $(this).text();
    	    if (text !== "피드게시글 작성") {
    	        addToTextArea(text);
    	    }
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