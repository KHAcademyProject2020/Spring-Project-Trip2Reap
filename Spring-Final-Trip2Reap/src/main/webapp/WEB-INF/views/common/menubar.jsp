<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡</title>

<!--  menubar.css -->
<link rel="stylesheet" href="resources/css/common/menubar.css">
<!-- swal코드 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <i>태그 사용 코드 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<!-- jQuery코드 -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPath 변수 값 만들기 -->
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<header>
		<!-- 상단바  -->
		<div id="rootBar">
			<c:if test="${ empty sessionScope.loginUser}">
				<div id="root_1"></div>
				<div id="root_2">
					<ul>
						<!-- 로그아웃 상태 -->
						<li class="topBar" onclick="login();"
							onMouseOver="this.style.color='#77af82';"
							onMouseOut="this.style.color=''">로그인</li>
						<li class="topBar" onclick="join();"
							onMouseOver="this.style.color='#77af82';"
							onMouseOut="this.style.color=''">회원가입</li>
					</ul>
				</div>
			</c:if>
			<c:if test="${ !empty sessionScope.loginUser }">
				<div id="root_3"></div>
				<div id="root_4">
					<ul>
						<!-- 로그인 상태  -->
						<li class="topBar2_1"><b><c:out
									value="${ loginUser.memberName }님 환영합니다!" /></b></li>
						<li class="topBar2_2" onclick="logout();"
							onMouseOver="this.style.color='#77af82';"
							onMouseOut="this.style.color=''">로그아웃</li>
						<li class="topBar2_2" onclick="myPage();"
							onMouseOver="this.style.color='#77af82';"
							onMouseOut="this.style.color=''">마이페이지</li>
					</ul>
				</div>
			</c:if>
		</div>

		<!--     메인로고 
    <div id="mainDiv">
        <img src="resources/images/메인로고.JPG" id="mainLogo" onclick="main();">        
    </div> -->

		<!-- 메뉴(여행지, 여행코스, 여행후기, 호텔) -->
		<div id="menu_1">
			<div id="menu_2"></div>
			<div id="space1"></div>
			<div id="menu_3"><img src="resources/images/메인로고.JPG" id="mainLogo" onclick="main();"> </div>
			<div id="space2"></div>
			<div id="menu_4">
				<ul>
					<li class="menu"><a href="tList.tv"> 
					<!-- <i class="fas fa-suitcase-rolling" id="menuIcon1"></i> -->
					<img src="resources/images/travelIcon.png" style="width : 40px;">
							<label
							class="menuLabel">여행지</label>
					</a></li>
					<li class="menu"><a href="courseList.co"> 
					<!-- <i class="fas fa-map-signs" id="menuIcon2"></i> -->
					<img src="resources/images/courseIcon.png" style="width : 40px;">
							<label class="menuLabel">여행코스</label>
					</a></li>
					<li class="menu"><a href="reviewList.bo"> 
					<!-- <i class="fas fa-camera-retro" id="menuIcon3"></i> -->
					<img src="resources/images/reviewIcon.png" style="width : 40px;">
							<label class="menuLabel">여행후기</label>
					</a></li>
					<li class="menu"><a href="hotelList.ho"> 
					<!-- <i class="fas fa-hotel" id="menuIcon4"></i> -->
					<img src="resources/images/hotelIcon.png" style="width : 40px;">
					<label class="menuLabel">호텔</label></a></li>
				</ul>
			</div>
			<div id="space3"></div>
			<div id="menu_4"></div>
		</div>
	</header>

	<script>
    function main(){
  	  location.href="<%= request.getContextPath() %>/home.do";
    }       
    
    function login(){
  	  location.href="<%= request.getContextPath() %>/login.me";
    }
    
    function join(){
      location.href="<%= request.getContextPath() %>/join.me";
    }
    
    function logout(){    	
      location.href="<%= request.getContextPath() %>/logout.me";
    }
      
    function myPage(){
      location.href="<%= request.getContextPath() %>/myPage.me";
    }
    
    </script>

</body>
</html>