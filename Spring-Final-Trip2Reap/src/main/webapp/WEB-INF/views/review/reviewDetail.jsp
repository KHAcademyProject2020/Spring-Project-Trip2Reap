<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/review/reviewList.css"/>
<link rel="stylesheet" type="text/css" href="resources/css/review/reviewDetail.css"/>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>  
<title>Insert title here</title>
</head>
<body>
	<section>
		<header>
		<c:import url="../common/menubar.jsp" />
		</header>
		<div id="all_div">
		<div id="menu_div">
			<div id="menu_left_div">
				<img src="resources/images/review.jpg" id="menu_img"/>
				<span id="menu" >여행후기 </span>
			</div>
		</div>
		</div>
		<br>
		<div id="contentBox"><br>
		
		<div id="title">제목</div><br>
		<div id="writer">작성자</div><br>
		<div id="info">정보</div><br>
		<div id="hashTag">해쉬태그</div><br>
		<div id="photo">사진</div><br>
		<div id="content">내용</div><br>
		<div id="infoLike">좋아요</div><br>
		<div id="reply">댓글</div><br>
		
		</div>
		
		<button onclick="location.href='reviewInsert.bo';">게시글 작성</a></button>
		<button>목록</button>
		<button>Top▲</button>
		
		
		
		
		
	</section>	
</body>
</html>