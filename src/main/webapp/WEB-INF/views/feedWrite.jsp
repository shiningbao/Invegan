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
       
	
	
	
	<form action="feed/register.do" method="post">
	<div class="previews"></div>
	<table>
		<tr>
			<th>내용</th>
			<td><textarea name="content" placeholder="내용을 입력하세요.."></textarea></td>
		</tr>
		
		<button type="button" class="btn btn-food" id="food">#식품</button>
		<button type="button" class="btn btn-beauty" id="beauty">#뷰티</button>
		<button type="button" class="btn btn-fashion" id="fashion">#패션</button>
		<button type="button" class="btn btn-daily" id="daily">#일상</button>
		<button type="button" class="btn btn-restaurant" id="restaurant">#식당</button>
		<button type="button" class="btn btn-recipe" id="recipe">#레시피</button>
		<tr>
			<th>태그</th>
			<td><textarea name="feedTag" placeholder="자유태그를 입력해주세요"></textarea></td>
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
    $('.btn-primary').click(function() {
        $('.bd-example-modal-xl').modal();
    });
    
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
 
    $('.btn').click(function() {
        var needTag = $(this).text(); // 버튼의 텍스트를 가져옴
        var formData = new FormData()
        console.log(needTag);          
        
        
        // Post 버튼 클릭 시 이벤트 처리
        $('#feedSave').click(function() {
            var content = $('#content').val();
            var feedTag = $('#feedTag').val();
            if (content.isEmpty() || feedTag.isEmpty()) {
                alert('내용과 태그를 모두 입력해주세요.');
                return; // 빈 값이 있을 때 함수를 종료
            }
            console.log(content);
            console.log(feedTag);
            console.log()
            }); 
     
        });
   
   
  
  $('#feedWriteCancle').on('click',function(){
	  if (!confirm("작성을 취소하시겠습니까?")) {
          
      } else {
    	  $('.bd-example-modal-xl').modal('hide'); 
      }
  
	  
  });
    
});

/* var msg = "${msg}";
if(msg != ""){
	alert(msg);
} */

</script>

</html>