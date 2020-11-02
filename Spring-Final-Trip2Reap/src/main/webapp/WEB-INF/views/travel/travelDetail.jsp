<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 코스 상세보기</title>
<link rel="stylesheet" type="text/css" href=" ${pageContext.request.contextPath}/resources/css/travel/travelDetail.css"/>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
</head>
<body>
<section>
	<header>
   	 	<c:import url="../common/menubar.jsp" />
	</header>
	<div id="all_div">
			<div id="menu_div">
				<div id="menu_left_div">
					<img src="resources/images/travel.png" id="menu_img"/>
					<span id="menu">여행지</span>
				</div>
			</div>
			<div id="travel_info">
				<div id="cate_travel">관광지</div>
				<div id="name_travel">송도 센트럴파크</div>
				<div id="add_travel">인천 연수구</div>
				<div id="share">
				<span>조회수  |  1000</span>
					<span onclick="location">
						<i class="fas fa-share-alt" style="float:right; margin-right:5px; width:18px; height:18px;"></i>
					</span>
					<span>
						<i class="fas fa-download" style="float:right; margin-right:10px; width:18px; height:18px;"></i>
					</span>	
				</div>
			</div>	
			
			<!-- 여행지 내용 부분 시작 -->
			<div id="travel_content">
				<img src="resources/images/송도.JPG" id="content_img"/>
				<img src="resources/images/송도2.JPG" id="content_img2"/>
					<table id="travel_cate_table">
						<tr id="th_cate">
							<th><i class="fas fa-info-circle"></i>  여행정보 </th>
						</tr>
						<tr> 
							<th>&nbsp;</th>
						</tr>
						<tr id="tr_cate">
							<td class="td_cate">인천종합관광안내소(송도 센트럴파크)</td>
						</tr>
						<tr>	
							<td class="td_cate">- 주소 : 인천 연수구 인천타워대로 234</td>
						</tr>
						<tr>	
							<td>- 문의 : 032-832-3031</td>
						</tr>
					</table>
					<div id="last_div">
						<img src="resources/images/송도3.JPG" id="content_img3"/>
					</div>
			
				 <div id="hashtag_div">
					<a href=" ${pageContext.request.contextPath}/resources/css/travel/travelList.jsp">#인천</a>&nbsp;&nbsp;
						<a href=" ${pageContext.request.contextPath}/resources/css/travel/travelList.jsp">#공원</a>&nbsp;&nbsp;
						<a href=" ${pageContext.request.contextPath}/resources/css/travel/travelList.jsp">#산책하기짱</a>&nbsp;&nbsp;
						<a href=" ${pageContext.request.contextPath}/resources/css/travel/travelList.jsp">#야경</a>&nbsp;&nbsp;
						<a href=" ${pageContext.request.contextPath}/resources/css/travel/travelList.jsp">#레포츠</a>&nbsp;&nbsp;
				</div> 
					<br><br>
				<hr>
				
				<div id="button_div">
					<button id="button_update">수정하기</button>
					<button id="button_delete">삭제하기</button>
				</div>
			</div>
		</div>
</section>
</body>
</html>