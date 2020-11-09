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
		
		<%--(1) hotel-info-container --%>
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
		
		<%--(2) --%>
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
		<%--(3) --%>
		<div class="hotel-info-container">
	
			<%-- 
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
							<!--몇장의 사진이 더 있는지 확인해준다. -->
							<p id="photo_viewer_modal" class="more_photo_num">+134</p>
						</div>
					</li>
				</ul>
			</div>
			 --%>
			
			
			<div class="hotel-image-viewer">
				<div class="swiper-container gallery-top">
					<div class="swiper-wrapper">
						<div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					</div>
					
					<div class="swiper-button-next swiper-button-white"></div>
					<div class="swiper-button-prev swiper-button-white"></div>
				</div> 
						
				<div class="swiper-container gallery-thumbs">
					<div class="swiper-wrapper">
						<div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
			            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					</div>
				</div>
			</div>
			<%--hotel-image-viewer --%>
		</div> <%-- hotel-info-container --%>
	</div>
	
	<!-- 1박이용 가격비교  -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1>1박이용 가격비교 </h1>
		</div>
		<%--(4) --%>
		<div class="hotel-info-container"></div>
	</div>
	
	<!-- 호텔 시설정보  -->
	<div class="hotel_detail_common_container">
		<div class="subtitle-container">
			<h1>호텔 시설정보 </h1>
		</div>
		
		<%--(5) --%>
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
					<span><b>스파 &amp; 사우나 </b></span>
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
		
		<%--(6) --%>
		<div class="hotel-info-container">
			
		</div>	
	</div>
	

	<%-- 
		이미지 더보기 버튼(id="photo_viewer_modal)을 누를때 
		발생하는 모달.
	 --%>
	 
	 <%--
	<div id="image-viewer-modal-container">
		<div class="modal-background">
			<div class="modal">
				<div id="image-viewer-modal-content-container">
					<div class="modal-close-btn-container">
						<i id="close_modal_btn" class="fas fa-times"></i>
					</div>
					
					<div id="modal-content-container">
						<div class="swiper-container gallery-top">
							<div class="swiper-wrapper">
								<div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
							</div>
							
							<div class="swiper-button-next swiper-button-white"></div>
							<div class="swiper-button-prev swiper-button-white"></div>
						</div> 
						
						<div class="swiper-container gallery-thumbs">
							<div class="swiper-wrapper">
								<div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sinra.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/trump.jpeg)"></div>
					            <div class="swiper-slide" style="background-image:url(resources/images/sample_hotel.jpg)"></div>
							</div>
						</div>
					</div> 
				</div>
			</div>
		</div>
	</div>
	 --%>
	
</div>
</body>

	
<%--the script for swiper --%>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
	var galleryThumbs= new Swiper('.gallery-thumbs',{
		spaceBetween: 10, // swiper-wrapper안에 있는 swiper-slide의 개수를 의미합니다.
		slidesPerView: 4,  // 슬라이드에서 보여줄수 있는 섬네일개수
		loop: false,
		freeMode: true,
		loopedSlides: 5,
		watchSlidesVisibility: true,
		watchSlidesProgress: true,
	});
	
	var galleryTop= new Swiper('.gallery-top',{
		spaceBetween: 10,
		loop: false,
		loopedSlides: 5,
		navigation:{
			nextEl:'.swiper-button-next',
			prevEl:'.swiper-button-prev',
		},
		
		keyboard:{
			enabled: true,
		},
		
		thumbs:{
			swiper: galleryThumbs,
		}
	});
</script>


<%-- The script for modal... --%>
<%--
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
	
	$(function(){
		var $button=$('#photo_viewer_modal');
		var $modalContainer= $('#image-viewer-modal-container');
		var $body=$('body');
		var $content=$('.hotel-info-container:nth-child(3)');
		var $btnId;
		var $closeBtn=$('#close_modal_btn');

		
		// 버튼을 클릭하면 modal이 오픈!
		$button.on('click', function(){			
			$btnId= $(this).attr('id');
			
			// modalContainer에적용된 클래스들을 지우고
			// $btnId에 해당하는 클래스를 추가...
			$modalContainer
				.removeAttr('class')
				.addClass($btnId);
			
			$content
				.removeAttr('class')
				.addClass('content');
			
			//body를 modal-active 상태로 한다.
			$body.addClass('modal-active');

			$content.addClass($btnId);
			
		});
		
		
		$button.on('click',function(){
			var galleryThumbs= new Swiper('.gallery-thumbs',{
				spaceBetween: 10, // swiper-wrapper안에 있는 swiper-slide의 개수를 의미합니다.
				slidePerView: 3,  // 슬라이드에서 보여줄수 있는 섬네일개수
				loop: true,
				freeMode: true,
				loopedSlides: 5,
				watchSlidesVisibility: true,
				watchSlidesProgress: true,
			});
			
			var galleryTop= new Swiper('.gallery-top',{
				spaceBetween: 10,
				loop: true,
				loopedSlides: 5,
				navigation:{
					nextEl:'.swiper-button-next',
					prevEl:'.swiper-button-prev',
				},
				
				keyboard:{
					enabled: true,
				},
				
				thumbs:{
					swiper: galleryThumbs,
				}
			});
			
		});
		
		
		//닫기 버튼을 누르면 modal을 닫는다.
		$closeBtn.on('click', function(){
			$modalContainer.addClass('out');
			$body.removeClass('modal-active');
			if( $modalContainer.hasClass($btnId) ){
				$content.addClass('out');
			}
			
		});
		
	});	
</script>
  --%>




</html>