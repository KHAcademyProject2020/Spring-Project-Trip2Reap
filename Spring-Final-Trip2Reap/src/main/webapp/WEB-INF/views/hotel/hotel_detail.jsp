<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<%--css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/hotel/hotel_detail.css">
	
	<%-- swipper api cdn 	--%>
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
	
	
	<!-- 호텔이름 -->
	<div class="hotel_detail_common_container">
		
		<div class="subtitle-container">
		
			<!-- 호텔이름  -->
			<h1 id="hotel-name">신라 호텔 </h1>	
		</div>
		
		
		<div class="hotel-info-container">
		
			<!--호텔썸네일 이미지/ 해시태그 기록   -->
			<div id="thumbnail-img-hashtag-container">
				<div id="thumbnail-img-wrapper">
					<img id="thumbnail-img" alt="썸네일 이미지" src="resources/images/sinra.jpeg"/>
				</div>
				
				<div id="hashtag-wrapper">
					<!--해시태그가 있는 경우에만 보여준다.-->
					<ul id="hash-tags">
						<li><i class="fas fa-hashtag"></i><b>일류호텔</b> </li>
						<li><i class="fas fa-hashtag"></i><b>서울호텔</b> </li>
						
					</ul>
				</div>
			</div>
			
			
			
			<!--호텔정보(도로명주소/ 전화번호/ 운영시간/ 링크/ 총리뷰점수  / 좋아요개수 )  -->
			<div id="hotel-info-wrapper">
				<!--호텔정보  -->
				<div id="hotel-detail-info-ul-container">
					<ul id="hotel-detail-info-ul">
						<%--jstl을 사용해서 존재하지 않은 정보는 제외한다. (li단위로 )--%>
						
						<li>	
							<span class="info-icon-container">
								<i class="fas fa-map-marker-alt"></i>
							</span>
							
							<span>
								<!--도로명주소   -->
								<%-- href:https://map.naver.com/v5/search/{호텔이름}  --%>
								<b> <a target="_blank" href="https://map.naver.com/v5/search/신라호텔">{서울특별시 중구 장충동 동호로 249}</a> </b>	
							</span>
						</li>
						
						<li>
							<span class="info-icon-container">
								<i class="fas fa-phone"></i>
							</span>
							
							<span>
								<!-- 전화번호 -->
								<b>{02-2233-1111}</b>
							</span>
						</li>
						
						<li>
							<span class="info-icon-container">
								<i class="fas fa-clock"></i>
							</span>
							
							<span>
								<!-- 운영시간 : 운영오픈시간 & 운영종료시간  -->
								<b>{오픈시간 }</b>~<b>{종시간 }</b>
							</span> 
						
						</li>
						
						<li>
							<span class="info-icon-container">
								<i class="fas fa-link"></i>
							</span>
							
							<span>
								<!--링크  -->
								<b><a target="_blank" href="#">{사이트 링크 주소 }</a></b>
							</span>
						</li>
						
						<li>
							<span class="info-icon-container">
								<i class="far fa-thumbs-up"></i>
							</span>
							<span>
								<!--리뷰 평점-->
								<span id="star-score-wrapper">
									<i class="fas fa-star"></i>
	                                <i class="fas fa-star"></i>
	                               	<i class="fas fa-star"></i>
	                                <i class="far fa-star"></i>
		                            <i class="far fa-star"></i>
								</span>
								
	                            <!--리뷰 평점(text)-->
	                        	<span>({3.0})</span>
							</span>
						</li>
						
						<li>
							<span class="info-icon-container">
								<i class="fas fa-hand-holding-heart"></i>
							</span>
							<span>
								<!--좋아요 개수  -->
								{좋아요 개수 }&nbsp;개
							</span>
						</li>
					</ul>
				</div>
				
				<div id="btn-wrapper">
					<!--버튼  -->
					<button id="go-reservation-btn">예약하기</button>
					
					<!--only administrator (관리자)  -->
					<button id="edit-hotel-detail-info-page-btn">수정하기</button>
				</div>
			</div>			
		</div>
	</div>
	
	
	<!--호텔소개 -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1>호텔 소개 </h1>
		</div>
		
		<div class="hotel-info-container">
			<p id="hotel-introduction">
			이 금연 호텔에는 6 개의 레스토랑 외에 풀서비스 스파 및 실내 수영장도 있습니다. 
			공용 장소에서의 무료 WiFi, 무료 지역 셔틀 및 무료 쇼핑센터 셔틀도 제공됩니다. 
			또한, 피트니스 시설, 바/라운지 및 스파 욕조도 이용하실 수 있습니다.
			</p>
		</div>
	</div>
	
	<!--호텔 이미지 뷰 -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1>호텔 이미지 뷰 </h1>
		</div>
		<div class="hotel-info-container">
			<div class="hotel-image-viewer">
				<ul id="hotel-detail-view-photos">
					<li id="first_detail_view_container">
						<div id="first_detail_view_wrapper" style="background-image:url(resources/images/sinra.jpeg)">
						</div>
					</li>
					
					<li class="detail_view_under_container">
						<div class="detail_view_under_wrapper" style="background-image:url(resources/images/trump.jpeg)">
						</div>
					</li>
					
					<li class="detail_view_under_container">
						<div class="detail_view_under_wrapper" style="background-image:url(resources/images/sample_hotel.jpg)">
						</div>
					</li>
					
					<li class="detail_view_under_container" id="more_detail_view">
						<div class="detail_view_under_wrapper">
							<!--몇장의 사진이 더 있는지 확인해주는   -->
							<p id="more_photo_num">+134</p> 
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 1박이용 가격비교  -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1>1박이용 가격비교 </h1>
		</div>
		<div class="hotel-info-container"></div>
	</div>
	
	<!-- 호텔 시설정보  -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1>호텔 시설정보 </h1>
		</div>
		<div class="hotel-info-container">
			<ul id="hotel-options-ul">
				<li>
					<span>
						<i class="hotel-option-icon  fas fa-wifi"></i>
					</span>
					<span><b>와이파이</b></span>
				 </li>
				 
				<li>
					<span>
						<embed class="hotel-option-icon" src="resources/svgs/breakfast.svg" type="text/svg+xml">
					</span>
					<span><b>조식</b></span> 
				</li>
				
				<li>
					<span>
						<embed class="hotel-option-icon" src="resources/svgs/restaurant.svg" type="text/svg+xml">
					</span>
					<span><b>레스토랑</b></span> 
				</li>
				
				<li>
					<span>
						<embed class="hotel-option-icon" src="resources/svgs/laundry.svg" type="text/svg+xml">
					</span>
					<span><b>세탁 </b></span>
				</li>
				
				<li>
					<span>
						<embed class="hotel-option-icon" src="resources/svgs/reception.svg" type="text/svg+xml">
					</span>
					<span><b>24시간 리셉션 </b></span>
				</li>
				
				<li>
					<span>
						<embed class="hotel-option-icon" src="resources/svgs/luggage.svg" type="text/svg+xml">
					</span>
					<span><b>수하물 보관 </b></span>
				</li>
				
				<li>
					<span><i class="hotel-option-icon fas fa-swimming-pool"></i></span>
					<span><b>수영장</b></span> 
				</li>
				
				<li>
					<span><i class="hotel-option-icon  fas fa-dumbbell"></i></span>
					<span><b>피트니스</b></span> 
				</li>
				
				<li>
					<span><i class="hotel-option-icon fas fa-hot-tub"></i></span>
					<span><b>스파 & 사우나 </b></span>
				</li>
				
				<li>
					<span>
						<embed class="hotel-option-icon" src="resources/svgs/hairdresser.svg" type="text/svg+xml">
					</span>
					<span><b>미용실 </b></span> 
				</li>
				
				<li>
					<span><i class="hotel-option-icon fas fa-coffee"></i></span>
					<span><b>카페</b></span> 
				</li>
				
				<li>
					<span>
						<i class="hotel-option-icon fas fa-user-tie"></i>
					</span>
					<span><b>비즈니스 시설</b></span>	
				</li>
				
				<li>
					<span>
						<i class="hotel-option-icon fas fa-parking"></i>
					</span>
					<span><b>주차</b></span>
				</li>
				
				<li>
					<span><i class="hotel-option-icon fas fa-bus-alt"></i></span>
					<span><b>공항셔틀</b></span>
				</li>
				
				<li>
					<span>
						<i class="fas fa-wheelchair hotel-option-icon"></i>
					</span>
					<span><b>장애인 편의시설</b></span> 
				</li>
				
				<li>
					<span>
						<i class="fas fa-glass-martini-alt hotel-option-icon"></i>
					</span>
					<span><b>바 &amp; 라운지</b></span> 
				</li>
				
				<li>
					<span>
						<embed class="hotel-option-icon" src="resources/svgs/kitchen.svg" type="text/svg+xml">
					</span>
					<span><b>주방</b></span> 
				</li>
				
				<li>
					<span>
						<embed class="hotel-option-icon" src="resources/svgs/baby1.svg" type="text/svg+xml">
					</span>
					<span><b>아이돌봄 서비스 </b></span> 
				</li>
				
				<li>
					<span>
						<embed class="hotel-option-icon" src="resources/svgs/roomservice.svg" type="text/svg+xml">
					</span>
					<span><b>룸서비스</b></span> 
				</li>
				
				<li>
					<span>
						<i class="hotel-option-icon fas fa-paw"></i>
					</span>
					<span><b>애완동물 동반</b></span> 
				</li>
			</ul>
		</div>	
	</div>
	
	
	
	<!--호텔리뷰   -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1>호텔 리뷰</h1>
		</div>
		<div class="hotel-info-container">
			
		</div>	
	</div>
	
</div>

</body>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
</script>

</html>