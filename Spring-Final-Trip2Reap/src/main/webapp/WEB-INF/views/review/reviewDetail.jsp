<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href=" ${pageContext.request.contextPath}/resources/css/travel/travelInsert.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table td {
	
}

#insert_div {
	width: 1000px;
	text-align: center;
}

#insertReview {
	width: 800px;
	padding-left: 100px;
	text-align: center;
}
</style>
</head>
<body>
	<section>
		<header>
			<c:import url="../common/menubar.jsp" />
		</header>
		<!-- 전체 div -->
		<div id="all_div">
			<!-- 메뉴 이름 div -->
			<div id="menu_div">
				<div id="menu_left_div">
					<img src="resources/images/reviewIcon.png" id="menu_img" /> <span
						id="menu">여행 후기</span>
				</div>
			</div>


			<!-- 작성하기 div 시작 -->
			<div id="insert_div">

				<!-- 작성하기 table 시작 -->
				<div id="insertReview">
					<table id="travel_table">

						<tr>
							<td colspan="5"><span>
									<h2>
										[여행지] ${b.boTitle}<br>
									</h2>
							</span></td>
						</tr>
						<tr>
							<td colspan="5"><span><b>글쓴이 : 여행 is best</b></span></td>
						</tr>
						<tr>
							<td>2020.09.21.11:23</td>
							<td colspan="3"></td>
							<td>#여행지 #공원 #분당</td>
						</tr>

						<tr>
							<td colspan="5">
								<hr>
							</td>
						</tr>
						<tr>
						
							<td colspan="5"><img src="resources/images/reviewIcon.png"
								width="600px;" height="500px;"></td>
							
						</tr>

						<tr>
							<td colspan="5">
								<div>국내 방방곡곡에서 추천해준 분당 율동공원에 다녀왔습니다! 사람도 별로 없었고 날씨도 너무
									좋았습니다. 다른 분들도 시간날 때 한번 오시면 후회안하실 거 같습니다!</div>
							</td>
						</tr>
						<tr>
							<td colspan="5">좋아요<hr></td>
						</tr>
						
						<tr>
							<td colspan="5"><h1>댓글</h1></td>
						</tr>
						<tr>
							<td colspan="5"><b>작성자 : 만수무강</b></td>
						</tr>
						<tr>
							<td colspan="5">감사합니다</td>
						</tr>
						<tr>
							<td colspan="5">2020.11.01. 11:23<hr></td>
						</tr>
					
						<tr>
							<td colspan="5"><b>작성자 : 만수무강</b></td>
						</tr>
						<tr>
							<td colspan="5">감사합니다</td>
						</tr>
						<tr>
							<td colspan="5">2020.11.01. 11:23<hr></td>
						</tr>
					
						<tr>

							<td colspan="5"><textarea rows="10" cols="100"
									placeholder="댓글을 입력해보세요."></textarea></td>

						</tr>
						<tr>
							<td colspan="5"><button>댓글작성</button></td>
						</tr>

					</table>
				</div>
			</div>
			<!-- 전체 div 끝 -->

			<!-- 버튼 div -->
			<div id="button_div">
				<button id="button_write">등록</button>
				<button id="button_write">목록</button>
				<button id="button_write">Top▲</button>
			</div>

		</div>


	</section>
</body>
</html>