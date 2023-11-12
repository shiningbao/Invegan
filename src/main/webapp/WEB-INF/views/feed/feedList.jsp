<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style>
/* 왼쪽 사이드바 메뉴 스타일 */
.container {
	width: 1000px;
	margin: 0 auto;
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

/*.post img {
	max-width: 50%;
	height: auto;
} */

.mainFeedPhoto {
	width: 600px;
	height: 400px;
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

.user-profile {
	
}



/* .feedWriteModal {
	display: none;
}

.feedDetailModal {
	display: none;
}
 */
.commentFeedWrite {
	float: right;
}

.post-del-btn, .post-edit-btn {
	float: right;
}

.ui-autocomplete {
	max-height: 200px;
	overflow-y: auto;
	/* prevent horizontal scrollbar */
	overflow-x: hidden;
	height: auto;
}

.ui-menu-item div.ui-state-hover, .ui-menu-item div.ui-state-active {
	color: #ffffff;
	text-decoration: none;
	background-color: #f6B664;
	border-radius: 0px;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	background-image: none;
	border: none;
}
.no-comment{
	color : gray;
}
.addBtnSearch {
	display: none;
}

.addBtn {
	display: none;
}

.btn {
	width:100px;
	margin-top:5px;
	margin-bottom:5px;
	height:40px;
}
.btn-success{
	width:150px;
	margin-bottom:5px;
	height:40px;
}



.btn-info{
	
	width:70px;
	height:40px;
	
	
}

#post-tag {
    font-size: 15px;
    
}

.mainFeedPhoto{
	border:1px solid gray;
}

.custom-col-1{
  border-left: 1px solid #000; /* 선의 스타일, 색상 및 두께를 조정합니다. */
  height: 100vh; /* 컨테이너의 높이에 맞추도록 설정합니다. */
  position: sticky;
  top: 0; /* 페이지의 상단에 고정합니다. */
}

.col-3{
	position st;
	z-index:1;
	
}

</style>

</head>

<body>
	<c:import url="/main/header" />
	

		<div id="feedWriteModal" class="feedWriteModal">
			<%@ include file="feedWrite.jsp"%>
		</div>

		<div id="feedDetailModal" class="feedDetailModal">
			<%@ include file="feedDetail.jsp"%>
		</div>

	
	
	
	<div class="container-fluid">
		
			<div class="row">
				<div class ="col-3 custom-col-3" style="position:fixed">
					<h4>기본태그</h4>
					<button type="button" class="btn btn-outline-info" name="food">#식품</button>
					<button type="button" class="btn btn-outline-info" name="beauty">#뷰티</button>
					<button type="button" class="btn btn-outline-info" name="fashion">#패션</button>
					<button type="button" class="btn btn-outline-info" name="daily">#일상</button>
					<button type="button" class="btn btn-outline-info" name="restaurant">#식당</button>
					<button type="button" class="btn btn-outline-info" name="recipe">#레시피</button>
					<div id="autoSearch">
						<input type="text" id="autoComplete" class="autoComplete" placeholder="검색하고싶은 태그를 입력해주세요. ex) #식당">
						<button type="button" id="searchbtn" class="btn btn-Dark"><b>검색</b></button>
					</div>
					<button type="button" id="write-btn" class="btn btn-success"
						data-toggle="modal" data-target=".bd-example-modal-xl">피드게시글 작성</button>
				</div>
				<div class="col-4">
					
				</div>
				<div class="col-6">
					<div id="feedList" class="feedListPost">
							<!-- 피드 리스트 동적으로 그리기 -->
					</div>
				</div>		
			</div>

	</div>
		<!-- 가운데에 내용 배치 -->
		


		<button id="addBtn" class="addBtn">
			<span>더보기</span>
		</button>
		<button id="addBtnSearch" class="addBtnSearch">
			<span>더보</span>
		</button>
	

	<!-- 위와 같은 구조의 다른 Instagram 피드 게시물들을 추가 -->



	<c:import url="/main/footer" />
</body>
<script>

	//header 카테고리 선택유지
	$('#go_feed').css('box-shadow','#95df95 0px 2px 0px 0px');
	var loginInfo;
	var limitcnt = 10;
	var searchbt = '#전체리스트';
	//     var autoText ="*";
	$(document).ready(function () {
    listTagCall();
		
    
    $('.addBtn').css('display', 'block');
    //         moreList(); 
    $('#autoComplete').autocomplete(
            {source: function (request, response) { //source: 입력시 보일 목록
                 $.ajax({
                    url: 'feed/autocomplete.do',
                    type: 'POST',
                    dataType: 'JSON',
                    data: {value: request.term},
                            success: function (data) { // 성공
                            console.log(data);
                            console.log(data.resultList);
                            response($.map(data.resultList,function (item) {
                                    return {
                                    label: item.tag_content, // 목록에 표시되는 값
                                    value: item.tag_content,
                                    idx: item.tag_id};
                                     })); //response
                            },
                            error: function (e) { //실패
                                console.log("AJAX 오류 발생:");
                                console.log(e);
                            }
                        });
                },
                focus: function (event, ui) { // 방향키로 자동완성단어 선택 가능하게 만들어줌	
                    return false;
                },
                minLength: 1// 최소 글자수
                ,
                autoFocus: true // true == 첫 번째 항목에 자동으로 초점이 맞춰짐
                ,
                delay: 100 //autocomplete 딜레이 시간(ms)
                ,
                select: function (evt, ui) {
                    // 아이템 선택시 실행 ui.item 이 선택된 항목을 나타내는 객체, lavel/value/idx를 가짐
                    console.log(ui.item.label);
                    console.log(ui.item.value);
                    console.log(ui.item.idx);
                }
            });
						function autoListCall() {
							console.log('autoListCall 호출');

							$.ajax({
								url : 'autoSearchTag',
								data : {
									'autoText' : autoText,
									'limitcnt' : limitcnt
								},
								success : function(data) {
									console.log(data);
									console.log(data.searchResult);
									console.log(data.limitcnt);
									console.log(data.listSize);
									drawList(data.list);
									if (data.limitcnt > data.listSize) {
										$('#autoSearchBtn').prop('disabled',true);
									} else {
										$('#autoSearchBtn').prop('disabled',false);
									}
								},
								error : function(e) {
									console.log('에러발생' + e);
								},
							});
						}
						
						

						$('#searchbtn').on('click', function() {
							backToTop();
							limitcnt = 10;
							console.log('click');
							// 			$('.autoSearchBtn').css('display','block');
							//         	$('.addBtn').css('display','none');
							$('.addBtn').css('display', 'none');
							$('.addBtnSearch').css('display', 'block');
							
							autoText = $('#autoComplete').val();
							console.log(autoText);

							autoListCall();

						})

// 						$('body').css('overflow', 'auto');
						$('#write-btn').on('click', function() {
							/* $('.feedWriteModal').css({'display' : 'block'}); */
							 $('.modal-backdrop.show').css({'display' : 'none'});
							console.log('a');
							console.log(loginInfo);
							if (loginInfo == null) {
								alert('로그인 해주세요 !');
								location.href = "/invegan/member/login.go";
							} else {
								


							}

						})

						// list 불러오기와 tag 선택했을떄 list 불러오기         
						function listTagCall() {

							console.log("listTagCall 메서드 호출");

							$.ajax({
								type : 'GET',
								url : 'searchByTag',
								data : {
									'searchbt' : searchbt,
									'limitcnt' : limitcnt
								},
								dataType : 'JSON',
								success : function(data) {
// 									console.log(data);
// 									console.log(data.list);
// 									console.log(data.listSize);
// 									console.log(data.limitcnt);
									drawList(data.list);
									loginInfo = data.loginInfo;
									console.log(loginInfo);
									if (data.limitcnt > data.listSize) {
										$('#addBtn').prop('disabled', true);
									} else {
										$('#addBtn').prop('disabled', false);
									}
								},
								error : function(error) {
									console.log("버튼클릭 리스트불러오기 에러" + error);
								}
							});
						}
						// 기본태그를 클릭했을때 나오는 리스트 처리
						$(document).on('click', '.btn-outline-info', function() {
							backToTop();
							limitcnt = 10;
							$('.addBtn').css('display', 'block');
							$('.addBtnSearch').css('display', 'none');
							searchbt =$(this).text();
							
							console.log(searchbt);
							console.log(limitcnt);
							listTagCall();

						});

						// 전체리스트와 피드태그를 선택했을때 더보기 처리
						$('#addBtn').on('click', function() {

							limitcnt += 10;
							console.log('click');
							console.log('aa');
							listTagCall();

						})

						// 피드를 검색했을때 나오는 더보기 처리
						$('#addBtnSearch').on('click', function() {
							limitcnt += 10;
							console.log('click');
							console.log('bb');
							autoListCall();

						})

						function drawList(list) {
							console.log(list);
							var content = '';
							list.forEach(function(item, idx) {			
								var tags = item.tag_content;
								var allowedTags = [ '#식품', '#패션','#일상', '#레시피', '#뷰티', '#식당' ];
									
									content += '<div class="post">';
									if (tags) {
										allowedTags.forEach(function(tag) {
											if (tags.includes(tag)) {
												content += '<button class="btn btn-info" id="post-tag">'+ tag+ '</button>';
												}
											});
										}
									content += '<div class="post-header">';
									content += '<div class="user-profile"><img src="/photo/' + item.profile_image + '"></div>'; // 사용자의 프로필 사진
									content += '<span class="username">'+ item.nickname + '</span>';
									content += '</div>';
									content += '<div class="post-details">';
									content += '<div class="post-image">';
									content += '<a href="#" class="post-link" data-post-id="'+ item.post_id+ '" data-toggle="modal" data-target="#detailModal" style="display: block; width: 100%; height: 100%;">';
									content += '<img src="/photo/' + item.server_file_name + '" class="mainFeedPhoto">';
									content += '</a>';
									content += '</div>';
									content += '<div class="post-content">';
									content += '<span class="feed-content">'+ item.content + '</span>';
									content += '<div class="post-caption">';
									content += '</div>';
									content += '<div class="post-comments">';
									content += '<div class="comment">';

									if (item.comment_user_nickname !== null && item.comment_text !== null) {
									    content += '<span class="username">' + item.comment_user_nickname + '</span>';
									    content += '<div class="detail-href">';
									    content += '<span class="comment">' + item.comment_text + '</span>';
									    content += '</div>';
									} else {
									    content +=  '<div class="no-comment">아직 댓글이 없습니다.</div>';
									}

									content += '</div>';
									content += '</div>';
									content += '</div>';
									var date = new Date(item.date);
									var dateStr = date.toLocaleDateString("ko-KR"); //en-US
									content += '<div class="tag-content">'+ item.tag_content + '</div>';
									content += '<div class="post-time">'+ dateStr + '</div>';
									content += '</div>';
									content += '<hr>';

									});
							$('#feedList').html(content);

						}

						$('#search-button').on('click', function() {
							var searchTerm = $('#search').val();
							console.log(searchTerm);

						});
						$(document).on('click', '#post-tag', function() {
							var tagbt = $(this).text();
							console.log(tagbt);
						});

					});
	
	

		function backToTop() {
			  const position =
				    document.documentElement.scrollTop || document.body.scrollTop;
				  if (position > 0) {
				    window.requestAnimationFrame(() => {
				      window.scrollTo(0, position - position / 10);
				      backToTop();
				    });
				  }
				}






</script>

</html>