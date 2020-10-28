<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>전국방방곡곡</title>
	
	<!--api bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	
<style>
       header { width: 100%; height: 300px; }
       section {
       	position: relative;	
       	/*  
       	position: absolute;
       	top:250px;
       	left:0px; 
       	*/
       }
       
       .carousel-item > img{
       		width: 100%;
       		height: 30em;
       }
</style>
</head>
<body>

	<div class="total_container">
		<!-- 메뉴바 -->
    	<header>
    		<c:import url="common/menubar.jsp" />   
    	</header>
    
    	<!--  메인배너 -->
	    <section>
	    	<!-- 각자 구현할 부분  -->
		     <div id="mainBannerCarousel" class="carousel slide carousel-fade" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="resources/images/메인배너1.JPG" class="d-block w-100" alt="메인배너1">
			    </div>
			    
			    <div class="carousel-item">
			      <img src="resources/images/메인배너2.JPG" class="d-block w-100" alt="메인배너2">
			    </div>
			  </div>	  
			</div>
	    </section>
	    
	    <!-- footer -->
	    <footer></footer>
    </div>
    </div>
</body>
</html>
