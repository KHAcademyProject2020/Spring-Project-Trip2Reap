<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%-- jquery cdn --%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<%--css --%>
<link rel="stylesheet" type="text/css" href="resources/css/hotel/hotel_reservation.css">
<title>전국방방곡곡- 호텔 예약페이지 </title>
</head>

<body>
<c:import url="../common/menubar.jsp" />


<div id="main-container">
	<div id="title-container">
		<i class="fas fa-hotel" id="hotel-icon"></i>
		<span id="title-name">호텔 예약 </span>
	</div>
	
	<!--1. 예약 호텔/ 방 정보   -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>예약 호텔 및 방 정보 </h1>
		</div>
		
		<div class="hotel-reservation-content-container">
		
		</div>
	</div>
	
	<!-- 2. 체크인 / 체크아웃 시간 선택  -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>체크인 &amp; 체크아웃 날짜 선택 </h1>
		</div>
		
		<div class="hotel-reservation-content-container">
		
		</div>
	</div>
	
	<!--3. 객실 및 인원수 선택   -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>객실 및 인원 수 선택 </h1>
		</div>
		
		<div class="hotel-reservation-content-container">
		
		</div>
	</div>
	
	
	<!--4. 결제  -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>결제 수단 선택 </h1>
		</div>
		
		<div class="hotel-reservation-content-container">
		
		</div>
		
		<div class="hotel-reservation-content-container">
			<button id="go_payment">결제하기 </button>
		</div>
		
	</div>

</div>

</body>
</html>