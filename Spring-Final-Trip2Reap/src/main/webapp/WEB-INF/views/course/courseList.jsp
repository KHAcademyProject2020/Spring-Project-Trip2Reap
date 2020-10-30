<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 코스 목록보기</title>
<link rel="stylesheet" type="text/css" href="../css/courseList.css"/>
</head>
<body>
	<section>
	<div id="all_div">
		<div id="menu_div">
			<div id="menu_left_div">
				<img src="../images/courseIcon.png" id="menu_img"/>
				<span id="menu">여행 코스</span>
			</div>
			<div id="menu_right_div">
				<input type="text" id="input_search"/>
				<input type="button" value="검색" id="button_search"/>
			</div>
		</div>
		
		<hr>
		
		<div id="cate_table_div">
			<b>지역</b>
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
			
			<b>테마</b>
			<table id="theme_table">
				<tr>
					<td>전체</td>
					<td>가족 여행</td>
					<td>나 홀로 여행</td>
					<td>힐링 코스</td>
					<td>뚜벅이 코스</td>
					<td>캠핑</td>
					<td>맛집 투어</td>
				</tr>
			</table>
			
			<b>일정</b>
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
			<!-- 코스마다마다의 div -->
			<div id="list_course_div">
				<div id="course_img_div">
					<img src="../images/travel.PNG" id="travel_img"/>
				</div>
				<div id="course_name_writer_div">
					<div id="course_name">코스 이름1</div>
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
					<div id="course_tag">#공예품 #가족과함께 #사천여행</div>
				</div>
			</div>
		</div>
		
		<div id="button_write_div">
			<button id="button_write">등록하기</button>
		</div>
		
		<div id="paging_div">
			<button id="before">&lt;</button>
			<button id="current">1</button>
			<button class="num">2</button>
			<button class="num">3</button>
			<button id="after">&gt;</button>
		</div>
	</div>
	</section>
</body>
</html>