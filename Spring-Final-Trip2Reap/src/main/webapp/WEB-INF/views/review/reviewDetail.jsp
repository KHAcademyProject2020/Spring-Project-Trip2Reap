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
<title>Insert title here</title>
<style>
table td {
	
}

#insert_div {
	width: 1000px;
	text-align: center;
}

#insertReview {
	width: 800px;
	padding-left: 100px;
	text-align: center;
}
</style>
</head>
<body>
	<section>
		<header>
			<c:import url="../common/menubar.jsp" />
		</header>
		<!-- 전체 div -->
		<div id="all_div">
			<!-- 메뉴 이름 div -->
			<div id="menu_div">
				<div id="menu_left_div">
					<i class="fas fa-camera-retro" id="menuIcon3"></i> <span id="menu">여행
						후기</span>
				</div>
			</div>


			<!-- 작성하기 div 시작 -->
			<div id="insert_div">

				<!-- 작성하기 table 시작 -->
				<div id="insertReview">
					<table id="travel_table">


						<tr>
							<td colspan="5">[${review.caName}] ${review.boTitle}</td>
						</tr>

						<tr>
							<td colspan="5"><span><b>글쓴이 : ${review.memberId }</b></span></td>
						</tr>
						<tr>
							<td>${review.regDate }</td>
							<td colspan="3"></td>
							<td>${review.boTag }</td>
						</tr>

						<tr>
							<td colspan="5">
								<hr>
							</td>
						</tr>
						<tr>

							<td colspan="5"><c:if test="${review.changeName != null }">

									<img
										src="resources/buploadFiles/${review.changeName}
							 "
										width="600px;" height="500px;">
								</c:if> <c:if test="${review.changeName == null }">
									<img id="review_img" class="center-block"
										src="resources/images/emoticon.png">
								</c:if></td>

						</tr>

						<tr>
							<td colspan="5">
								<div>${review.boContent }</div>
							</td>
						</tr>
						<tr>
							<td colspan="5">좋아요
								<hr>
							</td>
						</tr>

					</table>

					
					<table class="replyTable">
						<tr>

							<td>
							<textarea id="reContent" rows="10" cols="100"
									placeholder="댓글을 입력해보세요.">
									</textarea>
							</td>
							<td colspan="5">
							<button id="rSubmit">댓글작성</button>
							</td>
						</tr>
					</table>

					<table class="replyTable" id="rtb">
						<thead>
							<tr>
								<td colspan="2"><b id="rCount"></b></td>
							</tr>
						</thead>
						<tbody></tbody>
					</table>


				</div>
			</div>
			<!-- 전체 div 끝 -->

			<!-- 버튼 div -->
			<div id="button_div">
				<button id="button_write">등록</button>
				<button id="button_write">목록</button>
				<button id="button_write">Top▲</button>
			</div>

		</div>


	</section>

	<script>
		$(function() {
			// 댓글은 계속 갱신되어야 하므로 소스 추가
			getReplyList();
			setInterval(function() {
				getReplyList();
			}, 1000); // 1초에 1번씩 업데이트  
		});

		$('#rSubmit').on('click', function() {
			var reContent = $('#reContent').val(); //댓글 내용	      
			var boNo = ${review.boNo}; // 댓글이 달린 게시글 번호

			// console.log("댓글 내용 : " + rContent);
			// console.log("게시글 번호 : " + refBid);

			$.ajax({
				url : 'addReply.bo',
				data : {
					reContent : reContent,
					boNo : boNo
				},
				success : function(data) {
					if (data == 'success') {
						$('#reContent').val("");
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
							// console.log(data);

							$tableBody = $('#rtb tbody');
							$tableBody.html('');

							var $tr;
							var $memberId;
							var $reContent;
							var $reDate;

							$('#rCount').text('댓글(' + data.length + ')');

							if (data.length > 0) {
								for ( var i in data) {
									$tr = $('<tr>');
									$rWriter = $('<td width=100>').text(
											data[i].rWriter);
									$reContent = $('<td>')
											.text(data[i].reContent);
									$reDate = $('<td width=100>').text(
											data[i].reDate);

									$tr.append($memberId);
									$tr.append($reContent);
									$tr.append($reDate);
									$tableBody.append($tr);
								}
							} else {
								$tr = $('<tr>');
								$rContent = $('<td colspan="3">').text(
										'등록된 댓글이 없습니다.');

								$tr.append($reContent);
								$tableBody.append($tr);
							}
						}
					});
		}
	</script>
</body>
</html>