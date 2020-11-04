<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/course/search_errorPage.css"/>
<!-- <script src="https://kit.fontawesome.com/8828f475ef.js" crossorigin="anonymous"></script> -->
</head>
<body>
	<section>
	<div id="all_div">
		<div id="menu_div">
			<div id="menu_left_div">
				<img src="resources/images/courseIcon.png" id="menu_img"/>
				<span id="menu">여행 코스</span>
			</div>
			<div id="menu_right_div">
				<input type="text" id="input_search"/>
				<input type="button" value="검색" id="button_search"/>
			</div>
		</div>
		
		<hr>
		
		<div id="error_div">
			<i class="far fa-times-circle" id="x_circle"></i>
			<div id="no_result">검색 결과가 없습니다!</div>
			<div id="please_ment">올바른 검색어를 입력해주세요.</div>
			<div id="button_div">
				<button id="button_list">목록보기</button>
			</div>
		</div>
	</div>
	</section>
</body>
</html>