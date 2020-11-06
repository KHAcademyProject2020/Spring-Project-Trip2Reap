<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/review/reviewList.css"/>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>  
 
 <style>
table{

    width: 800px;

    border-top: 1px solid #444444;

    border-collapse: collapse;
    
    margin: 50px;

  }

th, td{

    border-bottom: 1px solid #444444;

    padding: 5px;

  }
  </style>
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
				<span id="menu" >여행 후기</span>
			</div>
		
		
		</div>
		</div>
		<div id="cate_btn">
			<button class="cate_btn">전체보기</button>
			<button class="cate_btn">여행지</button>
			<button class="cate_btn">맛집</button>
		</div>	
		
		<div id="bo_btn">
			<button class="bo_btn">사진형</button>
			<button class="bo_btn">게시판형</button>
		</div>
		
		<table>
		<tr align="center" bgcolor="lightgray">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>좋아요</th>
		</tr>
		
		<c:forEach var="i" begin="1" end="10" step="1" varStatus="loop">
		<tr align="center">
			<td>test</td>
			<td>tesddddddddddddddt</td>
			<td>test</td>
			<td>test</td>
			<td>test</td>
			<td>test</td>
		</tr>
		</c:forEach>
		
		
		</table>
	
	</section>

</body>
</html>