<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
	<title>전국방방곡곡</title>	
	<!--  home.css -->
    <link rel="stylesheet" href="resources/css/common/home.css">
</head>
<body>
		<!-- 메뉴바 -->
    	<c:import url="WEB-INF/views/common/menubar.jsp" />
    	<script>
		  	$(function(){
		  		//interceptor 접근시, 에러메시지 alert창을 띄운다.
		  		var msg='${msg}';
		  		if(msg!=''){
		  			swal({
		  				text:msg,
		  				icon:'error',
		  				button:true
		  			}).
		  			then((value)=>{
		  				window.location='${contextPath}';
		  			})
		  		}
		  	});
		</script>
    	<section>
    	<div id="slider-wrap">
             <ul id="slider">
                 <li>
                     <img src="resources/images/메인배너4.png">
                 </li>

                 <li>
                     <img src="resources/images/메인배너2.png">
                 </li>

                 <li>
                     <img src="resources/images/메인배너1.png">
                 </li>

                 <li>
                     <img src="resources/images/메인배너3.png">
                 </li>
             </ul>

             <div class="slider-btns" id="next"><span>▶</span></div>
             <div class="slider-btns" id="previous"><span>◀</span></div>

             <div id="slider-pagination-wrap">
                 <ul>
                 </ul>
             </div>
         </div>
         </section>

         <script>
         var height = window.innerHeight;
         $('#slider-wrap').css('height',height);
         
         var slideWrapper = document.getElementById('slider-wrap');
         // 현재 슬라이드 번호 
         var slideIndex = 0;
         var slides = document.querySelectorAll('#slider-wrap ul li');
         // 전체 슬라이드 갯수
         var totalSlides = slides.length;
         // 슬라이드 가로길이
         var sliderWidth = window.innerWidth;

         slides.forEach(function (element) {
             element.style.width = sliderWidth + 'px';
         });
         
         var slider = document.querySelector('#slider-wrap ul#slider');
         slider.style.width = sliderWidth * totalSlides + 'px';

         // next, prev
         var nextBtn = document.getElementById('next');
         var prevBtn = document.getElementById('previous');
         
         nextBtn.addEventListener('click', function () {
              plusSlides(1);
         });
         
         prevBtn.addEventListener('click', function () {
             plusSlides(-1);
         });

         // hover
         slideWrapper.addEventListener('mouseover', function () {
             this.classList.add('active');
             clearInterval(autoSlider);
         });
         
         slideWrapper.addEventListener('mouseleave', function () {
             this.classList.remove('active');
             autoSlider = setInterval(function () {
                  plusSlides(1);
             }, 3000);
         });


         function plusSlides(n) {
             showSlides(slideIndex += n);
         }

         function currentSlides(n) {
             showSlides(slideIndex = n);
         }

         function showSlides(n) {
             slideIndex = n;
             if (slideIndex == -1) {
                 slideIndex = totalSlides - 1;
             } else if (slideIndex === totalSlides) {
                 slideIndex = 0;
             }

             slider.style.left = -(sliderWidth * slideIndex) + 'px';
         }
         </script>    	        
</body>
</html>	    	
	    