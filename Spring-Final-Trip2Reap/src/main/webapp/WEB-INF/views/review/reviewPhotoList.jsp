<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/review/reviewList.css"/>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>  
  <style>
  <


  </style>
		

<title>Insert title here</title>
</head>
<body>
	<section>
	<div id="board_list">
		<header>
		<c:import url="../common/menubar.jsp" />
		</header>
		<div id="all_div">
		<div id="menu_div">
			<div id="menu_left_div">
				<img src="resources/images/review.jpg" id="menu_img"/>
				<span id="menu" >여행 후기</span>
			</div>
		
		</div>
		</div>
		<!-- text-align뿐만 아니라 대부분 div안에서 작동한다. -->
		<div id="cate_btn" style="display: inline-block; width: 770px">
			<button class="cate_btn">전체보기</button>
			<button class="cate_btn">여행지</button>
			<button class="cate_btn">맛집</button>
			</div>
			<div id="bo_btn" style="display: inline-block;">
			<button class="bo_btn">사진형</button>
			<button class="bo_btn">게시판형</button>
		</div>	
		
	
	    <div id="board">
	    
	 
	
	</div>
 

	
	</div>
	</section>
	
	

</body>
</html>