<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <title>Instagram Feed Form</title>
</head>
<body>
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-xl">피드 게시글 작성</button>

  <div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="myExtraLargeModalLabel">피드 게시글 작성</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        
        
          <form action="/write" method="post" enctype="multipart/form-data">
            <div class="form-group">
              <label for="caption"></label>
              <textarea class="form-control" id="caption" rows="10" placeholder="본문 내용을 입력해주세요..."></textarea>
            </div>
            <div class="form-group">
              <label for="image">Upload Image</label>
              <input type="file" class="form-control-file" id="image">
            </div>
            <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" id="feedPost">Post</button>
        </div>
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

    // Post 버튼 클릭 시 이벤트 처리
    $('#feedPost').click(function() {
      // 본문 내용을 가져오기
      var caption = $('#caption').val();

      // 이미지 파일을 가져오기
      var image = $('#image')[0].files[0];
	  console.log(caption +"/"+ image);
      // 여기에서 caption과 image를 이용해 원하는 동작 수행
      // 예를 들어, 서버로 데이터를 전송하는 등의 동작 수행 가능
      // 모달 닫기
      $('.bd-example-modal-xl').modal('hide');
    });
  });
    
</script>
</html>