<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<%--css --%>
	<link rel="stylesheet" type="text/css" href="resources/css/hotel/hotel_detail.css">
	
	<%--fontawesome --%>
	
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
	
	
	<!-- 호텔이름 / 호텔소 -->
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
								<b>{서울특별시 중구 장충동 동호로 249}</b>	
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
	
	
	
	<!--호텔 이미지 뷰 -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container"></div>
		<div class="hotel-info-container"></div>
	</div>
	
	<!-- 1박이용 가격비교  -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container"></div>
		<div class="hotel-info-container"></div>
	</div>
	
	<!-- 호텔 시설정보  -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container"></div>
		<div class="hotel-info-container"></div>	
	</div>
	
	
	<!-- 호텔위치  -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container"></div>
		<div class="hotel-info-container"></div>	
	</div>
	
	
	<!--호텔리뷰   -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container"></div>
		<div class="hotel-info-container"></div>	
	</div>
	
	
	
	
</div>

</body>
</html>