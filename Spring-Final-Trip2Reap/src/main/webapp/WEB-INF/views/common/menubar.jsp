<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡</title>

<!--  menubar.css -->
<link rel="stylesheet" href="resources/css/common/menubar.css">
<!-- swal코드 -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <!-- 메뉴바는 어느 페이지든 포함하고 있을 테니 여기서 contextPath 변수 값 만들기 -->
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
    
    <header>	    	    	    	    
	    <div id="header_wrapper">
	    	<!-- 로그아웃 상태 컨테이너 -->
	    	<c:if test="${ empty sessionScope.loginUser}">
	    		<div id="rootBar" style=" display:inline-block; width: 100vw; height: 30px;">
	                <ul>
	                    <li class="topBar" onclick="login();">로그인&nbsp;</li>
	                    <li class="topBar" onclick="join();">&nbsp;회원가입</li>
	                </ul>
	            </div>
	    	</c:if>
	    	
	    	
	    	<!-- 로그인 상태 컨테이너 -->
	    	<c:if test="${!empty sessionScope.loginUser }">
	    		<div style=" display:inline-block; width: 1100px; height: 30px;">
	                <ul>
	                    <li class="topBar">
	                        <b><c:out value="${ loginUser.memberName }님 환영합니다!" />&nbsp;&nbsp;</b>
	                    </li>
	                    <li class="topBar" onclick="logout();">로그아웃&nbsp;</li>
	                    <li class="topBar" onclick="myPage();">&nbsp;마이페이지</li>
	                </ul>
	            </div>
	    	</c:if>
	    </div>
	    
	
	    <!-- 메인로고 컨테이너 -->
	    <div id="logo-img-container">
	        <img src="resources/images/메인로고.JPG" id="main-logo-img" onclick="main();">        
	    </div>
	    
	    
	    <!-- 메뉴컨테이너 -->
	    	<div style="display: inline-block; width:258px; height : 50px;">
	        <div id="menus_wrapper">
		        <ul>
		            <li class="menu">
		            	<a>
		                	<img src="resources/images/여행지아이콘.png" style="width:140px;">
		            	</a>
		            </li>
		            <li class="menu">
		            	<a>
		                	<img src="resources/images/여행코스아이콘.png" style="width:140px;">
		            	</a>
		            </li>
		            <li class="menu">
		            	<a>
		            	   <img src="resources/images/여행후기아이콘.png" style="width:140px;">
		            	</a>
		         	</li>
		            <li class="menu">
		            	<a href="hotelList.ho">
		            		<img src="resources/images/호텔아이콘.png" style="width:140px;">
		            	</a>
		            </li>
		        </ul>
	       </div>
	       <div style="display: inline-block; width:258px; height : 50px;"></div>
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