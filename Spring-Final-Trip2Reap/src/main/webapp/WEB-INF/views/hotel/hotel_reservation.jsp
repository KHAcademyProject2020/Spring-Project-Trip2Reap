<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<%-- jquery ui (datepicker) --%>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<%--css --%>
<link rel="stylesheet" type="text/css" href="resources/css/hotel/hotel_reservation.css">
<title>전국방방곡곡:: 호텔 예약페이지 </title>
</head>

<body>

<c:import url="../common/menubar.jsp" />


<div id="main-container">
	<div id="title-container">
		<i class="fas fa-hotel" id="hotel-icon"></i>
		<span id="title-name">호텔 예약 </span>
	</div>
	
	<!--1. 예약 호텔/ 방 정보   -->
	<div class="hotel_reservation_common_container" id="reserve_hotel_room_info_container">
		<div class="subtitle-container">
			<div class="hotel-name-wrapper">
				<h1 id="hotel_name">호텔 신라 {호텔이름}</h1>
				<%--BO_NO (방번호) --%>
			</div>
			
			<div class="room-name-wrapper">
				<h2 id="room_name">더블 디럭스룸 - 산전망 {방이름} </h2>
				<%--ROOM_NO(방이름) --%>
			</div>
		</div>
	</div>
	
	<!-- 2. 체크인 / 체크아웃 시간 선택  -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>체크인 &amp; 체크아웃 날짜 선택 </h1>
		</div>
		
		<div class="hotel-reservation-content-container">
			<div class="calendar_container">
				<%-- check in  --%>
				<div class="calendar_wrapper">
					<div class="calendar_icon_wrapper">
						<i class="far fa-calendar-alt calendar_icon"></i>
					</div>
					<div class="calendar_content_wrapper">
						<input type="text" class="date" id="checkInDatePicker" placeholder="체크인 날짜" size="20">
					</div>
				</div>
				
				
				<%-- check out --%>
				<div class="calendar_wrapper">
					<div class="calendar_icon_wrapper">
						<i class="far fa-calendar-alt calendar_icon"></i>
					</div>
					<div class="calendar_content_wrapper">
						<input type="text" class="date" id="checkOutDatePicker" placeholder="체크아웃 날짜" size="20">
					</div>
				</div><%-- calendar_wrapper --%>
			</div><%-- calendar_container--%>
			
			
			
			<div class="hotel_using_day">
					<span></span>
			</div>		
		
		
		</div><%--hotel-reservation-content-container --%>
		
		
		<%--import : jquery ui (datepicker) --%>
		<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script>
		//datepicker - api
		$(function(){
			
			//체크인 날짜 선택
			$('#checkInDatePicker').datepicker({
				changeYear: true,
				changeMonth: true,
				dateFormat: 'yy-mm-dd',
				showMonthAfterYear: true,
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토' ],
				monthNamesShort : ['1월', '2월','3월','4월','5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
				yearSuffix: '년',
				minDate:0,
				
			}); 
			
			
			//체크아웃 날짜 선택
			$('#checkOutDatePicker').datepicker({
				changeYear: true,
				changeMonth: true,
				dateFormat: 'yy-mm-dd',
				showMonthAfterYear: true,
				dayNamesMin: ['일', '월', '화', '수', '목', '금', '토' ],
				monthNamesShort : ['1월', '2월','3월','4월','5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
				yearSuffix: '년',
				minDate:0,
					
			}); 
			
		});
			
		</script>
		
	</div><%--hotel_reservation_common_container --%>
	
	<!--3. 객실 및 인원수 선택   -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>객실이용 인원 수 선택 </h1>
		</div>
		
		<div class="hotel-reservation-content-container">
			<div class="count_reserve_person_container">
			
				<div class="count_container">
					<div class="count_label">성인&nbsp;&nbsp;</div>
					<div class="count_wrapper">
						<div class="button_wrapper">
							<button class="minus_btn" id="adult_minus_btn">-</button>
							<div id="adult_count">0</div>
							<button class="plus_btn" id="adult_plus_btn">+</button>
						</div>
					</div>
				</div>
				
				<div class="count_container">
					<div class="count_label">어린이</div>
					<div class="count_wrapper">
						<div class="button_wrapper">
							<button class="minus_btn" id="child_minus_btn">-</button>
							<div id="child_count">0</div>
							<button class="plus_btn" id="child_plus_btn">+</button>
						</div>
					</div>
				</div>
				
			</div> <%--count_reserve_person_container --%>
		</div> <%--hotel-reservation-content-container --%>
		
		<script>
		$(function(){
			//초기에는 0명이므로 -버튼을 누르지 못하게 해야한다.
			let $adultCntVal= Number($('#adult_count').text());
			if($adultCntVal==0){
				$('#adult_minus_btn').attr('disabled', true);
				$('#adult_minus_btn').css('cursor', 'none' );
			}
			

			let $childCntVal=Number($('#child_count').text());
			if($childCntVal==0){
				$('#child_minus_btn').attr('disabled', true);
				$('#child_minus_btn').css('cursor', 'none');
			}
			
			// 성인 인원수 버튼 선택
			// 성인수 증가 버튼 선택 함수 
			$('#adult_plus_btn').click( function(){
				let $nowVal= Number($('#adult_count').text());
				
				$nowVal+=1;
				$adultCntVal=$nowVal;
				if($adultCntVal>0){
					$('#adult_minus_btn').attr('disabled', false);
					$('#adult_minus_btn').css('cursor', 'pointer');
				}
				
				$('#adult_count').text($nowVal);
			});
			
			// 성인수 감소 버튼 선택 함수 
			$('#adult_minus_btn').click(function(){
				let $nowVal= Number($('#adult_count').text());
				$nowVal-=1;
				$adultCntVal=$nowVal;
				if($adultCntVal<=0){
					$('#adult_minus_btn').attr('disabled', true);
					$('#adult_minus_btn').css('cursor', 'none');
					$('#adult_count').text(0);
				}else{
					$('#adult_count').text($nowVal);
					$('#adult_minus_btn').css('cursor', 'pointer');
				}
			});
			
			// 어린이 인원수 버튼 선택
			// 어린이수 증가 버튼 선택함수 
			$('#child_plus_btn').click(function(){
				let $nowCVal= Number($('#child_count').text());
				$nowCVal+=1;
				$childCntVal=$nowCVal;
				if($childCntVal>0){
					$('#child_minus_btn').attr('disabled', false);
					$('#child_minus_btn').css('cursor', 'pointer');
				}
				$('#child_count').text($nowCVal);
				
			});
			
			// 어린이수 감소 버튼 선택함수
			$('#child_minus_btn').click(function(){
				let $nowCVal= Number($('#child_count').text());
				$nowCVal-=1;
				$childCntVal=$nowCVal;
				if($childCntVal<=0){
					$('#child_minus_btn').attr('disabled', true);
					$('#child_minus_btn').css('cursor', 'none');
					$('#child_count').text(0);
				}else{
					$('#child_count').text($nowCVal);
					$('#child_minus_btn').css('cursor', 'pointer');
				}
			});
			
		});
		
		</script>
		
	</div> <%--hotel_reservation_common_container --%>
	
	
	<!--4. 결제  -->
	<div class="hotel_reservation_common_container">
		<div class="subtitle-container">
			<h1>결제 수단 선택 </h1>
		</div>
		
		<div class="hotel-reservation-content-container">
			
		</div>
		
		<div class="hotel-reservation-content-container">
			<button id="go_payment">결제하기 </button> <%-- 체크한 부분에서 결제 api로 이동  --%>
		</div>
	</div>
</div>

</body>
</html>