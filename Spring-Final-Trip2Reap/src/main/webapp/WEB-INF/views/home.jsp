<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>전국방방곡곡</title>
<style>
       header { width: 100vw; height: 300px; }
       section { position: absolute; top:250px; left:0px;}
       
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
	    	<img src="resources/images/메인배너1.JPG" style="width: 100%">
	    	<div style="height: 1000px;"></div>
	    </section>
	    
	    <!-- footer -->
	    <footer></footer>
    </div>
</body>
</html>
