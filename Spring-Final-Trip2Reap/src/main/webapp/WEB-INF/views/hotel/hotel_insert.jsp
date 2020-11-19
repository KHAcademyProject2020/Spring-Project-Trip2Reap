<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- css -->
<link rel="stylesheet" href="resources/css/hotel/hotel_insert.css">


<title>호텔 등록하기</title>
</head>

<body>


	<c:import url="../common/menubar.jsp" />

	<!--(common all pages related with hotel) main-container -->
	<div id="main-container">

		<!-- (common all pages related with hotel) title-container -->
		<div id="title-container">

			<img id="hotel-icon" src="resources/images/hotelIcon.png"> 
			<span id="title-name">호텔 예약</span>
		</div>

		<div>
			<form action="hotelInsert.ho" method="post"
				enctype="multipart/form-data">
				<div id="sub-title-container">
					<h1>호텔 등록</h1>
				</div>

				<!-- 호텔 이름 입력 1-->
				<div class="insert-common-container">
					<div class="hotel-insert-content-container">
						<p style="color: #913716;">* 는 필수 입력사항 입니다!</p>
					</div>
					<div class="hotel-insert-content-container">
						<input id="hotel_name" name="hotel_name"
							placeholder="* 호텔이름을 입력해주세요" type="text">
					</div>
				</div>

				<!--호텔 메인 썸네일 이미지 등록2 -->
				<div class="insert-common-container">
					<div class="hotel-insert-subtitle-container">
						<h3>* 호텔 메인 이미지 등록</h3>
					</div>
					<div class="hotel-insert-content-container">
						<input type="file" name="thumbnail_img" id="thumbnail_img" accept="images/*" /> 
						<label id="thumbnail_img_label" for="thumbnail_img">썸네일 이미지 찾아보기</label> 
						<span class="img_upload_status_info" id="thumbnail_img_name">사진을 업로드 해주세요!</span>
					</div>
					<script>
						
					</script>

				</div>

				<!-- 호텔 디테일 이미지 등록 3-->
				<div class="insert-common-container">
					<div class="hotel-insert-subtitle-container">
						<h3>&nbsp;&nbsp;호텔 디테일 이미지 등록</h3>
					</div>
					<div class="hotel-insert-content-container">
						<input type="file" name="detail_img" id="detail_img"
							accept="images/*" multiple /> <label id="detail_img_label"
							for="detail_img">디테일 이미지 찾아보기</label> <span
							class="img_upload_status_info" id="detail_img_name"> <span
							id="uploaded_img_cnt">0</span>개의 사진을 업로드 했습니다.
						</span>

						<ul class="uploaded_img_names">
							<li></li>
						</ul>
					</div>
					
					<script>
					
					</script>
				</div>

				<!--호텔 도로명 주소 4 -->
				<div class="insert-common-container">
					<div class="hotel-insert-subtitle-container">
						<h3>* 호텔 도로명 주소</h3>
					</div>
					<div id="search_hotel_addr_container">
						<div class="search_hotel_addr_wrapper">
							<input id="search_hotel_addr_btn" type="button" value="주소 찾기" onclick="exeDaumPostcode()">
							<input type="text" readonly placeholder="호텔 도로명 주소를 입력해주세요!"
							name="hotel_address" id="hotel_address">
							
						</div>
						
						<div class="map_wrapper">
							<div id="map" style="width:300px;height:300px; margin-top:10px;display:none"></div>
						</div>
						
						<%--도로명 주소 API --%>
						<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=38a6847af6f758230564da5fe29aa9fc&libraries=services"></script>
						<script>
						
							var mapContainer= document.getElementById('map');
							mapOption={
									center: new daum.maps.LatLng(37.537187, 127.005476),
									map: map
							};
							
							// 지도를 미리 생성 
							var map= new daum.maps.Map(mapContainer, mapOption);
							
							//주소-좌표 변환 객체를 생성 
							var geocoder= new daum.maps.services.Geocoder();
							
							//마커를 미리 생성
							var marker= new daum.maps.Marker({
								position: new daum.maps.LatLng(37.537187, 127.005476),
								map: map
							});
							
							
							function exeDaumPostcode(){
								new daum.Postcode({
									oncomplete: function(data){
										var addr= data.address; // 최종 주소 변수
										
										// 주소 정보를 해당 필드에 넣는다
										document.getElementById("hotel_address").value= addr;
										
										// 주소로 상세 정보를 검색
										geocoder.addressSearch(data.address, function(results, status){
											//정상적으로 검색이 완료되면
											if(status===daum.maps.services.Status.OK){
												//첫번째 결과값을 활용.
												var result=results[0];
												
												// 해당 주소에 대한 좌표를 받는다
												var coords= new daum.maps.LatLng(result.y, result.x);
												
												//지도를 보여준다.
												mapContainer.style.display ="block";
												map.relayout();
												
												//지도의 중심을 변경한다.
												map.setCenter(coords);
												
												//마커의 결과값으로 받은 위치로 옮긴다.
												marker.setPosition(coords);
												
											}
										});
									}
									
								}).open();	
							}
						</script>
					</div>
					
				</div>

				<!-- 호텔 객실 정보 입력 5-->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 객실 정보</h3>
					</div>

					<div class="insert-hotel-info-wrapper" id="insert_hotel_info_list">

						<!-- 호텔객실 정보 입력창 1 (disable delete)-->
						<div class="one-room-info-insert">
							<div class="room_btn_remote_controller_wrapper">
								<div class="insert_room_name">
									<input type="text" class="room_name" placeholder="객실 이름 입력"
										name="room_name">
								</div>

								<div>
									<ul class="room_btn_remote_controller">
										<li class="hotel-info-order-up"><i class="fas fa-angle-up"></i></li>
										<li class="hotel-info-order-down"><i class="fas fa-angle-down"></i></li>
										<li class="hotel-info-remove"><i class="fas fa-minus"></i></li>
									</ul>
								</div>
							</div>

							<div class="insert_hotel_details">
								<div class="insert_room_kinds">
									<span class="room_kind_label">등록 객실 종류</span> 
									<select>
										<option value="">객실 종류 선택</option>
										<option value="싱글룸">싱글룸</option>
										<option value="더블룸">더블룸</option>
										<option value="트윈룸">트윈룸</option>
										<option value="스탠다드룸">스탠다드룸</option>
										<option value="패밀리 트윈룸">패밀리</option>
										<option value="디럭스 트윈룸">디럭스</option>
										<option value="스위트룸">스위트룸</option>
										<option value="스튜디오룸">스튜디오룸</option>
										<option value="트리플룸">트리플룸</option>
										<option value="온돌룸">온돌룸</option>
										<option value="슈페리어룸">슈페리어룸</option>
										<option value="이그제큐티브룸">이그제큐티브룸</option>
										<option value="커넥팅룸">커넥팅룸</option>
										<option value="프리미어룸">프리미어룸</option>
										<option value="이코노미룸">이코노미룸</option>
									</select>
								</div>


							</div>
						</div>

						<!-- 호텔객실 정보 입력창 2 (available delete)-->
						<div class="one-room-info-insert">
							<div class="room_btn_remote_controller_wrapper">
								<div class="insert_room_name">
									<input type="text" class="room_name" placeholder="객실 이름 입력"
										name="room_name">
								</div>

								<div>
									<ul class="room_btn_remote_controller">
										<li class="hotel-info-order-up"><i class="fas fa-angle-up"></i></li>
										<li class="hotel-info-order-down"><i class="fas fa-angle-down"></i></li>
										<li class="hotel-info-remove"><i class="fas fa-minus"></i></li>
									</ul>
								</div>
							</div>

							<div class="insert_hotel_details">
								<div class="insert_room_kinds">
									<span class="room_kind_label">등록 객실 종류</span> 
									<select>
										<option value="">객실 종류 선택</option>
										<option value="싱글룸">싱글룸</option>
										<option value="더블룸">더블룸</option>
										<option value="트윈룸">트윈룸</option>
										<option value="스탠다드룸">스탠다드룸</option>
										<option value="패밀리 트윈룸">패밀리</option>
										<option value="디럭스 트윈룸">디럭스</option>
										<option value="스위트룸">스위트룸</option>
										<option value="스튜디오룸">스튜디오룸</option>
										<option value="트리플룸">트리플룸</option>
										<option value="온돌룸">온돌룸</option>
										<option value="슈페리어룸">슈페리어룸</option>
										<option value="이그제큐티브룸">이그제큐티브룸</option>
										<option value="커넥팅룸">커넥팅룸</option>
										<option value="프리미어룸">프리미어룸</option>
										<option value="이코노미룸">이코노미룸</option>
									</select>
								</div>
							</div>
						</div>

					</div> <%-- id="insert_hotel_info_list" --%>
					<div class="insert-hotel-btn-container">
							<i class="fas fa-plus" id="add_room_btn"></i>
							<script>
							$(function(){
								$('#add_room_btn').on('click',function(){
									let $hotelInfoContainer= $('#insert_hotel_info_list');
									let $oneHotelInfo='<div class="one-room-info-insert">'
									$oneHotelInfo+='<div class="room_btn_remote_controller_wrapper">'
									$oneHotelInfo+='<div class="insert_room_name">'
									$oneHotelInfo+='<input type="text" class="room_name" placeholder="객실 이름 입력" name="room_name"></div>'
									$oneHotelInfo+='<div><ul class="room_btn_remote_controller"><li class="hotel-info-order-up"><i class="fas fa-angle-up"></i></li><li class="hotel-info-order-down"><i class="fas fa-angle-down"></i></li><li class="hotel-info-remove"><i class="fas fa-minus"></i></li></ul></div></div>'
									$oneHotelInfo+='<div class="insert_hotel_details"><div class="insert_room_kinds"><span class="room_kind_label">등록 객실 종류</span> '
									$oneHotelInfo+='<select><option value="">객실 종류 선택</option><option value="싱글룸">싱글룸</option><option value="더블룸">더블룸</option><option value="트윈룸">트윈룸</option>'
									$oneHotelInfo+='<option value="스탠다드룸">스탠다드룸</option><option value="패밀리 트윈룸">패밀리</option><option value="디럭스 트윈룸">디럭스</option><option value="스위트룸">스위트룸</option><option value="스튜디오룸">스튜디오룸</option><option value="트리플룸">트리플룸</option>'
									$oneHotelInfo+='<option value="온돌룸">온돌룸</option><option value="슈페리어룸">슈페리어룸</option><option value="이그제큐티브룸">이그제큐티브룸</option><option value="커넥팅룸">커넥팅룸</option><option value="프리미어룸">프리미어룸</option><option value="이코노미룸">이코노미룸</option></select></div></div></div>';
									
									$hotelInfoContainer.append($oneHotelInfo);
									
								});
							});
							</script>
					</div>
					
					<script>
						$(document).on('click', '.hotel-info-remove',function(e){
							//(-)버튼: 호텔 객실정보 삭제 버튼 
							// 클릭한 (-) 버튼에 해당하는 호텔객실 정보 1개를 지운다.
							
							let currentRoomInfo= $(e.currentTarget).closest('.one-room-info-insert');
							console.log(currentRoomInfo);
							
							//삭제 확인창 
							if(confirm('정말로 삭제하시겠습니까?')){
								//삭제버튼에 해당하는 호텔정보를 지운다.
								currentRoomInfo.remove();
							}
						});
						
					</script>
				</div>

				<!-- 호텔 전화번호 입력 6-->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 전화번호</h3>
					</div>
					<div class="insert-hotel-call-number-wrapper">

						<!-- 지역번호 -->
						<div class="phone-call-wrapper">
							<select class="phone-call" name="local_call_number"
								id="local_call_number">
								<option value="">지역번호 선택</option>
								<option value="02">02</option>
								<option value="031">031</option>
								<option value="032">032</option>
								<option value="033">033</option>
								<option value="041">041</option>
								<option value="042">042</option>
								<option value="043">043</option>
								<option value="044">044</option>
								<option value="051">051</option>
								<option value="052">052</option>
								<option value="053">053</option>
								<option value="054">054</option>
								<option value="055">055</option>
								<option value="061">061</option>
								<option value="062">062</option>
								<option value="063">063</option>
								<option value="064">064</option>
								<option value="010">010</option>
							</select>
						</div>

						<!-- 나머지 번호 입력 -->
						<div class="phone-call-wrapper">
							<input class="phone-call" type="tel" name="real_call_number"
								id="real_call_number">
						</div>

						<div>
							<small id="phone-call-alert" style="visibility: hidden;">숫자로
								입력해주세요!(alert-message)</small>
						</div>
					</div>
				</div>

				<!-- 호텔 운영시간 7-->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 운영시간</h3>
					</div>

					<div class="hotel-operation-time-container">
						<div class="setting-operation-time">
							<span>운영시작 시간</span>

							<!-- 호텔 오픈 시각 선택 -->
							<select name="hotel_open_time" id="hotel_open_time">
								<option value="">운영시작 시간선택</option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
							</select>
						</div>

						<div class="setting-operation-time">
							<span>운영종료 시간</span>

							<!-- 호텔 종료시간 선택 -->
							<select name="hotel_close_time" id="hotel_close_time">
								<option value="">운영종료 시간선택</option>
								<option value="0">0</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
								<option value="11">11</option>
								<option value="12">12</option>
								<option value="13">13</option>
								<option value="14">14</option>
								<option value="15">15</option>
								<option value="16">16</option>
								<option value="17">17</option>
								<option value="18">18</option>
								<option value="19">19</option>
								<option value="20">20</option>
								<option value="21">22</option>
								<option value="23">23</option>
								<option value="24">24</option>
							</select>
						</div>

					</div>
				</div>

				<!-- 호텔 옵션 선택 8-->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 옵션 선택</h3>
						<div class="hotel_option_table">
							<!-- 테이블1 -->
							<table>
								<tr>
									<td>옵션명</td>
									<td>선택</td>
								</tr>

								<tr>
									<td>와이파이</td>
									<td><input type="checkbox" name="hotel_option"
										value="와이파이" /></td>
								</tr>

								<tr>
									<td>조식</td>
									<td><input type="checkbox" name="hotel_option" value="조식" />
									</td>
								</tr>

								<tr>
									<td>레스토랑</td>
									<td><input type="checkbox" name="hotel_option"
										value="레스토랑" /></td>
								</tr>

								<tr>
									<td>세탁</td>
									<td><input type="checkbox" name="hotel_option" value="세탁" />
									</td>
								</tr>

								<tr>
									<td>24시간 리셉션</td>
									<td><input type="checkbox" name="hotel_option"
										value="24시간 리셉션" /></td>
								</tr>

								<tr>
									<td>수하물 보관</td>
									<td><input type="checkbox" name="hotel_option"
										value="수하물 보관" /></td>
								</tr>

								<tr>
									<td>수영장</td>
									<td><input type="checkbox" name="hotel_option" value="수영장" />
									</td>
								</tr>

								<tr>
									<td>피트니스</td>
									<td><input type="checkbox" name="hotel_option"
										value="피트니스" /></td>
								</tr>

								<tr>
									<td>스파 & 사우나</td>
									<td><input type="checkbox" name="hotel_option" value="스파" />
									</td>
								</tr>

								<tr>
									<td>미용실 </td>
									<td><input type="checkbox" name="hotel_option" value="미용실" />
									</td>
								</tr>
							</table>


							<!-- 테이블2 -->
							<table>
								<tr>
									<td>옵션명</td>
									<td>선택</td>
								</tr>

								<tr>
									<td>카페</td>
									<td><input type="checkbox" name="hotel_option" value="카페" />
									</td>
								</tr>

								<tr>
									<td>비즈니스 시설</td>
									<td><input type="checkbox" name="hotel_option"
										value="비즈니스 시설" /></td>
								</tr>

								<tr>
									<td>주차</td>
									<td><input type="checkbox" name="hotel_option" value="주차" />
									</td>
								</tr>

								<tr>
									<td>공항셔틀</td>
									<td><input type="checkbox" name="hotel_option"
										value="공항셔틀" /></td>
								</tr>

								<tr>
									<td>장애인 편의시설</td>
									<td><input type="checkbox" name="hotel_option"
										value="장애인 편의시설" /></td>
								</tr>

								<tr>
									<td>바 & 라운지</td>
									<td><input type="checkbox" name="hotel_option"
										value="바 라운지" /></td>
								</tr>


								<tr>
									<td>주방</td>
									<td><input type="checkbox" name="hotel_option" value="주방" />
									</td>
								</tr>

								<tr>
									<td>아이돌봄 서비스 </td>
									<td><input type="checkbox" name="hotel_option"
										value="아이돌봄 서비스" /></td>
								</tr>

								<tr>
									<td>룸서비스</td>
									<td><input type="checkbox" name="hotel_option"
										value="룸서비스" /></td>
								</tr>

								<tr>
									<td>애완동물 동반</td>
									<td><input type="checkbox" name="hotel_option"
										value="애완동물동반" /></td>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<!-- 호텔 사이트 9-->
				<div class="insert-common-container">
					<div>
						<h3>&nbsp;&nbsp;호텔 사이트</h3>
						<input name="hotel_url" id="hotel_url" type="url"
							placeholder="https://">
					</div>
				</div>

				<!-- 호텔 해시태그 입력 10 -->
				<div class="insert-common-container">
					<div class="insert-hashtag-guide-wrapper">
						<h3>&nbsp;&nbsp;해시태그 입력</h3>
						<ul>
							<li><i class="fas fa-hashtag"></i>해시태그 입력
								예시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								: <b>#호텔</b></li>
							<li><i class="fas fa-hashtag"></i>해시태그 입력 최대글자 수 : <b>6글자</b></li>
							<li><i class="fas fa-hashtag"></i>해시태그 최대
								입력개수&nbsp;&nbsp;&nbsp;&nbsp; : <b>3개</b></li>
						</ul>
					</div>

					<div class="insert-hashtag-wrapper">
						<input type="text" id="input-hashtag" placeholder="해시태그를 입력해주세요.">
						<input type="button" id="input-hashtag-btn" value="해시태그 등록"/>
					</div>

					<!-- 등록된 해시태그들을 모으는 곳. -->
					<div class="saved-hashtags-wrapper">
						<%--해시태그가 존재하지 않으면 --%>
						<p id="no-hashtag"><small>해시태그가 존재하지 않습니다!</small></p>
						
						<%-- 해시태그가 존재한다면  --%>
						<ul id="saved-hashtags">
						</ul>
					</div>
					<script>
						$(function(){
							var checkHashTagsMsg=function(){
								//해시태그 저장리스트
								let savedHashTags = $('#saved-hashtags');
								
								// 저장된 해시태그들
								let $hashTags= savedHashTags.children('li');	
								
								if($hashTags.length==0){
									// 저장된 해시태그가 존재하지 않는다면 (0개 )
									// 해시태그 존재하지 않는다는 문구를 띄운다.
									$('#no-hashtag').css('display', 'block');
								}else{
									//저장된 해시태그가 존재한다면(1개 이상 )
									// 해시태그가 존재하지 않는다는 문구를 안보이게 한다.
									$('#no-hashtag').css('display', 'none');
								}
							};
							
							// 해시태그 등록 버튼 클릭시  발생하는 함수- insert hashtag function
							$('#input-hashtag-btn').on('click', function(){
								//해시태그 저장리스트
								let savedHashTags = $('#saved-hashtags');
								
								// 저장된 해시태그들 
								let $hashTags= savedHashTags.children('li');	
								
								//입력받은 해시태그
								let inputHashTag = $('#input-hashtag').val();
								
								if(inputHashTag.length==0){
									// 입력한 글자수가 0자 
									alert('해시태그를 입력해주세요!');
								}else{
									// 입력한 글자수가 최소 1자 이상
									
									if($hashTags.length<3){
										//저장된 해시태그의 개수가 3개미만 => 추가
										$hashtag_content='<li><span class="hashtag-content"> #'+inputHashTag+'</span><span><i class="remove-hashtag-btn fas fa-times"></i></span></li>'
										savedHashTags.append($hashtag_content);
									}else{
										//저장된 해시태그의 개수가 3개 이상이라면=> 경고창 
										alert('이미 최대 3개 해시태그를 등록했습니다!');
									}
								}
								
								checkHashTagsMsg();
							});
							
						}); 
						
						
						// 해시태그 삭제 버튼을 클릭했을때 실행하는 함수.
						$(document).on('click', '.remove-hashtag-btn' , function(e){
							// 가장 가까운 해시태그를 지운다.
							$(e.currentTarget).closest('#saved-hashtags li').remove();
							
							//해시태그 삭제처리후, 해시태그가 없다는 메시지를 띄워야할지 말아야할지 결정
							checkHashTagMsg();
						});
							
					</script>
				</div>

				<!-- 호텔 등록하기 버튼 -->
				<div id="btn-container">
					<input type="submit" id="insert-hotel-btn" value="등록 하기" />
				</div>
			</form>
		</div>
	</div>
</body>
</html>