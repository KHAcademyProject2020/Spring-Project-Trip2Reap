<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/travel/travelList.css"/>
<meta charset="UTF-8">
<body>
	
<section>
	<header>
   	 <c:import url="../common/menubar.jsp" />
	</header>
	<div id="all_div">
		<div id="menu_div">
			<div id="menu_left_div">
				<img src="resources/images/travelIcon.png" id="menu_img"/>
				<span id="menu">여행지</span>
			</div>
			<div id="menu_right_div">
				<input type="text" id="input_search" />
				<button id="button_serarch" onclick="goSearchError()">검색</button>
			</div>
		</div>
		
		<!-- 해쉬태그 카테고리 -->
		<div id="hashtag_div">
			<ul id="hashtag_ul">
				<li>
					<a href=" ${pageContext.request.contextPath}/tList.tv">#전체</a>&nbsp;&nbsp;
				</li>
				<li>
					<a href=" ${pageContext.request.contextPath}/tList.tv">#문화시설</a>&nbsp;&nbsp;
				</li>
				<li>
					<a href=" ${pageContext.request.contextPath}/tList.tv">#레포츠</a>&nbsp;&nbsp;
				</li>
				<li>
					<a href=" ${pageContext.request.contextPath}/tList.tv">#쇼핑</a>&nbsp;&nbsp;
				</li>
				<li>
					<a href=" ${pageContext.request.contextPath}/tList.tv">#자연</a>&nbsp;&nbsp;
				</li>
				<li>
					<a href=" ${pageContext.request.contextPath}/tList.tv">#축제</a>&nbsp;&nbsp;
				</li>
			</ul>
		</div>
		
		
		<!-- 지역/테마 카테고리 -->
		<div id="cate_table_div">
			<span id="cate_name">지역</span>
				<span id="cate_icon"><i class="fas fa-leaf" style="height:13px;, width:13px; color:#a7e1af;"></i></span>
				<table id="local_table">
					<tr>
						<td>전체</td>
						<td>서울</td>
						<td>인천</td>
						<td>대전</td>
						<td>대구</td>
						<td>광주</td>
						<td>부산</td>
						<td>울산</td>
						<td>세종</td>
					</tr>
					<tr>
						<td>경기</td>
						<td>강원</td>
						<td>충북</td>
						<td>충남</td>
						<td>경북</td>
						<td>경남</td>
						<td>전북</td>
						<td>전남</td>
						<td>제주</td>
					</tr>
				</table>
			
			<span id="cate_name">테마</span>
				<span id="cate_icon"><i class="fas fa-leaf" style="height:13px;, width:13px; color:#a7e1af;"></i></span>
				<table id="theme_table">
					<tr>
						<td>전체</td>
						<td>관광지</td>
						<td>음식점</td>
						<td>명소</td>
						<td>축제</td>
					</tr>
				</table>
			</div>
		
		
		
		
		<div id="list_all_div">
			<div id="list_count_div">
				총<span id="list_count">76</span>건
			</div>
			
			<!-- 여행지 div -->
			<div id="list_travel_div">
				<div id="travel_img_div">
					<img src="resources/images/송도.JPG" id="travel_img"/>
				</div>
				<div id="travel_name_writer_div">
					<div id="travel_name" onclick="detailView()">송도 센트럴파크</div>
					<div id="travel_theme">관광지</div>
					<div id="travel_writer">인천 송도</div>
					<div id="travel_tag">#레포츠 #가족과함께 #자연</div>
				</div>
				<span id="list_etc">…</span>
			</div>
			
			<br><br>
			
			<div id="list_travel_div">
				<div id="travel_img_div">
					<img src="resources/images/송도.JPG" id="travel_img"/>
				</div>
				<div id="travel_name_writer_div">
					<div id="travel_name" onclick="detailView()">송도 센트럴파크</div>
					<div id="travel_theme">관광지</div>
					<div id="travel_writer">인천 송도</div>
					<div id="travel_tag">#공원 #가족과함께 #자연</div>
				</div>
				<span id="list_etc">…</span>
			</div>
			
			<br><br>
			
		
			<div id="list_travel_div">
				<div id="travel_img_div">
					<img src="resources/images/송도.JPG" id="travel_img"/>
				</div>
				<div id="travel_name_writer_div">
					<div id="travel_name" onclick="detailView()">송도 센트럴파크</div>
					<div id="travel_theme">관광지</div>
					<div id="travel_writer">인천 송도</div>
					<div id="travel_tag">#공원 #가족과함께 #자연</div>
				</div>
				<span id="list_etc">…</span>
			</div>
			
			<br><br>
			
				
			<div id="list_travel_div">
				<div id="travel_img_div">
					<img src="resources/images/송도.JPG" id="travel_img"/>
				</div>
				<div id="travel_name_writer_div">
					<div id="travel_name" onclick="detailView()">송도 센트럴파크</div>
					<div id="travel_theme">관광지</div>
					<div id="travel_writer">인천 송도</div>
					<div id="travel_tag">#관광지 #미세먼지x #식물원</div>
				</div>
				<span id="list_etc">…</span>
			
				
			
			</div>
		</div>
				<div id="button_write_div">
				<button id="button_write" onclick="insertView()">등록하기</button>
				</div>
				
			
				<div id="paging_div">
					<button id="before">&lt;</button>
					<button id="current">1</button>
					<button class="num">2</button>
					<button class="num">3</button>
					<button id="after">&gt;</button>
				</div>
		
		<div><br><br><br>
		</div>
		
	</div><!-- 전체 div끝 -->
	
	
	<script>
		function detailView(){
 		   location.href="<%= request.getContextPath() %>/tDetail.tv";
 	   }
		
		
		function insertView(){
			location.href="<%= request.getContextPath() %>/tInsert.tv";
		}
		
		function goSearchError(){
			location.href="<%= request.getContextPath() %>/tSearchError.tv";
		}
	</script>
	
</section>
</body>
</html>