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
		<br><br><br>
			

				<div id="detaildiv">
				<br>
					<div id="detailtable">
					
					<table id="detailView" >


						<tr>
							<td colspan="5">
							<p style="color: lightgreen; font-size:20px;">
							<b>&nbsp;&nbsp;${review.caName}</b></p>
							</td>
						</tr>
						<tr>
							<td colspan="5"> 
							<br>
							<p style=" font-size:40px;">
							<b>&nbsp;&nbsp;${review.boTitle}</b></p>
							</td>
						</tr>

						<tr>
							<td colspan="5">
							<br>
							&nbsp;&nbsp; 글쓴이 : ${review.nickName}
							</td>
						</tr>
						
						<tr>
							<td>
							${review.regDate } &nbsp;
							<i class="fas fa-eye"></i>&nbsp;${review.boCount}&nbsp;
							<i class="fas fa-thumbs-up"></i>&nbsp;22&nbsp;
							<i class="fas fa-comment-dots"></i>&nbsp;<b id="checkCount"></b>
							</td>
							<td colspan="3"></td>
							<td>#${review.boTag }</td>
						</tr>

						<tr>
							<td colspan="5">
							
								<hr><br>
							</td>
						</tr>
						<tr>

							<td colspan="5"><c:if test="${review.changeName != null }">

									<img src="resources/buploadFiles/${review.changeName}" width="600px;" height="500px;">
								</c:if> <c:if test="${review.changeName == null }">
									<img id="review_img" class="center-block"
										src="resources/images/emoticon.png">
								</c:if></td>

						</tr>

						<tr>
							<td colspan="5"><br><br><br>
								<div id="content">${review.boContent }</div>
							</td>
						</tr>
						<tr>
							<td colspan="5">
							<i class="far fa-thumbs-up fa-3x"></i>좋아요
								<hr>
							</td>
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

							<td>
							<textarea id="reContent" rows="3" cols="55" placeholder="댓글을 입력해보세요."></textarea>
							</td>
							
							<td>
							<button id="rSubmit">댓글작성</button>
							</td>
							
						</tr>
						
					</table>
					</div>
					
					</div>


				</div>
				
				<c:url var="rupView" value="rupView.bo">
						<c:param name="boNo" value="${ review.boNo }"/>
						<c:param name="page" value="${ page }"/>
					</c:url>	
					
					<c:url var="rdelete" value="rdelete.bo">
						<c:param name="boNo" value="${ review.boNo }"/>
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
			</div><br><br><br><br><br><br><br><br>
		

		


	</section>
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

		$('#rSubmit').on('click', function() {
			var reContent = $('#reContent').val(); //댓글 내용	      
			var boNo = ${review.boNo}; // 댓글이 달린 게시글 번호

			// console.log("댓글 내용 : " + rContent);
			// console.log("게시글 번호 : " + refBid);

			$.ajax({
				url : 'addReply.bo',
				data : {reContent : reContent,boNo : boNo},
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
							 //console.log(data);					
							
							$tableBody = $('#rtb tbody');
							$tableBody.html('');

							var $tr;
							var $nickName;
							var $reContent;
							var $reDate;
							

							$('#rCount').text('댓글(' + data.length + ')');
							$('#checkCount').text(+ data.length);

							if (data.length > 0) {
								for ( var i in data) {
									$tr = $('<tr>');
									$nickName = $('<td width=100>').text(data[i].nickName);
									$reContent = $('<td>').text(data[i].reContent);
									$reDate = $('<td width=100>').text(data[i].reDate);
						


									$tr.append($nickName);
									$tr.append($reContent);
									$tr.append($reDate);
						
									$tableBody.append($tr);
									
								}
							} else {
								$tr = $('<tr>');
								$rContent = $('<td colspan="3">').text('등록된 댓글이 없습니다.');

								$tr.append($reContent);
								$tableBody.append($tr);
							}
						}
					});
		}
	</script>

</body>
</html>