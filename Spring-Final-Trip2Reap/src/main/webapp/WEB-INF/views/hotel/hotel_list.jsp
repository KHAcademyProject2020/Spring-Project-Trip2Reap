<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/hotel/hotel_list.css">

    <!-- font-awesome -->
    <script src="https://kit.fontawesome.com/09697e2134.js" crossorigin="anonymous"></script>


    <title>호텔 페이지</title>

</head>


<body>
	<div>
   	 	<c:import url="../common/menubar.jsp" />
	</div>

    <div id="main-container">
        <div id="title-container">
            <!-- <img id="hotel-icon" src="resources/images/hotelIcon.png"> -->
            <i class="fas fa-hotel" id="hotel-icon"></i>
            <span id="title-name">호텔 예약</span>

        </div>

        <div id="button-container">
            <div id="left_btns_container">
                <ul id="left_btns" class="btn_ul">
                	<!-- 호텔등록은 관리자 회원만 가능하다! / 관리자인지 확인하는 방법을 모색해보자. -->

                    <c:if test="${loginUser.memberId=='admin' }">
                    	<li><button id="insert-hotel" class="btn" onclick="location.href='hotelInsertView.ho'">호텔 등록하기</button></li>
                    </c:if>
                    <li><button id="detail-search" class="btn">상세검색</button></li>
                </ul>

            </div>

            <div></div>

            <div id="right_btns_container">
                <ul id="right_btns" class="btn_ul">
                    <li><button id="populuarity" class="btn">인기순</button></li>
                    <li>
                    	<button  id="price_order_direction_btn" class="btn">가격순</button>
                    	<div id="price_order_direction_container" class="closed">
                    		<ul id="price_order_direction_wrapper">
                    			<li id="price_high">가격&nbsp;<span style="color:red;">높은순</span></li>
                    			<li id="price_row">가격&nbsp;<span style="color: blue;">낮은순</span></li>
                    		</ul>
                    	</div>
                    </li>
                    <li><button id="rank_high" class="btn">등급순</button></li>
                </ul>
            </div>
        </div>

        <div id="hotel-list-container">
			<%--호텔검색결과가 존재하지 않을 때!--%>
			<c:if test="${empty hotelList }">
				<p>호텔이 존재하지 않습니다!</p>
			</c:if>

			<%-- list가 2개이상일때  --%>
			<%--<c:forEach var="hotel" items="${hotelList}" varStatus="status"> --%>
			<c:if test="${!empty hotelList}">
				<c:forEach var="i" begin="0" end="${fn:length(hotelList)-1}" varStatus="status">
					<div class="one-hotel-info-container">
	
		                <img src="resources/images/sample_hotel.jpg" alt="호텔이미지">
	
		                <div class="detail-info-container">
		                    <div>
		                        <div class="info-container">
		                            <!-- 호텔이름 -->
		                            <div class="hotel-name-container">
		                            	<%--호텔번호 --%>
		                            	<input class="hotelNO" type="hidden" value="${hotelList.get(status.index).boNo}"/>
	
		                                <h1>${hotelList.get(status.index).boTitle }</h1>
		                                <div class="hotel-rank-wrapper">
	
	    			                    		<small class="hotel-rank">
	    			                    			<c:if test="${hotelList.get(status.index).hotelRank eq 0 }">
	    			                    				등급 없음
	    			                    			</c:if>
	    			                    			<c:if test="${hotelList.get(status.index).hotelRank ne 0 }">
	    			                    				${hotelList.get(status.index).hotelRank } 등급
	    			                    			</c:if>
	    			                    		</small>
	
				                    	</div>
		                            </div>
	
		                            <!-- 좋아요 버튼 -->
		                            <div class="i-like-btn-container">
		                            	<c:if test="${likeHotelList.get(status.index)==0}">
		                                	<i class="fas fa-heart unlike"></i>
		                            	</c:if>
	
		                            	<%--이미 좋아요를 눌렀다면? --%>
		                            	<c:if test="${ likeHotelList.get(status.index)>0}">
		                                	<i class="fas fa-heart like"></i>
		                            	</c:if>
	
	
		                            </div>
		                        </div>
	
		                    </div>
	
	
		                    <div class="detail-info-wrapper">
		                        <!-- 호텔주소 -->
		                        <div class="hotel-addr-wrapper">
		                            <small>${hotelList.get(status.index).hotelAddr}</small>
		                        </div>
	
	
		                        <div class="hotel-info-wrapper">
		                            <!-- 별점 -->
		                            <div class="hotel-review-container">
		                                <span class="star-point">
		                                    <i class="fas fa-star"></i>
		                                </span>
		                                <span> ${hotelList.get(status.index).hotelReviewScore}</span>/5.0
		                            </div>
	
	
		                            <!-- 1박 가격 -->
		                            <div class="hotel-per-day-price-container info-container">
		                                <p>
		                                    <small>1박</small>&nbsp;&nbsp;
		                                    <b class="min_room_price">
		                                    	<fmt:formatNumber value="${minRoomPricePerDayList.get(status.current)}" type="number"/>
		                                    </b>
		                                    &nbsp;원
		                                </p>
		                            </div>
		                        </div>
		                    </div>
	
		                    <button class="hotel-reserve-btn">예약하기</button>
		                </div>
		            </div>
				</c:forEach>
			</c:if>
        </div>
        <!--호텔리스트 끝  -->

        <!-- 호텔페이지네이션 시작 -->
        <div id="pagination-container">
        	<nav>
                <ul id="pagination-ul">


					<!-- [1] 이전페이지 -->
					<%--현재페이지가 맨 앞페이지라면 --%>
					<c:if test="${pi.currentPage<=1 }">
						<li><a>&lt;&lt;</a></li>
						<li><a>&lt;</a></li>
					</c:if>

					<%--현재페이지가 맨앞페이지가 아니라면 --%>
					<c:if test="${pi.currentPage>1 }">
						<c:url var="firstPage" value="hotelList.bo">
							<c:param name="page" value="${pi.startPage }"/>
						</c:url>
						<li style="cursor:pointer;"><a href="${firstPage }">&lt;&lt;</a></li>

						<c:url var="before" value="hotelList.bo">
							<c:param name="page" value="${pi.currentPage-1 }"/>
						</c:url>
						<li style="cursor:pointer;"><a href="${before }">&lt;</a></li>

					</c:if>


                    <!-- [2]페이지번호 -->
                    <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
                    	<%-- p가 현재페이지와 같다면 --%>
                    	<c:if test="${p eq pi.currentPage }">
                    		<li  style="background-color: var(--blue-gray);">
                    			<a style="font-weight:bold; ">${p}</a>
                    		</li>
                    	</c:if>

                    	<%--p가 현재페이지와 다르다면.. --%>
                    	<c:if test="${p ne pi.currentPage }">
                    		<c:url var="pagination" value="hotelList.ho">
                    			<c:param name="page" value="${p }"/>
                    		</c:url>

                    		<li style="cursor:pointer;">
                    			<a href="${pagination }">${p }</a>
                    		</li>
                    	</c:if>
                    </c:forEach>


                    <!-- [3]이후페이지 -->
                    <%--
                    <li><a href="">&gt;</a></li>
                     --%>
                    <%--현재페이지가 maxPage보다 더 크면..(다음페이지가 존재하지 않음) --%>
                    <c:if test="${pi.currentPage>=pi.maxPage }">
                    	<li><a>&gt;</a></li>
                    	<li><a>&gt;&gt;</a>
                    </c:if>

                    <%--현재페이지가 maxPage보다 작으면.. (다음페이지가 존재)--%>
                    <c:if test="${pi.currentPage< pi.maxPage }">

                    	<!-- 다음페이지 -->
                    	<c:url var="after" value="hotelList.bo">
                    		<c:param name="page" value="${pi.currentPage+1 }"/>
                    	</c:url>
                    	<li style="cursor:pointer;"><a href="${after }">&gt;</a></li>

                    	<!-- 마지막 페이지 -->
                    	<c:url var="lastPage" value="hotelList.bo">
	                    	<c:param name="page" value="${pi.endPage }"/>
	                    </c:url>
	                    <li style="cursor:pointer;"><a href="${lastPage }">&gt;&gt;</a></li>
                    </c:if>

                </ul>
            </nav>
        </div>
        <!-- 호텔페이지네이션 끝 -->
    </div>


    <!-- modal-->
    <div id="modal-container">
        <div id="modal-background" class="modal-background">
            <div class="modal">

                <div class="close-modal-container">
                    <div></div>
                    <div>
                        <i id="close_btn" class="fas fa-times"></i>
                    </div>
                </div>

                <div class="modal-title-container">
                    <h2>상세검색</h2>
                </div>

                <div class="modal-body-container">
                    <table >
                        <tr colspan=3>
                            <td>
                                <h5>지역검색</h5>
                            </td>
                            <td>
                                <select class="detail-search-option" name="place" id="place">
                                    <option value="0" selected>지역선택</option>
                                    <option value="1">강원도</option>
                                    <option value="2">경기도</option>
                                    <option value="3">경상남도</option>
                                    <option value="4">경상북도</option>
                                    <option value="5">광주광역시</option>
                                    <option value="6">대구광역시</option>
                                    <option value="7">대전광역시</option>
                                    <option value="8">부산광역시</option>
                                    <option value="9">서울특별시</option>
                                    <option value="10">세종특별자치시</option>
                                    <option value="11">인천광역시</option>
                                    <option value="12">울산광역시</option>
                                    <option value="13">전라남도</option>
                                    <option value="14">전라북도</option>
                                    <option value="15">제주특별자치도</option>
                                    <option value="16">충청남도</option>
                                    <option value="17">충청북도</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <h5>호텔등급</h5>
                            </td>
                            <td>
                                <select class="detail-search-option" name="rank" id="rank">
                                    <option value="0" selected>등급 선택</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <h5>가격대 </h5>
                            </td>
                            <td>
                                <select class="detail-search-option" name="price-per-day" id="price-per-day" >
                                    <option value="0" selected>가격 선택</option>
                                    <option value="1">5만원 미만</option>
                                    <option value="2">5만원 이상 ~ 10만원 미만</option>
                                    <option value="3">10만원 이상 ~ 15만원 미만</option>
                                    <option value="4">15만원 이상 ~ 20만원 미만</option>
                                    <option value="5">20만원 이상</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5>호텔이름</h5>
                            </td>
                            <td>
                                <input class="detail-search-option" name="hotel-name" id="hotel-name" type="text" autocomplete="off">
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="modal-btn-container">
                    <button id="detail-hotel-search">호텔 검색</button>
                </div>

            </div>
        </div>
    </div>
    <!-- modal끝 -->





</body>
<script>

//modal
$(function(){
        var $detailSearchBtn=$('#detail-search'),
        $modalContainer = $('#modal-container'),
        $body = $('body'),
        $content= $('#main-container'),
        $closeBtn= $('#close_btn'),
        $btnId;

        // 상세검색 버튼을 클릭.
        $detailSearchBtn.on('click', function(){
            //버튼아이디를 불러옵니다.
            $btnId= $(this).attr('id'); //detail-search

            //modal-container에 기존 클래스들을 빼놓고, btnId클래스를 적용합니다.
            $modalContainer
                .removeAttr('class')
                .addClass($btnId);

            $content
                .removeAttr('class')
                .addClass('content');

            $body.addClass('modal-active'); //body에 modal-active라는 클래스를 적용.

            $content.addClass($btnId);
        });

        //닫기버튼(x 표시 아이콘) 클릭시
        $closeBtn.on('click', function(){
            $modalContainer.addClass('out');
            $body.removeClass('modal-active'); //modal-active 클래스 해제

            if($modalContainer.hasClass($btnId)){
                $content.addClass('out');
            }
        });
        
      //2020.12.01
      //동적쿼리문을 이용하여 모달의 상세검색 조건을 만족하는 검색결과를 찾아보자
        $('#detail-hotel-search').click(function(){
        	console.log('어머나~ 호텔상세검색 버튼을 클릭하셨군요?');
        	//검색조건 출력하기
        	//호텔검색 지역코드
        	let $search_hotel_local_code= Number($('#place > option:selected').val());
        	
        	//호텔검색 호텔등급
        	let $search_hotel_rank= Number($('#rank > option:selected').val());
        	
        	//호텔검색 1일 이용가격(종류)
        	/*
        		1일가격 번호		가격범위
        		1				5만원 미만
        		2				5만원 이상 ~ 10만원 미만
        		3				10만원 이상 ~ 15만원 미만
        		4				15만원 이상 ~ 20만원 미만
        		5				20만원 초과
        	*/
        	let $search_hotel_price_per_day_type= Number($('#price-per-day > option:selected').val());
        	
        	//호텔검색 호텔이름 (빈공간제거)
        	let $search_hotel_name= $('#hotel-name').val().trim();
        	
        	
        	console.log('호텔지역코드 => ' + $search_hotel_local_code);
        	console.log('호텔등급 => ' + $search_hotel_rank);
        	console.log('호텔 1일 이용가격 => '+ $search_hotel_price_per_day_type);
        	console.log('호텔이름 => '+ $search_hotel_name);
        	
        	//검색조건에 맞는 호텔 리스트를 구한다.
        	$.ajax({
        		url: 'detailSearchResult.ho',
        		data:{
        			searchLocalCode: $search_hotel_local_code,	//지역코드번호
        			searchHotelRank: $search_hotel_rank,		//호텔등급
        			searchPricePerDayType: $search_hotel_price_per_day_type, //1일이용금액 종류
        			searchHotelName: $search_hotel_name
        		},
        		success: function(data){
        			
        			let $hotelListContainer= $('#hotel-list-container'); //호텔 검색결과를 나타내는 호텔컨테이너
        			let $hotelPaginationContainer=$('#pagination-container'); //페이징을 나타내는 페이징컨테이너
        			
        			$hotelListContainer.empty(); //호텔검색결과를 나타내 컨테이너를 비운다.
        			$hotelPaginationContainer.empty(); //페이징 컨테이너 내부내용을 비운다.
        			
        			//출력
        			console.log(data.pi);
        			console.log(data.hotelList);
        			console.log(data.likeHotelList);
        			console.log(data.minRoomPricePerDayList);
        			
        			
        			
        			
        			
        			
        			
        		}
        		
        	});
        	
        	//모달창을 나간다.
    		$modalContainer.addClass('out');
    		$body.removeClass('modal-active');
    		if($modalContainer.hasClass($btnId)){
    			$content.addClass('out');
    		}
    	});
      
      
      // 페이징처리 
      function page(){
    	  
      }

}); //modal- wrapper finished


$(function(){
	
	//가격순 버튼 클릭
	$('#price_order_direction_btn').click(function(){
		let $priceContainer= $('#price_order_direction_container');
		if($priceContainer.hasClass('closed')){
			$priceContainer.removeClass('closed');
			$priceContainer.addClass('opened');
			$priceContainer.css('display', 'flex');
		}else if($priceContainer.hasClass('opened')){
			$priceContainer.removeClass('opened');
			$priceContainer.addClass('closed');
			$priceContainer.css('display', 'none');
		}
		
	});

	
	//가격 높은 순(내림차순) 버튼 클릭시
	$('#price_high').click(function(){
		console.log('가격 높은순 버튼 클릭됨');
	});
	
	
	//가격 낮은 순(오름차순) 버튼 클릭시
	$('#price_low').click(function(){
		console.log('가격 낮은순 버튼 클릭됨');
	});
	
	//등급순(내림차순) 버튼 클릭시
	$(document).on('click','#rank_high', function(){
		console.log('등급순 버튼 클릭됨');
		$.ajax({
			url:'rankSearchHotel.ho',
			processData:false,
			success:function(data){
				let hotelContainer=$('#hotel-list-container');
				let pageContainer=$('#pagination-container');
				let priceRegularExpression= /\B(?=(\d{3})+(?!\d))/g;
				//기존코드를 비운다.
				hotelContainer.empty();
				pageContainer.empty();
				
				//1. 호텔결과
				let $hotelCode='';
				if(data.hotelList ==null){
					console.log('호텔이 존재하지 않습니다!!');
					$hotelCode+='<p>호텔이 존재하지 않습니다!</p>'
						
				}else{
					console.log(data.hotelList.length)
					console.log(data.likeHotelList.length);
					console.log(data.minRoomPricePerDayList.length);
					console.log(typeof(data.minRoomPricePerDayList[0])) //number
					
					for(var i=0; i<data.hotelList.length; i++){
						let hotel= data.hotelList[i];
						let like= data.likeHotelList[i];
						let minPriceOrigin= data.minRoomPricePerDayList[i]+'';
						
						let minPrice=minPriceOrigin.replace(priceRegularExpression,',');
						
						$hotelCode+='<div class="one-hotel-info-container">';
						$hotelCode+='<img src="resources/images/sample_hotel.jpg" alt="호텔이미지">'; //이미지
						$hotelCode+='<div class="detail-info-container">';
						$hotelCode+='<div>';
						$hotelCode+='<div class="info-container">'
						$hotelCode+='<div class="hotel-name-container">';
						$hotelCode+='<input class="hotelNo" type="hidden" value="'+hotel.boNo+'"/>' //호텔번호
						$hotelCode+='<h1>'+hotel.boTitle+'</h1>'; //호텔이름
						$hotelCode+='<div class="hotel-rank-wrapper">';
						$hotelCode+='<small class="hotel-rank">';
						//등급이 존재하지 않는다면
						if(hotel.hotelRank==0){
							$hotelCode+='등급없음';
						}else{
							$hotelCode+= hotel.hotelRank+' 등급';
						}
						$hotelCode+='</small>';
						$hotelCode+='</div>';
						$hotelCode+='</div>';
						
						
						$hotelCode+='<div class="i-like-btn-container">';
						//좋아요버튼클릭여부
						if(like==0){
							$hotelCode+='<i class="fas fa-heart unlike"></i>'
								
						}else{
							$hotelCode+='<i class="fas fa-heart like"></i>'
								
						}
						$hotelCode+='</div>'
						$hotelCode+='</div>'
						$hotelCode+='</div>'
							
						$hotelCode+='<div class="detail-info-wrapper">';
						$hotelCode+='<div class="hotel-addr-wrapper">'
						$hotelCode+='<small>'+hotel.hotelAddr+'</small>' //호텔주소
						$hotelCode+='</div>'
						
						$hotelCode+='<div class="hotel-info-wrapper">'
						$hotelCode+='<div class="hotel-review-container">'
						$hotelCode+='<span class="star-point">'
						$hotelCode+='<i class="fas fa-star"></i>';
						$hotelCode+='</span>';
						$hotelCode+='<span>'+hotel.hotelReviewScore.toFixed(1)+'</span>/5.0'; //호텔평점
						$hotelCode+='</div>';
						
						$hotelCode+='<div class="hotel-per-day-price-container" info-container>'
						$hotelCode+='<p>'
						$hotelCode+='<small>1박</small>&nbsp;&nbsp;'
						$hotelCode+='<b class="min_room_price">'
						$hotelCode+=minPrice //호텔방최저가
						$hotelCode+='</b>&nbsp;원</p></div></div></div>'
						$hotelCode+='<button class="hotel-reserve-btn">예약하기</button></div></div>'
						
					}
				}
				
				
				let pi= data.pi;
				let $pageCode='';
				$pageCode+='<nav>'
				$pageCode+='<ul id="pagination-ul">'
				
				
				//이전페이징 표시
				if(pi.currentPage<=1){
					$pageCode+='<li><a>&lt;&lt;</a></li>';
					$pageCode+='<li><a>&lt;</a></li>'
				}else{
					//pi.currentPage>1
					$pageCode+='<c:url var="firstPage" value="rankSearchHotel.ho">'
					$pageCode+='<c:param name="page" value="${'+pi.startPage+'}"/>'
					$pageCode+='</c:url>'
					$pageCode+='<li style="cursor:pointer;"><a href="${firstPage}">&lt;&lt;</a></li>'
					
					$pageCode+='<c:url var="before" value="rankSearchHotel.ho">'
					$pageCode+='<c:param name="page" value="${'+pi.currentPage-1+'}"/>'
					$pageCode+='</c:url>'
					$pageCode+='<li style="cursor:pointer;"><a href="${before}">&lt;</a></li>';
				}
				
				
				//페이지 번호 표시
				for(var i=pi.startPage; i<=pi.endPage; i++){
					if(i==pi.currentPage ){
						$pageCode+='<li style="background-color: var(--blue-gray);">';
						$pageCode+='<a style="font-weight:bold;">'+i+'</a>';
						$pageCode+='</li>'
					}else{
						$pageCode+='<c:url var="pagination" value="rankSearchHotel.ho">'
						$pageCode+='<c:param name="page" value="${'+i+'}"/>'
						$pageCode+='</c:url>'
						$pageCode+='<li style="cursor:pointer;">';
						$pageCode+='<a href="${pagination}">'+i+'</a></li>'
					}	
				}
				
				
				//다음페이징 표시
				if(pi.currentPage>=pi.maxPage){
					$pageCode+='<li><a>&gt;</a></li>';
					$pageCode+='<li><a>&gt;&gt;</a></li>';
				}else{
					$pageCode+='<c:url var="after" value="rankSearchHotel.ho">'
					$pageCode+='<c:param name="page" value="${'+pi.currentPage+1+'}"/>'
					$pageCode+='</c:url>'
					$pageCode+='<li style="cursor:pointer;"><a href="${after}">&gt;</a></li>'
					
					$pageCode+='<c:url var="lastPage" value="rankSearchHotel.ho">'
					$pageCode+='<c:param name="page" value="${'+pi.endPage+'}"/>'
					$pageCode+='</c:url>'
					$pageCode+='<li style="cursor:pointer;"><a href="${lastPage}">&gt;&gt;</a></li>'
				}
				
				
				$pageCode+='</ul>'
				$pageCode+='</nav>'
				
				//코드를 넣는다.
				hotelContainer.html($hotelCode);
				pageContainer.html($pageCode);
			}
		})
	});
	
	//인기순(내림차순) 버튼 클릭시
	$('#popularity').click(function(){
		console.log('인기순 버튼 클릭됨');
		$.ajax({
			url:'popularSearchHotel.ho',
			success:function(response){
				
			}
		})
	});
	
	
	//예약하기 버튼 클릭
	//예약하기 버튼을 누르면=> 디테일뷰로 이동.
	$('button.hotel-reserve-btn').click(function(){
		var hId = $(this).closest('.one-hotel-info-container').find('.hotelNO').val();
		//console.log(bId);
		//디테일뷰로 들어간다.
		location.href="hotelDetailView.ho?hId="+hId+ "&page="+${pi.currentPage};
	});
	
	
});


//heart -btn
$(function(){
	$(document).on('click', '.fa-heart' , function(e){
		let targetHeartBtn= $(this);
		let loginUserObj='${loginUser}';

		//좋아요 선택한 호텔번호를 구한다.
		let likeHotelNo= Number(targetHeartBtn.closest('div.one-hotel-info-container').find('.hotelNO').val());

		console.log('어머 좋아요를 누르셨군요?');

		if(loginUserObj){
			//로그인 상태

			let tmp=targetHeartBtn.hasClass('unlike');
			console.log(tmp);

			//unlike 라는 이름의 클래스를 가지고있다. : unlike->클릭->like
			if( targetHeartBtn.hasClass('unlike') ){
				$(this).removeClass('unlike');
				$(this).addClass('like');

				$.ajax({
					url:'updateLikeHotel.ho',
					data:{
						hId:likeHotelNo
					},
					type:'post',
					success:function(){
						//좋아요누르면, 해당아이디에 좋아요표시를 한다.
						$(this).removeClass('unlike');
						$(this).addClass('like');

						//좋아요 반영되었습니다!
						swal({
							  title: "좋아요 반영 성공",
							  text: "성공적으로 좋아요를 반영했습니다.",
							  icon: "success",
							  button: "확인",
						});
					}
				});


			}else if(targetHeartBtn.hasClass('like')){//like->클릭->unlike
				$(this).removeClass('like');
				$(this).addClass('unlike');

				$.ajax({
					url:'updateCancelLikeHotel.ho',
					data:{
						hId:likeHotelNo
					},
					type:'post',
					success:function(){
						//좋아요누르면, 해당아이디에 좋아요표시를 한다.
						$(this).removeClass('unlike');
						$(this).addClass('like');

						swal({
							  title: "좋아요 해제 성공!",
							  text: "성공적으로 좋아요 해제를 반영했습니다.",
							  icon: "success",
							  button: "확인",
						});
					}
				});


			}


		}else{
			//로그아웃상태
			console.log('로그아웃 상태입니다.');
			swal({
				  title: "좋아요 반영 실패",
				  text: "로그인을 하신 후에 이용해주세요.",
				  icon: "error",
				  button: "확인",
			});
		}

	});
/*
	let heart_btns= document.querySelectorAll('.fa-heart');
	heart_btns.forEach(function(heart_btn){
		heart_btn.onclick=function(){
			//unlike 라는 이름의 클래스를 가지고있다.
			if( heart_btn.classList.contains('unlike') ){
				console.log('좋아요!');
				this.classList.toggle('like');
				this.classList.remove('unlike');

				//ajax요청해서 해당 호텔 좋아요 수 +1카운트...^^;
				//그런데 일단은 로그인을 한 상태에만 가능하다는것 !!

			}else if(heart_btn.classList.contains('like')){
				console.log('좋아요 해제');

				this.classList.toggle('unlike');
				//this.classList.remove('like');
			}
		}
	});
*/


}); //smash-heart-btn wrapper finised




//은강><

</script>
</html>
