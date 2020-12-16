<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 호텔 예약 정보</title>
      <!--  myPageHotel.css -->
      <link rel="stylesheet" href="resources/css/member/myPageHotel.css">
      <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
    <header>
    <%@ include file="../common/menubar.jsp" %>
    
    <c:if test="${ loginUser.mCategory eq 'member' }">    
    <%@ include file="../member/myPage.jsp" %>    
    </c:if>
    
    <c:if test="${ loginUser.mCategory ne 'member' }">    
    <%@ include file="../member/myPage_kakao_naver.jsp" %>    
    </c:if>
    </header>
    
    <section>
    <div id="board_list">
    <!-- 호텔 예약 정보 설명란  -->
        <div>
            <div id="infor1"></div>
            <div id="infor2"></div>
            <div id="infor3"><i class="fas fa-hotel" id="myHotelIcon"></i>호텔 예약 정보</div>            
        </div>
     </div>
     
     <div id="list_all_div">		
			<c:if test = "${ empty list }">
			<div id="list_empty_div">
			    <div id="up_space1"></div>
				<div id="emptyHotel">예약한 호텔이 없습니다</div>
				<div id="up_space1"></div>
				<button id="myHotelBtn">호텔 보러가기</button>
				<div id="up_space1"></div>
		    </div>
			</c:if>
			<c:forEach var="t" items="${ list }">
			
			<div id="list_hotel_div">			    
				<div id="hotel_img_div">
					<c:if test="${t.imageName != null }"> <!-- insert로 등록한 여행지 -->
					 <img src="resources/buploadFiles/${ t.imageName }" id="hotel_img" /> 
					</c:if>
					<c:url var="tdetail" value="hotelDetailView.ho">
						<c:param name="hId" value="${ t.boNo }"/>
						<c:param name="page" value="1"/>
					</c:url>
					<div id="hotel_r1"><a id="hotel_a" href="${ tdetail }">이용후기 작성하기</a></div>
					<div id="hotel_r2">|</div>
					<div id="hotel_r3">환불하기</div>
				</div>
				
				<div id="hotel_name_writer_div">
				    <input type="hidden" id="hId" name="hId" value="${ t.boNo }">						
					
					<div id="hotel_name">
						<a href="${ tdetail }">${ t.title }</a>	
					</div>
					<div class="hotelCheck">체크인  <label id="checkInLabel">/  ${t.checkIn}</label></div>
					<div class="hotelCheck">체크아웃 /   ${t.checkOut}</div>
				    
				    <div id="hotel_room">${t.roomName}</div>
				    <div id="hotel_price">₩ ${t.price}</div> 
				    <button id="detailReservation">자세히 보기</button>  
				</div>			
			</div>
			
			</c:forEach>
			
			<input type="hidden" id="hiddenId" value="${ loginUser.memberId }">
		</div>
     </section>
     
     <div style="height: 300px;"></div>
     
     <script>
          $('#myHotelBtn').click(function(){
   	         location.href="<%= request.getContextPath() %>/hotelList.ho";
          });
     </script>
</body>
</html>