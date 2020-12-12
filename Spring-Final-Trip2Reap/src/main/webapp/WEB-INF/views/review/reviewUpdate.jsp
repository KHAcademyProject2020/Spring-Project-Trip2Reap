<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/review/reviewInsert.css" />
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
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
						후기 수정</span>
				</div>
			</div>

			<form method="post" onsubmit="false;" action="rupdate.bo"  enctype="Multipart/form-data">
			<input type="hidden" name="page" value="${ page }">
			<input type="hidden" name="boNo" value="${ review.boNo }">
			<input type="hidden" name="changeName" value="${ review.changeName }">
				<div id="wrapperForm">
					<br> <br>
					<div id="cate">

						<select id="select_search" name="caCode">
							<option>카테고리를 선택해주세요</option>
							<option value="2">여행 코스</option>
							<option value="3">여행지</option>
							<option value="4">맛집</option>
							<option value="5">호텔</option>
						</select>

					</div>
					
					<br>
					<br>

					<div class="writeForm" id="writer">
						<input type="file" id="photo_btn" name="reloadFile"> 
						<c:if test="${ !empty review.originName }">
						<br>현재 업로드한 파일 : 
						<a href="${ contextPath }/resources/buploadFiles/${ review.changeName }" download="${ review.originName }">
							${ review.originName }
						</a>
					</c:if>
						

						<input type="hidden" name="memberId" value="${loginUser.memberId }">
					</div>
					
					<br>
					
					<div class="writeForm" id="title">
						<textarea name="boTitle" 
							class="textarea_input" style="height: 40px;">${review.boTitle}</textarea>
					</div>
					<br> <br>

					<div id="content">
								<br>

						<textarea id="contentForm" name="boContent" rows="40" cols="130">${review.boContent}</textarea>
							
							<div class="hashTag">
								
								
								<div  id="hashtag">
						
								<input type="text" 
								name="boTag" id="tag" value="${review.boTag }" />
								
							</div>
									
						
						</div>


						<br>
						
					</div>

					<br> <input type="submit" id="submit" value="등록"
						style="width: 50px; height: 30px;">
				</div>


			</form>

		</div>
		
		<br><br><br><br><br><br><br><br>
		
	<script>
     //모든 페이지가 요청이 되었을 때
     $(document).ready(function() {
         // ID를 alpreah_input로 가지는 곳에서 키를 누를 경우
         $("#tag").keydown(function(key) {
             //키의 코드가 13번일 경우 (13번은 엔터키)
             var $tag = $("#tag").val();
             if (key.keyCode == 13) {
            	 $('#hashtag').prepend("<div class='hashtag'>" + "#" + $tag +"</div>" + " ");
             }
         });
     });


		// 엔터시 전송되는거 막는 코드
		document.addEventListener('keydown', function(event) {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			}, true);
		
		
		//클릭시 배경 색 변환
		$(function(){	
			$('#tag').click(function(){$(this).css("background","#eff0f2")})
			
			
			
		})
		

		
	</script>

</section>

</body>
</html>