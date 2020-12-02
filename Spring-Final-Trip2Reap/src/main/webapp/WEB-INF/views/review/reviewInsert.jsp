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
						후기 작성</span>
				</div>
			</div>

			<form method="post" action="rInsert.bo" enctype="Multipart/form-data">
				<div id="wrapperForm">
					<br> <br>
					<div class="writeForm" id="writer">
						<input type="file" id="photo_btn" name="uploadFile">
						<strong>작성자 ${loginUser.memberId }</strong> <input type="hidden"
							name="memberId" readonly value="${loginUser.memberId }">
					</div><br><br>
					
					<div id="cate">
					
						<select id="select_search" name="caCode" >
							<option>카테고리를 선택해주세요</option>
							<option value="2">여행 코스</option>
							<option value="3">여행지</option>
							<option value="4">맛집</option>
							<option value="5">호텔</option>
						</select>

					</div>
					<br> 
					<div class="writeForm" id="title">
						<textarea name="boTitle" placeholder="제목을 입력해 주세요."
							class="textarea_input" style="height: 40px;"></textarea>
					</div>
					<br> <br>
					
					<div class="writeForm" id="content">

						
						<textarea  placeholder="내용을 입력해주세요" name="boContent" rows="30" cols="100"></textarea>
						
						
						<br>
							 <input type="text" name="boTag" style="width:650px; height:50px;" placeholder="#태그를 입력해주세요(최대 3개)">
						
					</div>
					
					<br>

					<input type="submit" id="submit" value="제출" style="width:50px; height:30px;">	
					<button onclick="ddd" id="ddd">제출2</button>
				</div>


			</form>

		</div>
		
		
	<script>
		/* $('#submit').on("click",function(e){
			if($('#photo_btn').get(0).files[0].isEmpty()){
				
			} 
							
			}); */
		$('#ddd').click(function(){
			if($('#photo_btn').get(0).files[0] == 'undefined'){
				$('#ddd').submit();
			} 
		});

	
	</script>





	</section>
</body>
</html>
