<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
   <!--  insert_2.css -->
      <link rel="stylesheet" href="resources/css/member/myPage.css">  
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
            <div id="info7">${ loginUser.memberName }</div>
            <div id="info8">고객님</div>
        </div>
        
        <!-- 메뉴  -->
        <div id="menu">
            <div id="menuSpace1"></div>
            <div id="menuSpace2"></div>
            <ul>             
                <li class="m1" onclick="mypageHotel();" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-hotel" id="me1"></i>호텔예약 내역</li>
                
                <li class="m1" id="updateMember" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-user-edit" id="me1"></i>개인정보 수정</li>
                
                <li class="m1" onclick="mypageTravel();" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-suitcase-rolling" id="me1"></i>내가담은여행지</li>
                
                <li class="m1" onclick="mypageCourse();" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-camera-retro" id="me1"></i>나만의 여행코스</li>
                
                <li class="m1" onclick="memberOut();" onMouseOver="this.style.color='#123478';" onMouseOut="this.style.color=''">
                <i class="fas fa-user-slash" id="me1"></i>회원탈퇴</li>
            </ul>
        </div>
        <form action="myPageUpdate.me" method="post" id="updateMemberView">
            <input type="hidden" value="${ loginUser.memberId }" id="hiddenId" name="hiddenId"> 
        </form>
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
    	 location.href="<%= request.getContextPath() %>/memberOut.me";
     }
     
     $("#updateMember").click(function(){
    	 $('#updateMemberView').submit(); 	 
     });
     </script>
</body>
</html>