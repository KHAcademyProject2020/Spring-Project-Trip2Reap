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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">

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
					<div>
						<p style="color: #913716;">* 는 필수 입력사항 입니다!</p>
					</div>
					<div>
						<input id="hotel_name" name="hotel_name"
							placeholder="* 호텔이름을 입력해주세요" type="text">
					</div>
				</div>

				<!--호텔 메인 썸네일 이미지 등록2 -->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 메인 이미지 등록</h3>
					</div>
					<div>
						<input type="file" name="thumbnail_img" id="thumbnail_img"
							accept="images/*" /> <label id="thumbnail_img_label"
							for="thumbnail_img">썸네일 이미지 찾아보기</label> <span
							class="img_upload_status_info" id="thumbnail_img_name">사진을
							업로드 해주세요!</span>
					</div>

				</div>

				<!-- 호텔 디테일 이미지 등록 3-->
				<div class="insert-common-container">
					<div>
						<h3>&nbsp;&nbsp;호텔 디테일 이미지 등록</h3>
					</div>
					<div>
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
				</div>

				<!--호텔 도로명 주소 4 -->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 도로명 주소</h3>
					</div>
					<div class="search_hotel_addr_wrapper">
						<input id="search_hotel_addr_btn" type="button" value="주소 찾기">
						<input type="text" readonly placeholder="호텔 도로명 주소를 입력해주세요!"
							name="hotel_address" id="hotel_address">
					</div>
				</div>

				<!-- 호텔 객실 정보 입력 5-->
				<div class="insert-common-container">
					<div>
						<h3>* 호텔 객실 정보</h3>
					</div>

					<div class="insert-hotel-info-wrapper">

						<!-- 호텔객실 정보 입력창 1 (disable delete)-->
						<div class="one-room-info-insert">
							<div class="room_btn_remote_controller_wrapper">
								<div class="insert_room_name">
									<input type="text" class="room_name" placeholder="객실 이름 입력"
										name="room_name">
								</div>

								<div>
									<ul class="room_btn_remote_controller">
										<li><i class="fas fa-angle-up"></i></li>
										<li><i class="fas fa-angle-down"></i></li>
										<!-- <li><i class="fas fa-minus"></i></li> -->
									</ul>
								</div>
							</div>

							<div class="insert_hotel_details">
								<div class="insert_room_kinds">
									<span class="room_kind_label">등록 객실 종류</span> <select>
										<option value="">객실 종류 선택</option>
										<option value="싱글룸">싱글룸</option>
										<option value="더블룸">더블룸</option>
										<option value="트윈룸">트윈룸</option>
										<option value="패밀리 트윈룸">패밀리 트윈룸</option>
										<option value="디럭스 트윈룸">디럭스 트윈룸</option>
										<option value="스위트룸">스위트룸</option>
										<option value="스튜디오룸">스튜디오룸</option>
										<option value="트리플룸">트리플룸</option>
										<option value="온돌룸">온돌룸</option>
										<option value="싱글 더블룸">싱글 더블룸</option>
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
										<li><i class="fas fa-angle-up"></i></li>
										<li><i class="fas fa-angle-down"></i></li>
										<li><i class="fas fa-minus"></i></li>
									</ul>
								</div>
							</div>

							<div class="insert_hotel_details">
								<div class="insert_room_kinds">
									<span class="room_kind_label">등록 객실 종류</span> <select>
										<option value="">객실 종류 선택</option>
										<option value="싱글룸">싱글룸</option>
										<option value="더블룸">더블룸</option>
										<option value="트윈룸">트윈룸</option>
										<option value="패밀리 트윈룸">패밀리 트윈룸</option>
										<option value="디럭스 트윈룸">디럭스 트윈룸</option>
										<option value="스위트룸">스위트룸</option>
										<option value="스튜디오룸">스튜디오룸</option>
										<option value="트리플룸">트리플룸</option>
										<option value="온돌룸">온돌룸</option>
										<option value="싱글 더블룸">싱글 더블룸</option>
										<option value="슈페리어룸">슈페리어룸</option>
										<option value="이그제큐티브룸">이그제큐티브룸</option>
										<option value="커넥팅룸">커넥팅룸</option>
										<option value="프리미어룸">프리미어룸</option>
										<option value="이코노미룸">이코노미룸</option>
									</select>
								</div>


							</div>
						</div>


						<div class="insert-hotel-btn-container">
							<i class="fas fa-plus" id="add_room_btn"></i>
						</div>
					</div>
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
									<td>스파</td>
									<td><input type="checkbox" name="hotel_option" value="스파" />
									</td>
								</tr>

								<tr>
									<td>사우나</td>
									<td><input type="checkbox" name="hotel_option" value="사우나" />
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
									<td>발렛파킹</td>
									<td><input type="checkbox" name="hotel_option"
										value="발렛파킹" /></td>
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
						<input type="button" id="input-hashtag-btn"
							onclick="insertHashTags();" value="해시태그 등록" />
					</div>

					<!-- 등록된 해시태그들을 모으는 곳. -->
					<div class="saved-hashtags-wrapper">
						<ul id="saved-hashtags">
							<li><small>해시태그가 없습니다!</small></li>
							<li><small>해시태그가 없습니다!</small></li>
							<li><small>해시태그가 없습니다!</small></li>
						</ul>
					</div>
					<script>
						// insert hashtag function
						function insertHashTags() {

							//입력받은 해시태그
							let inputHashTag = $('input-hashtag').val();
							console.log(inputHashTag);

							//해시태그 저장리스트
							let hashTags = $('#saved-hashtags');

							hashTags.empty();
							hashTags.append('<li><small>' + inputHashTag
									+ '</small>');
						}
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