<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 마이페이지</title>
   <!--  insert_2.css -->
      <link rel="stylesheet" href="resources/css/member/myPage_kakao_naver.css">  
      <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
    <section>   
        <!-- 마이페이지  -->
        <div id="space_1">
            <div id="info1"></div>
            <div id="info2"></div>
            <div id="info3">MYPAGE</div>
            <div></div>
            <div id="info4"></div>
            <div id="info5"><i class="far fa-address-card" id="myPageLogo"></i></div>
            <div id="info6">환영합니다 </div>
            <div id="info7">${ loginUser.nickName }</div>
            <div id="info8">고객님</div>
        </div>
        
        <!-- 메뉴  -->
        <div id="menu">
            <div id="menuSpace1"></div>
            <div id="menuSpace2"></div>
            <ul>
                <li class="m1" onclick="mypageHotel();" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-hotel" id="me1"></i>호텔 예약 정보</li>
                
                <li class="m1" onclick="mypageTravel();" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-suitcase-rolling" id="me1"></i>내가 담은 여행지</li>
                
                <li class="m1" onclick="mypageCourse();" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-camera-retro" id="me1"></i>나만의 여행코스</li>
                
                <li class="m1" onclick="memberOut();" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-user-slash" id="me1"></i>회원 탈퇴</li>
            </ul>
        </div> 
     </section>
     
     <script>
     function mypageHotel(){
    	 location.href="<%= request.getContextPath() %>/myPage.me";
     }
     
     function mypageTravel(){
    	 location.href="<%= request.getContextPath() %>/myPageTravel.me";
     }
     
     function mypageCourse(){
    	 location.href="<%= request.getContextPath() %>/myPageCourse.me";
     }
     
     function memberOut(){
    	 location.href="<%= request.getContextPath() %>/memberOutOther.me";
     }
     </script>
</body>
</html>