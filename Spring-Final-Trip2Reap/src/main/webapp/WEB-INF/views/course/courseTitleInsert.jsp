<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나만의 여행코스</title>
<link rel="stylesheet" type="text/css" href="resources/css/course/courseTitleInsert.css"/>
</head>
<body>	
	<header>
    <%@ include file="../common/menubar.jsp" %>
    </header>
	
	<section>
	<div id="all_div">
		<!-- 메뉴 이름 div -->
		<div id="menu_div">
			<div id="coMenu">
				<i class="fas fa-map-signs" id="menuIcon2"></i>
				<span id="coMenuLabel">여행코스 만들기</span>
			</div>
		</div>
		
		<!-- 표지  -->
		<div id="tiSpace1"></div>
		<div id="tiSpace2"></div>
		<div id="titleImgDiv">
		    <img src="resources/images/메인배너1.png" id="titleImg">
		    <i class="far fa-images" id="titleIcon"></i>		    
		    <label id="titleLabel">표지 이미지 변경</label>		    
		</div>
		
		<form name="signform" method="POST" ENCTYPE="multipart/form-data" action="courseInsertAttachment.co">
           <input type="file" id="file" name="file" accept="image/*">
            <input type="hidden" name = "target_url">
        </form>
    
        <!-- 코스정보  -->
        <div id="tiSpace1"></div>
        <div id="tiSpace2"></div>
        <div id="cotitle">
            <label id="starLabel">*</label>
            <label id="coTitleLabel">여행제목</label>
            <input type="text" value="${ loginUser.nickName }님의 여행코스" id="titleText" maxlength="14">
        </div> 
        <div id="tiSpace1"></div>           
        
        
        <div id="tiSpace2"></div>
        <div id="cotitle">
            <label id="starLabel">*</label>
            <label id="coTitleLabel2">테마</label>
            <select id="coTheme" name="theme">
                <option value = "가족">가족 코스</option>
                <option value = "나홀로">나홀로 코스</option>
				<option value = "커플">커플 코스</option>
				<option value = "우정">우정 코스</option>
				<option value = "캠핑">캠핑 코스</option>
				<option value = "액티비티">액티비티</option>
            </select>
        </div>   
    
    
        <div id="tiSpace5"></div>
        <div id="cotitle">
            <label id="starLabel">*</label>
            <label id="coTitleLabel2">일정</label>
            <select id="coSchedule" name="schedule">
                <option value = "당일치기">당일치기</option>
                <option value = "1박2일">1박2일</option>
				<option value = "2박3일">2박3일</option>
            </select>
        </div>
        
        <!-- 카카오 지도  -->
        <div id="tiSpace1"></div>
        <div id="tiSpace2"></div>
        <div id="mainCourse0">
           <div id="tiSpace1"></div>
           <div id="tiSpace4"></div>
           <div id="mapDiv1">                     
                 <div class="map_wrap">
                     <div id="map"></div>
                     <div id="menu_wrap" class="bg_white">
                           <div class="option">
                                <div>
                                    <form onsubmit="searchPlaces(); return false;">
                                                                                           키워드 : <input type="text" value="제주도 맛집" id="keyword" size="15"> 
                                        <button type="submit">검색하기</button> 
                                    </form>
                               </div>
                          </div>
                          <hr>
                          <ul id="placesList"></ul>
                          <div id="pagination"></div>
                     </div>
                </div>
		   </div>          
           
           <!-- 코스1일차  -->
           <div id="tiSpace6"></div>
           <div id="tiSpace7"></div>
           <div id="day1">
               <label id="dayLabel">D-1</label>
           </div>
           <label id="dayLabel2">여행 1일차</label>
           <button id="addLocation">장소추가</button>
        

        
        
        </div>
    </div>

    <div style="height: 300px;"></div>
    </section>

    <script>
    $('#titleImgDiv').click(function (e) {
    	    // 현재 이미지 소스
            document.signform.target_url.value = document.getElementById('titleImg').src;           
             e.preventDefault();
              $('#file').click();
    }); 
    
    var imgFile = document.querySelector("#file");
    
    imgFile.onchange = function(){
    	var fileList = file.files;
    	
    	// 읽기
    	var reader = new FileReader();
    	reader.readAsDataURL(fileList[0]);
    	
    	// 로드 후
    	reader.onload = function(){
    		document.querySelector('#titleImg').src = reader.result;
    	}
    }   
    </script>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=37dc981b741ae67d53f183d4daf2b8c3&libraries=services,clusterer,drawing"></script>
	<script>
	var markers = [];
	
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.507089803070606, 126.49277539839063), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };  

    var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
    
 // 장소 검색 객체를 생성합니다
    var ps = new kakao.maps.services.Places();  

    // 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    // 키워드로 장소를 검색합니다
    searchPlaces();

    // 키워드 검색을 요청하는 함수입니다
    function searchPlaces() {

        var keyword = document.getElementById('keyword').value;

        if (!keyword.replace(/^\s+|\s+$/g, '')) {
            alert('키워드를 입력해주세요!');
            return false;
        }

        // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
        ps.keywordSearch( keyword, placesSearchCB); 
    }

    // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            // 정상적으로 검색이 완료됐으면
            // 검색 목록과 마커를 표출합니다
            displayPlaces(data);

            // 페이지 번호를 표출합니다
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    // 검색 결과 목록과 마커를 표출하는 함수입니다
    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'), 
        menuEl = document.getElementById('menu_wrap'),
        fragment = document.createDocumentFragment(), 
        bounds = new kakao.maps.LatLngBounds(), 
        listStr = '';
        
        // 검색 결과 목록에 추가된 항목들을 제거합니다
        removeAllChildNods(listEl);

        // 지도에 표시되고 있는 마커를 제거합니다
        removeMarker();
        
        for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i), 
                itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

            // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
            // LatLngBounds 객체에 좌표를 추가합니다
            bounds.extend(placePosition);

            // 마커와 검색결과 항목에 mouseover 했을때
            // 해당 장소에 인포윈도우에 장소명을 표시합니다
            // mouseout 했을 때는 인포윈도우를 닫습니다
            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    }

    // 검색결과 항목을 Element로 반환하는 함수입니다
    function getListItem(index, places) {

        var el = document.createElement('li'),
        itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                    '<div class="info">' +
                    '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                        '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>'; 
        }
                     
          itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                    '</div>';           

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    // 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                marker = new kakao.maps.Marker({
                position: position, // 마커의 위치
                image: markerImage 
            });

        marker.setMap(map); // 지도 위에 마커를 표출합니다
        markers.push(marker);  // 배열에 생성된 마커를 추가합니다

        return marker;
    }

    // 지도 위에 표시되고 있는 마커를 모두 제거합니다
    function removeMarker() {
        for ( var i = 0; i < markers.length; i++ ) {
            markers[i].setMap(null);
        }   
        markers = [];
    }

    // 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i; 

        // 기존에 추가된 페이지번호를 삭제합니다
        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    // 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
    // 인포윈도우에 장소명을 표시합니다
    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

     // 검색결과 목록의 자식 Element를 제거하는 함수입니다
    function removeAllChildNods(el) {   
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }
    
    
    kakao.maps.event.addListener(map, 'click', function(mouseEvent) {           
        // 클릭한 위도, 경도 정보를 가져옵니다 
        var latlng = mouseEvent.latLng; 
    
        console.log('클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ' + '경도는 ' + latlng.getLng() + ' 입니다');      
    });

    // 선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
    var linePath = [
        new kakao.maps.LatLng(33.49424018249533, 126.48141164084879),
        new kakao.maps.LatLng(33.49799646250557, 126.48276668243118),
        new kakao.maps.LatLng(33.499710074548354, 126.51409384166868) 
    ];

    // 지도에 표시할 선을 생성합니다
    var polyline = new kakao.maps.Polyline({
        path: linePath, // 선을 구성하는 좌표배열 입니다
        strokeWeight: 5, // 선의 두께 입니다
        strokeColor: '#FFAE00', // 선의 색깔입니다
        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
        strokeStyle: 'solid' // 선의 스타일입니다
    });

    // 지도에 선을 표시합니다 
    polyline.setMap(map);  
    
    function changeLocation(){
    	var selectLocation = document.getElementById("coLocation").value;
    	console.log("지역 : " + selectLocation);
    }
</script>

</body>
</html>