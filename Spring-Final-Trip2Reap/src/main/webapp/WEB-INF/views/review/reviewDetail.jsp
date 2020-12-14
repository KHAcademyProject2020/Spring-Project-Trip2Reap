<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="resources/css/review/reviewDetail.css" />
<meta charset="UTF-8">

<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<title>전국방방곡곡 | 여행후기</title>

</head>
<body>
	
		<header>
			<c:import url="../common/menubar.jsp" />
		</header>
		
		
		<!-- 전체 div -->
		<div id="all_div">
			<!-- 메뉴 이름 div -->
			<div id="menu_div">
				<div id="menu_left_div">
					<i class="fas fa-camera-retro" id="menuIcon3"></i> 
					<span id="menu">여행후기</span>
				</div>
			</div>
			
			<div id="detaildiv">
		        <!-- 게시판 본내용(전체를 감싼다): 회색영역 -->
		        <div id="review_detail_container" class="container">
		            <!--head-->
		            <div id="review_header_container" class="container">
		                <div id="review_title_container" class="container">
		                    <div id="category_container" class="container">
		                        <b><small id="category">${review.caName }</small></b>
		                    </div>
		
		                    <div id="title_container" class="container">
		                        <h1 id="title">${review.boTitle}</h1>
		                    </div>
		
		                    <!-- 작성자 -->
		                    <div id="author_container" class="container">
		                        작성자&nbsp; <span id="author">${review.nickName }</span>
		                    </div>
		                    
		                    
		                    <div id="info_and_hashtag_container" class="container">
		                        <div id="review_info_container" class="container">
		                            <ul id="review_info_container_ul">
		                                <li>${review.regDate }</li>
		                                
		                                <li>
		                                    <i class="far fa-eye"></i>
		                                    <span>${review.boCount }</span>
		                                </li>
		                            </ul>
		                        </div>
		                        
		                         <!-- 해시태그 -->
		                        <c:if test="${review.boTag !=null }">
			                        <div id="hashtag_container" class="container">
			                           	${review.boTag }
			                        </div>
		                        </c:if>
		                    </div>
		                </div>
		
		            </div>
		
		            <!--body-->
		            <div id="review_body_container" class="container">
		                <!--photo_container: 사진-->
		                <c:if test="${review.changeName!=null }">
			                <div id="photo_container" class="container">
			                    <img src="resources/buploadFiles/${review.changeName}" width="600px;" height="500px;">
			                </div>
		                </c:if>
		
		                <!--review_content: 게시글 본내용-->
		                <div id="review_content_container" class="container">
		                	<p id="review_content">
		                    	${review.boContent }
		                	</p>
		                </div>
		            </div>
		
		
		            <!--좋아요 -->
		            <div id="like_container">
		                <i id="like_btn" class="fas fa-heart"></i> 
		                <span>(좋아요개수)</span>
		            </div>
		
		
		            <!-- 덧글 -->
		            <div id="reply_container" class="container">
		                <div id="reply_title_container" class="container">
		                    <h2>댓글 <b id="rCount"></b></h2>
		                </div>
		
		                <!--save_replies: 댓글을 저장하는곳.-->
		                <div id="save_replies" class="container">
		                	<table id="rtb">
		                		<thead>
		                			<tr>
		                				<td colspan="4">
		                				</td>
		                			</tr>
		                		</thead>
		                		<tbody></tbody>
		                	</table>
		                
		                </div>
		
		                <!--write_replies: 댓글을 작성하는 곳-->
		                <div id="write_replies" class="container">
		                    <!--reply_content: 덧글 내용-->
		                    <textarea id="reply_content"  cols="50"></textarea>
		
		                    <!--submit_reply: 덧글 작성버튼-->
		                    <input id="submit_reply_btn" type="button" value="댓글작성">
		                </div>
		            </div><!--reply_container: 댓글작성란 -->
		
		        </div><!--review_detail_container(회색영역)-->
		
		        <!-- 글작성하기 & 목록 & 맨위로 -->
		        <div id="goto_container" class="container">
		            <div id="write_review_container" class="container">
		                <ul id="write_review_ul">
		                    <li>
		                        <!--게시글 작성버튼 (회원 누구나)-->
		                        <input id="write_review_btn" type="button" value="게시글 작성">
		                    </li>
		                    
		                    <c:url var="rupView" value="rupView.bo">
		                    	<c:param name="boNo" value="${review.boNo }"/>
		                    	<c:param name="page" value="${page }"/>
		                    </c:url>
		                    
		                    <c:url var="rdelete" value="rdelete.bo">
		                    	<c:param name="boNo" value="${review.boNo }"/>
		                    </c:url>
		                    
		                    <c:if test="${loginUser.nickName eq review.nickName }">
			                    <li>
			                        <!--게시글 수정버튼 (게시글 작성자만)-->
			                        <input id="update_review_btn" type="button" value="게시글 수정" onclick="location.href='${rupView}'">
			                    </li>
			                    <li>
			                        <!--게시글 삭제버튼 (게시글 작성자만)-->
			                        <input id="delete_review_btn" type="button" value="게시글 삭제" onclick="del(${review.boNo})">
			                    </li>
		                    </c:if>
		
		                </ul>
		            </div>
		            <div id="goto_wrapper" class="container">
		                <ul id="goto_wraper_ul">
		                    <li><input id="go_review_list_btn" type="button" value="목록"></li>
		                    <li><input id="go_top_btn" type="button" value="맨위로"></li>
		                </ul>
		            </div>
		        </div>
		
		    </div><!--detaildiv(글본론)-->
		</div>
			
			<%--글본론
			<div id="detaildiv">

				<div id="detailtable">

					<table id="detailView">


						<tr>
							<td colspan="5">
								<p style="color: lightgreen; font-size: 20px;">
									<b>&nbsp;&nbsp;${review.caName}</b>
								</p>
							</td>
						</tr>
						<tr>
							<td colspan="5"><br>
								<p style="font-size: 40px;">
									<b>&nbsp;&nbsp;${review.boTitle}</b>
								</p></td>
						</tr>

						<tr>
							<td colspan="5"><br> &nbsp;&nbsp; 글쓴이 :
								${review.nickName}</td>
						</tr>

						<tr>
							<td>${review.regDate } &nbsp; <i class="fas fa-eye"></i>&nbsp;${review.boCount}&nbsp;
								<i class="fas fa-thumbs-up"></i>&nbsp;22&nbsp; <i
								class="fas fa-comment-dots"></i>&nbsp;<b id="checkCount"></b>
							</td>
							<td colspan="3"></td>
							<td>#${review.boTag }</td>
						</tr>

						<tr>
							<td colspan="5">

								<hr>
								<br>
							</td>
						</tr>
						<tr>

							<td colspan="5"><c:if test="${review.changeName != null }">

									<img src="resources/buploadFiles/${review.changeName}"
										width="600px;" height="500px;">
								</c:if> <c:if test="${review.changeName == null }">
									<img id="review_img" class="center-block"
										src="resources/images/emoticon.png">
								</c:if></td>

						</tr>

						<tr>
							<td colspan="5"><br>
							<br>
							<br>
								<div id="content">${review.boContent }</div></td>
						</tr>
						<tr>
							<td colspan="5"><i class="far fa-thumbs-up fa-3x"></i>좋아요
								<hr></td>
						</tr>

					</table>

					<div id="replydiv">
						<table class="replyTable" id="rtb">
							<thead>
								<tr>
									<td colspan="3"><b id="rCount"></b>
										<hr></td>
								</tr>
							</thead>
							<tbody></tbody>
						</table>


						<table class="replyTable">
							<tr>

								<td><textarea id="reContent" rows="3" cols="55"
										placeholder="댓글을 입력해보세요."></textarea></td>

								<td>
									<button id="rSubmit">댓글작성</button>
								</td>

							</tr>

						</table>
					</div>

				</div>


			</div>
			
			

			<c:url var="rupView" value="rupView.bo">
				<c:param name="boNo" value="${ review.boNo }" />
				<c:param name="page" value="${ page }" />
			</c:url>

			<c:url var="rdelete" value="rdelete.bo">
				<c:param name="boNo" value="${ review.boNo }" />
			</c:url>
			

			
			
			
			<table>
				<c:if test="${ loginUser.nickName eq review.nickName }">


					<tr>
						<td colspan="2" align="center">

							<button onclick="location.href='${ rupView }'">수정하기</button>


							<button onclick="del(${review.boNo})">게시글삭제</button>



						</td>
					</tr>
				</c:if>
			</table>
		</div> 


	</section>
	 --%>
	
	
	
<script>
function del(boNo) {
	var chk = confirm("정말 삭제하시겠습니까?");
	if (chk) {
		location.href='rdelete.bo?boNo='+boNo;
		alert("삭제되었습니다");
	}
}

</script>


<script>
$(function() {
	// 댓글은 계속 갱신되어야 하므로 소스 추가
	getReplyList();
	setInterval(function() {
		getReplyList();
	}, 1000); // 1초에 1번씩 업데이트  
});

// 덧글등록- #rSubmit / #submit_reply_btn
// 덧글내용- #reContent / #reply_content
$('#submit_reply_btn').on('click', function() {
	var reContent = $('#reply_content').val(); //댓글 내용	      
	var boNo = ${review.boNo}; // 댓글이 달린 게시글 번호

	// console.log("댓글 내용 : " + rContent);
	// console.log("게시글 번호 : " + refBid);

	$.ajax({
		url : 'addReply.bo',
		data : {reContent : reContent,boNo : boNo},
		success : function(data) {
			if (data == 'success') {
				$('#reply_content').val("");
			}
		},
		error : function() {
			console.log("댓글 등록 에러");
		}
	});
});

function getReplyList() {
	var boNo = ${review.boNo};
	
	$.ajax({
			url : "rList.bo",
			data : {boNo : boNo},
			success : function(data) {
				 //console.log(data);					
				
				$tableBody = $('#rtb tbody');
				$tableBody.html('');

				var $tr;
				var $nickName;
				var $reContent;
				var $reDate;
				var $delete
				

				$('#rCount').text('(' + data.length + ')');
				$('#checkCount').text(+ data.length);

				if (data.length > 0) {
					for ( var i in data) {
						$tr = $('<tr class="review_reply">');
						$nickName = $('<td class="reply_nickname" style="width:100px;">').text(data[i].nickName);
						$reContent = $('<td>').text(data[i].reContent);
						$reDate = $('<td style="width:100px;>').text(data[i].reDate);
						
						//여기 코드 고쳐야될거같아요 규호씨!
						//바로 밑에 줄에 있는 코드는 주석처리했어요!! del(${review.boNo}) 는 "댓글삭제"가 아니라 "게시글 삭제"인거같아요!
						//$delete = $('<td>'+'<button onclick="del(${review.boNo})"></button>'+'</td>');
						
						
						$tr.append($nickName);
						$tr.append($reContent);
						$tr.append($reDate);
			
						$tableBody.append($tr);
						
					}
				} else {
					$tr = $('<tr>');
					$rContent = $('<td colspan="4">').text('등록된 댓글이 없습니다.');

					$tr.append($reContent);
					$tableBody.append($tr);
				}
			}
		});
}
</script>

</body>
</html>