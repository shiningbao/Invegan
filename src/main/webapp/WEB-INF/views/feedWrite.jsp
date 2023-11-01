<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<style>
	.previews img{
    max-width: 500px;
    max-height: 500px;
    width: auto;
    height: auto;
    
}
</style>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <title>Feed Form</title>
</head>
<body>
  <button type="button"  class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-xl">피드 게시글 작성</button>

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
       
	
	
	
	<form action="feed/register.do" method="post" enctype="multipart/form-data">
	<div class="previews"></div>
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
			<td><input type="file" id="photos"name="photos" multiple="multiple"><td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="button" value="취소" id="feedWriteCancle"/>
				<button id="feedSave">작성</button>
			</th>
		</tr>
	</table>	
	</form>
       </div>
        
      </div>
    </div>
  </div>
 
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
<script>


$(document).ready(function(){
    // 모달을 초기화
    
        $('.bd-example-modal-xl').modal();
    
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
                    var preview = $('<img>').attr('src', e.target.result);
                    previews.append(preview);
                };
                reader.readAsDataURL(file);
            }
        }
    });
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
	            $('textarea[name="feedTag"]').val(currentValue + ', ' + textToAdd);
	        } else {
	            $('textarea[name="feedTag"]').val(textToAdd);
	        }
	        console.log(textToAdd);
	        console.log(currentValue);
    	}
    }
    
    
        // 작성 버튼 클릭 시 이벤트 처리
        $('#feedSave').click(function() {
            var content = $('#content').val();
            var feedTag = $('#feedTag').val();
            var photos = $('#photos')[0].files;
            
            console.log(content);
            console.log(feedTag);
            console.log(photos);
            var msg = "${msg}";
            if(msg != "" ){
            	console.log('msggggggg');
            	alert(msg);
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