<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<!--api bootstrap -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
	
	<title>전국방방곡곡</title>
	
<style>
		.total_container{
			display: flex;
			flex-direction: column;
			justify-content: center;
			width: 100vw;
			height: 100vh;
			overflow-y: scroll;
		}

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
	    	<c:import url="WEB-INF/views/common/menubar.jsp" />
	    </header>
	    
	    <!--  메인배너 -->
	    <section>
	    	<!-- 각자 구현할 부분  -->
		    <!-- 
		    <img src="resources/images/메인배너1.JPG"  class="main_banner">
		    <div style="height: 1000px;"></div>
		     -->
		     <div id="mainBannerCarousel" class="carousel slide carousel-fade" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="resources/images/메인배너1.JPG" class="d-block w-100" alt="메인배너1">
			    </div>
			    
			    <div class="carousel-item">
			      <img src="resources/images/메인배너2.JPG" class="d-block w-100" alt="메인배너2">
			    </div>
			  </div>
			  
			  <!-- <a class="carousel-control-prev" href="#mainBannerCarousel" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  
			  <a class="carousel-control-next" href="#mainBannerCarousel" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a> -->
			</div>
	    </section>
	    
	    <!-- footer -->
	    <footer></footer>
    </div>
</body>
</html>