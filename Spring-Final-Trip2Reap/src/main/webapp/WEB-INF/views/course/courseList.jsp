<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/course/courseList.css"/>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&display=swap" rel="stylesheet">
</head>
<body>	
	<header>
   	 <c:import url="../common/menubar.jsp" />
	</header>
	
	<section>
	    <div id="coSpace1"></div>
		<div id="coMain">
		     <div>
		         <div id="coSpace2"></div>
		         <div id="coSpace3"></div>
		         <label id="coLabel1">여행만렙! 사용자가 직접 만든</label>
		         <label id="coLabel2">여행코스</label>
		         <div id="makeCourse" onclick="insertView();">
		            <label id="makeLabel1">나만의 여행지 만들기</label>
		            <label id="makeLabel2">></label>
		         </div>
		     </div>
		     
		     <div>		          
		          <div id="coSpace4"></div>
		          <div id="coSpace3"></div>
		          <div class="coSelect" id="coSelect1">
		              <div><img src="resources/images/family.png" id="coIcon1"></div>    
		              <label class="commonLabel">가족 코스</label>
		          </div>
		          <div id="coSpace5"></div>
		          
		          <div class="coSelect" id="coSelect2">
		              <div id="coSpace8"></div>
		              <i class="fas fa-walking" id="coIcon2"></i>
		              <div id="coSpace8"></div>
		              <label class="commonLabel">나홀로 코스</label>
		          </div>
		          <div id="coSpace5"></div>
		          
		          <div class="coSelect" id="coSelect3">
		              <div id="coSpace6"></div>
		              <i class="fas fa-heart" id="coIcon3"></i>
		              <div id="coSpace8"></div>
		              <label class="commonLabel">커플 코스</label>
		          </div>
		          <div id="coSpace5"></div>
		          
		          <div class="coSelect" id="coSelect4">
		              <div id="coSpace6"></div>
		              <i class="fas fa-child" id="coIcon4"></i>
		              <i class="fas fa-child" id="coIcon4"></i>
		              <div id="coSpace7"></div>
		              <label class="commonLabel">우정 코스</label>
		          </div>
		          <div id="coSpace5"></div>
		          
		          <div class="coSelect" id="coSelect5">
		              <div id="coSpace6"></div>
		              <i class="fas fa-campground" id="coIcon5"></i>
		              <div id="coSpace7"></div>
		              <label class="commonLabel">캠핑 코스</label>
		          </div>
		          <div id="coSpace5"></div>
		          
		          <div class="coSelect" id="coSelect6">
		              <div id="coSpace6"></div>
		              <i class="fas fa-biking" id="coIcon6"></i>
		              <div id="coSpace7"></div>
		              <label class="commonLabel">액티비티</label>
		          </div>
		     </div>
		
		</div>
		<div id="coMenu">
		    <div id="coSpace8"></div>
		    <div id="coSpace3"></div>
		    <span class="coMenuLabel" onMouseOver="this.style.color='#F2CA5E';"
				  onMouseOut="this.style.color=''">전체</span>
		    <span class="coMenuLabel2">|</span>
		    <span class="coMenuLabel" onMouseOver="this.style.color='#F2CA5E';"
				  onMouseOut="this.style.color=''">당일여행</span>
		    <span class="coMenuLabel2">|</span>
		    <span class="coMenuLabel" onMouseOver="this.style.color='#F2CA5E';"
				  onMouseOut="this.style.color=''">1박2일</span>
		    <span class="coMenuLabel2">|</span>
		    <span class="coMenuLabel" onMouseOver="this.style.color='#F2CA5E';"
				  onMouseOut="this.style.color=''">2박3일</span>
		</div>
		
		<div id="all_div">
		
					<!-- <!-- <td>전체</td>
					<td>가족 여행</td>
					<td>나 홀로 여행</td>
					<td>커플 여행</td>
					<td>친구와 함께</td>
					<td>뚜벅이 코스</td>
					<td>캠핑</td> -->
			
			<!-- <span class="cate_name">일정</span>
			<i class="fas fa-leaf"></i>
			<table id="calendar_table">
				<tr>
					<td>전체</td>
					<td>당일 여행</td>
					<td>1박2일</td>
					<td>2박3일 이상</td>
				</tr>
			</table>
		</div>
		
		<div id="list_all_div">
			<div id="list_count_div">
				총<span id="list_count">76</span>건
			</div>
			코스마다마다의 div
			<div id="list_course_div">
				<div id="course_img_div">
					<img src="resources/images/travel_img.PNG" id="travel_img"/>
				</div>
				<div id="course_name_writer_div">
					<div id="course_name" onclick="detailView();">코스 이름</div>
					<div id="course_writer">뿌슝빠슝</div>
				</div>
				<div id="course_cate_tag_div">
					<div id="course_cate">
						<span id="course_local">대구 중구</span>
						<span> | </span>
						<span id="course_theme">가족 여행</span>
						<span> | </span>
						<span id="course_calendar">1박2일</span>
					</div>
					<div id="course_tag">
						#공예품라라라<br>
						#가족들과함께<br>
						#룰루사천여행
					</div>
				</div>
			</div>
			<div id="list_course_div">
				<div id="course_img_div">
					<img src="resources/images/travel_img.PNG" id="travel_img"/>
				</div>
				<div id="course_name_writer_div">
					<div id="course_name" onclick="detailView();">코스 이름</div>
					<div id="course_writer">뿌슝빠슝</div>
				</div>
				<div id="course_cate_tag_div">
					<div id="course_cate">
						<span id="course_local">대구 중구</span>
						<span> | </span>
						<span id="course_theme">가족 여행</span>
						<span> | </span>
						<span id="course_calendar">1박2일</span>
					</div>
					<div id="course_tag">
						#공예품라라라<br>
						#가족들과함께<br>
						#룰루사천여행
					</div>
				</div>
			</div>
			<div id="list_course_div">
				<div id="course_img_div">
					<img src="resources/images/travel_img.PNG" id="travel_img"/>
				</div>
				<div id="course_name_writer_div">
					<div id="course_name" onclick="detailView();">코스 이름</div>
					<div id="course_writer">뿌슝빠슝</div>
				</div>
				<div id="course_cate_tag_div">
					<div id="course_cate">
						<span id="course_local">대구 중구</span>
						<span> | </span>
						<span id="course_theme">가족 여행</span>
						<span> | </span>
						<span id="course_calendar">1박2일</span>
					</div>
					<div id="course_tag">
						#공예품라라라<br>
						#가족들과함께<br>
						#룰루사천여행
					</div>
				</div>
			</div>
		</div>
		
		<div id="button_write_div">
			<button id="button_write" onclick="insertView();">등록하기</button>
		</div>
		
		<div id="paging_div">
			<button id="before">&lt;</button>
			<button id="current">1</button>
			<button class="num">2</button>
			<button class="num">3</button>
			<button id="after">&gt;</button>
		</div> -->
	</div>
	
	<script>
		function detailView(){
			location.href="<%= request.getContextPath() %>/courseDetail.co";
		}
		
		function insertView(){
			location.href="<%= request.getContextPath() %>/courseInsert.co";
		}
		
		function errorView(){
			location.href="<%= request.getContextPath() %>/searchError.co";
		}
	</script>
	</section>
</body>
</html>