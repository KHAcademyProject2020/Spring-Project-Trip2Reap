<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%--css --%>
<link rel="stylesheet" type="text/css" href="resources/css/hotel/hotel_detail.css">


<%-- swipper api cdn --%>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<title>호텔 게시글 상세보기 </title>
</head>

<body>

	
<c:import url="../common/menubar.jsp" />

<div id="main-container">
	<div id="title-container">
		<img id="hotel-icon" src="resources/images/hotelIcon.png" />
		<span id="title-name">호텔 예약</span>
	</div>
	
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
		
			<!-- 신라호텔  -->
			<h1 id="hotel-name">신라호텔 </h1>
		</div>
	
	</div>
	
	
	<!--호텔 소개   -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1></h1>
		</div>
	
	</div>
	
	<!--호텔 이미지 뷰 -->
	<div class="hotel_detail_common_container">
	
	</div>
	
	<!-- 1박이용 가격비교  -->
	<div class="hotel_detail_common_container">
	
	</div>
	
	<!-- 호텔 시설정보  -->
	<div class="hotel_detail_common_container">
	
	</div>
	
	
	<!-- 호텔위치  -->
	<div class="hotel_detail_common_container">
	
	</div>
	
	
	<!--호텔리뷰작성   -->
	<div class="hotel_detail_common_container">
	
	</div>
	
	
	
	
</div>

</body>
</html>