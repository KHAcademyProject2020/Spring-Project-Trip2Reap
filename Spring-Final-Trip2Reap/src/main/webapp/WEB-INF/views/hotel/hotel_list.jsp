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
                    <li><button class="btn">인기순</button></li>
                    <li><button class="btn">가격순</button></li>
                    <li><button class="btn">등급순</button></li>
                </ul>
            </div>
        </div>

        <div id="hotel-list-container">
			
			
			<%-- list가 2개이상일때  --%>
			<%--<c:forEach var="hotel" items="${hotelList}" varStatus="status"> --%>
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
<<<<<<< HEAD
<<<<<<< HEAD
			                    		<small class="hotel-rank">
			                    			<c:if test="${hotelList.get(status.index).hotelRank eq 0 }">
			                    				등급 없음
			                    			</c:if>
			                    			<c:if test="${hotelList.get(status.index).hotelRank ne 0 }">
			                    				${hotelList.get(status.index).hotelRank } 등급 
			                    			</c:if>
			                    		</small>
=======
			                    		<small class="hotel-rank">${hotel.hotelRank }</small>등급 
>>>>>>> ed5d9a8ee33607f613a1ea8a2ff250bb1d1b2b06
=======
			                    		<small class="hotel-rank">${hotel.hotelRank }</small>등급 
>>>>>>> ed5d9a8ee33607f613a1ea8a2ff250bb1d1b2b06
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
        </div>
        <!--호텔리스트 끝  -->
		<script>
		$(function(){
			//예약하기 버튼을 누르면=> 디테일뷰로 이동.
			$('button.hotel-reserve-btn').click(function(){
				var hId = $(this).closest('.one-hotel-info-container').find('.hotelNO').val();
				//console.log(bId);
				//디테일뷰로 들어간다.
				location.href="hotelDetailView.ho?hId="+hId+ "&page="+${pi.currentPage};
			});
			
			/* 
			//방가격 나타내기
			$('b.min_room_price').each(function(){
		    	let priceTxt=$(this).text();
		    	$(this).text(priceTxt.replace(/\B(?=(\d{3})+(?!\d))/g,','));
			}); 
			*/
		});
		</script>

        <!-- 호텔페이지네이션 시작 -->
        <div id="pagination-container">
        	<nav>
                <ul id="pagination-ul">
					
                    
					<!-- [1] 이전페이지 -->
					<%--현재페이지가 맨 앞페이지라면 --%>
					<c:if test="${pi.currentPage<=1 }">
						<li><a>&lt;&lt;</a></li>
						<li><a>&lt;</a>
					</c:if>
					
					<%--현재페이지가 맨앞페이지가 아니라면 --%>
					<c:if test="${pi.currentPage>1 }">
						<c:url var="firstPage" value="hotelList.bo">
							<param name="page" value="${pi.startPage }">
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
                                    <option value="0">지역선택</option>
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
                                    <option value="">등급 선택</option>
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
                                <select class="detail-search-option" name="price-per-day" id="price-per-day">
                                    <option value="">가격 선택</option>
                                    <option value="5만원 미만">5만원 미만</option>
                                    <option value="10만원 미만">5만원 이상 ~ 10만원 미만</option>
                                    <option value="15만원 미만">10만원 이상 ~ 15만원 미만</option>
                                    <option value="20만원 미만">15만원 이상 ~ 20만원 미만</option>
                                    <option value="20만원 이상">20만원 이상</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5>호텔이름</h5>
                            </td>
                            <td>
                                <input class="detail-search-option" name="hotel-name" id="hotel-name" type="text">
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



// modal
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
        
}); //modal- wrapper finished

 

	
    
    

</script>


</html>