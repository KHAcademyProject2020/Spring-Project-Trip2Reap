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
				<div id="cate_travel">${ travel.trTheme }</div>
				<div id="name_travel">${ travel.boTitle }</div> <!-- 여행지 이름 -->
				<div id="add_travel">${ travel.trReg }</div>
				<div id="share">
					 <span id="count_span">조회수 : ${ travel.boCount } </span> 
						<span id="share_span" onclick="location">
							<i class="fas fa-share-alt"></i>
								<span class="share_name" id="sh-link">공유하기</span>
						</span>
						<span>
							<i class="fas fa-download" ></i>
								<span class="share_name" onclick="containTravel()">여행지 담기</span>
						</span>	
					</div>
				</div>	
			
			<!-- 여행지 내용 부분 시작 -->
			<div id="travel_content">
		<%-- 		<c:forEach var="imageFileName" items="${ t.fileList }"> --%>
				<!-- <img src="resources/images/송도.JPG" id="content_img"/> -->
				
				<img src="${ contextPath }/resources/buploadFiles/${ travel.changeName }" id="content_img"/>
					<!-- a태그 안에서 다운로드 받을 것이 있을 때 쓰는 속성 download, 얘는 download="fileName" 이라고 해서 fileName을 지정해줄 수 있다. -->
				<!-- <img src="resources/images/송도2.JPG" id="content_img2"/> -->
				<div id="content_img2">👍부담없이 감상하는 백만 불짜리 야경👍</div>
				<div id="content_img3">외국에서는 야경도 관광 명물 중 하나로 적극 홍보한다. 일본의 경우 2012년 '일반사단법인 야경관광컨벤션뷰로'가 전국의 야경감상사 3,500여 명으로부터
				'세계 신3대 야경을 추천받아 모나코, 홍콩과 함께 나가사키가 선정되었다고 발표했다. 이후 나가사키시는 자신들의 관광자원을 자랑할 때 야경을 절대 빼놓지 않는다.</div>
				<%-- </c:forEach> --%>
				
				
					<table id="travel_cate_table">
						<tr id="th_cate">
							<th><i class="fas fa-info-circle"></i>  여행정보 </th>
						</tr>
						<tr> 
							<th>&nbsp;</th>
						</tr>
						<tr>	
							<td class="td_cate">- 주소 : ${ travel.trAddr }</td>
						</tr>
						<tr>	
							<td>- 문의 : 032-832-3031</td>
						</tr>
					</table>
					<div id="last_div">
						<div id="map" style="width:58%;height:350px;"></div>
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
		
		
		function containTravel(){
			swal("여행지를 담았습니다","마이페이지에서 확인하세요","success");//이미 담은 여행지이거나 로그인하지않은경우 담기지 않아야함.(추후수정필요) 
		}
		
		
		
		//url복사하기
		$(document).on("click", "#sh-link", function(e) { // 링크복사 시 화면 크기 고정 
			$('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no'); 
			var html = "<input id='clip_target' type='text' value='' style='position:absolute;top:-9999em;'/>"; 
			$(this).append(html); 
			
			var input_clip = document.getElementById("clip_target"); 
				//현재 url 가져오기 -> 해당 여행지 url 가져오기로 어떻게 값을 가져올지 고민중
				var _url = $(location).attr('href'); 
			$("#clip_target").val(_url); 
				
			if (navigator.userAgent.match(/(iPod|iPhone|iPad)/)) { 
				var editable = input_clip.contentEditable; 
				var readOnly = input_clip.readOnly; 
				
				input_clip.contentEditable = true; 
				input_clip.readOnly = false; 
				
				var range = document.createRange(); 
				range.selectNodeContents(input_clip); 
				
				var selection = window.getSelection(); 
				selection.removeAllRanges(); 
				selection.addRange(range); 
				input_clip.setSelectionRange(0, 999999); 
				
				input_clip.contentEditable = editable; 
				input_clip.readOnly = readOnly; 
			} else { 
				input_clip.select(); 
			} 
			
			try { 
				var successful = document.execCommand('copy'); 
				input_clip.blur(); 
				if (successful) { 				
					swal("URL이 복사 되었습니다.", "원하시는 곳에 붙여넣기 해 주세요!", "success");
					// 링크복사 시 화면 크기 고정 
					$('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=yes'); 
				} else { 				
					swal("URL이 복사에 실패했습니다.", "이 브라우저는 지원하지 않습니다.", "error");
					} 
				} catch (err) { 
					swal("URL이 복사에 실패했습니다.", "이 브라우저는 지원하지 않습니다.", "error");
					} 
				}); // 클립보드 복사
	</script>
	
	
	
	<!-- 도로명주소로 지도띄우기 // 카카오api -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b792742c4c4637344dc9db9e5f475bf5&libraries=services"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${ travel.trAddr }', function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${ travel.boTitle }</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
	</script>
</section>
</body>
</html>