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
          <h5 class="modal-title" id="myExtraLargeModalLabel">피드 게시글 작성</h5>
          
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        
       <div>
       
	
	
	
	
	<div class="previews"></div>
	<button id="prevButton">이전</button>
    <button id="nextButton">다음</button>
	<table>
		<tr>
			<th>내용</th>
			<td><textarea name="content" placeholder="내용을 입력하세요.."></textarea></td>
		</tr>
		
		<button type="button" class="btn btn-food" name="food">#식품</button>
		<button type="button" class="btn btn-beauty" name="beauty">#뷰티</button>
		<button type="button" class="btn btn-fashion" name="fashion">#패션</button>
		<button type="button" class="btn btn-daily" name="daily">#일상</button>
		<button type="button" class="btn btn-restaurant" name="restaurant">#식당</button>
		<button type="button" class="btn btn-recipe" name="recipe">#레시피</button>
		
		<tr>
			<th>태그</th>
			<td><textarea name="feedTag" placeholder="태그를 입력해주세요"></textarea></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" id="photos"name="photos" multiple><td>
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
 
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
<script>


$(document).ready(function(){
    // 모달을 초기화
    
        $('.bd-example-modal-xl').modal();
    
     // 모달 창 닫힐 때 이벤트 처리
        $('.bd-example-modal-xl').on('hidden.bs.modal', function () {
            // 모달 창이 닫힐 때 수행할 작업
            location.href = "list.go"; // 현재 있는 feedList 페이지로 이동
        });
        var currentSlide = 0;
        var totalSlides = 0; // 이미지 슬라이드의 총 개수
    // 이미지 선택시 미리보기
     $('#photos').on('change', function (e) {
        var files = e.target.files;
        var previews = $('.previews');
        previews.empty();
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var slide = $('<div class="slide"></div>');
                    var preview = $('<img>').attr('src', e.target.result);
                    slide.append(preview);
                    previews.append(slide);

                    // 이미지 로드 후 이미지 크기를 조절
                    preview.on('load', function () {
                        var img = $(this);
                        var slide = img.closest('.slide');
                        var previews = img.closest('.previews');
                        
                        // 이미지의 너비와 높이를 previews에 맞게 조절
                        var maxWidth = previews.width();
                        var maxHeight = previews.height();
                        
                        var width = img.width();
                        var height = img.height();
                        
                        var newWidth, newHeight;
                        
                        // 이미지 비율 유지하며 크기 조절
                        if (width / maxWidth > height / maxHeight) {
                            newWidth = maxWidth;
                            newHeight = (height / width) * maxWidth;
                        } else {
                            newHeight = maxHeight;
                            newWidth = (width / height) * maxHeight;
                        }
                        
                        // 이미지 크기 조절
                        img.width(newWidth);
                        img.height(newHeight);
                        
                        // 슬라이드 크기 조절
                        slide.width(newWidth);
                        slide.height(newHeight);

                        // 슬라이드 추가 후 슬라이드 표시
                        totalSlides++;
                        showSlide(currentSlide);
                    });
                    
                    reader.readAsDataURL(file);
                };
                reader.readAsDataURL(file);
            }
        }
        showSlide(currentSlide);
    });
    
    // "이전" 버튼 클릭 시
    $('#prevButton').on('click', function () {
        currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
        showSlide(currentSlide);
    });

    // "다음" 버튼 클릭 시
    $('#nextButton').on('click', function () {
        currentSlide = (currentSlide + 1) % totalSlides;
        showSlide(currentSlide);
    });

    // 슬라이드 표시 함수
    function showSlide(slideIndex) {
        $('.slide').hide();
        $('.slide:eq(' + slideIndex + ')').show();
    }
    
    
    // 버튼클릭 이벤트
    $('button[name="food"]').click(function() {
        var $foodbtn = $('button[name="food"]').text();
        addToTextArea($foodbtn);
    });

    $('button[name="beauty"]').click(function() {
        var $beautybtn = $('button[name="beauty"]').text();
        addToTextArea($beautybtn);
    });

    $('button[name="fashion"]').click(function() {
        var $fashionbtn = $('button[name="fashion"]').text();
        addToTextArea($fashionbtn);
    });

    $('button[name="daily"]').click(function() {
        var $dailybtn = $('button[name="daily"]').text();
        addToTextArea($dailybtn);
    });

    $('button[name="restaurant"]').click(function() {
        var $restaurantbtn = $('button[name="restaurant"]').text();
        addToTextArea($restaurantbtn);
    });

    $('button[name="recipe"]').click(function() {
        var $recipebtn = $('button[name="recipe"]').text();
        addToTextArea($recipebtn);
    });

    function addToTextArea(textToAdd) {
    	
        var currentValue = $('textarea[name="feedTag"]').val();
        
        if(currentValue.indexOf(textToAdd) == -1){
	        if (currentValue) {
	            $('textarea[name="feedTag"]').val(currentValue + textToAdd);
	        } else {
	            $('textarea[name="feedTag"]').val(textToAdd);
	        }
	        console.log(textToAdd);
	        console.log(currentValue);
    	}
    }
    
    
        // 작성 버튼 클릭 시 이벤트 처리
        $('#feedSave').click(function() {
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
            success: function(e) {
                console.log(e);
            },
            error: function(e) {
                console.log(e);
            }
        });
        location.href="list.go";
    }
});
     	
        	
       
   
   
  
  $('#feedWriteCancle').on('click',function(){
	  if (!confirm("작성을 취소하시겠습니까?")) {
          
      } else {
    	  $('.bd-example-modal-xl').modal('hide'); 
      }
  
	  
  });
});    






</script>

</html>