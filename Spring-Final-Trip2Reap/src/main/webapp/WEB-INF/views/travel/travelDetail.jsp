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
					<i class="fas fa-suitcase-rolling" id="menu_img"></i>
					<span id="menu">여행지</span>
				</div>
			</div>
			<div id="travel_info">
				<div id="cate_travel">관광지</div>
				<div id="name_travel">송도 센트럴파크</div>
				<div id="add_travel">인천 연수구</div>
				<div id="share">
					<!-- <span>조회 1000</span> 나중에 수정 -->
						<span id="share_span" onclick="location">
							<i class="fas fa-share-alt"></i>
								<span class="share_name">공유하기</span>
						</span>
						<span>
							<i class="fas fa-download" ></i>
								<span class="share_name">코스에 담기</span>
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
					<a href=" ${pageContext.request.contextPath}/tList.tv">#인천</a>&nbsp;&nbsp;
						<a href=" ${pageContext.request.contextPath}/tList.tv">#공원</a>&nbsp;&nbsp;
						<a href=" ${pageContext.request.contextPath}/tList.tv">#산책하기짱</a>&nbsp;&nbsp;
						<a href=" ${pageContext.request.contextPath}/tList.tv">#야경</a>&nbsp;&nbsp;
						<a href=" ${pageContext.request.contextPath}/tList.tv">#레포츠</a>&nbsp;&nbsp;
				</div> 
					<br><br>
				<hr>
				
				<div id="button_div">
					<button id="button_update" onclick="updateView()">수정하기</button>
					<button id="button_delete" onclick="deleteView()">삭제하기</button>
				</div>
			</div>
		</div>
		
	<script>
		function updateView(){	//수정하기 뷰로 이동
			location.href=" ${pageContext.request.contextPath}/tUpdate.tv"
		}
		
		function deleteView(){ //삭제하기 뷰로 이동
			location.href=" ${pageContext.request.contextPath}/tList.tv"
		}
	</script>	
</section>
</body>
</html>