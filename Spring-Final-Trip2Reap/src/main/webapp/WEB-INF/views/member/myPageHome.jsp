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
        <div id="up_space1"></div>
     </div>
     </section>
     
     <div style="height: 300px;"></div>
</body>
</html>