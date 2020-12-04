<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/travel/travelInsert.css"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<header>
   	 <c:import url="../common/menubar.jsp" />
	</header>
	<!-- 전체 div -->
	<div id="all_div">
	<form action="tInsert.tv" method="post" enctype="Multipart/form-data" id="tInsert"><!-- 첨부파일 등록을 위해 Multipart/form-data encType 지정  -->
		<!-- 메뉴 이름 div -->
		<div id="menu_div">
			<div id="menu_left_div">
				<i class="fas fa-suitcase-rolling" id="menu_img"></i>
				<span id="menu">여행지 등록하기</span>
			</div>
		</div>
		
		<!-- 작성하기 div 시작 -->
		<div id="insert_div">
			<div id="info_ment_div">
		
				<span class="astro_span">*은 필수 입력 사항입니다.</span>
			</div>
			
			
			<!-- 사진첨부 div -->
			<div id="titleImgArea" class="pictureArea">
				<img id="titleImg"/>
			</div>
			 <div id="contentImgArea1" class="pictureArea">
				<img id="contentImg1"/>
			</div>
			<div id="contentImgArea2" class="pictureArea">
				<img id="contentImg2"/>
			</div>
			
			<div id="titleImgTxt">
				<div class="pictureName">
					<span class="astro_span">*</span>대표이미지
				</div>
			</div>
			<div id="contentImgTxt">
				<div class="pictureName">내용이미지1</div>
			</div>
			<div id="contentImgTxt">
				<div class="pictureName">내용이미지2</div>
			</div>
			
			
			<input type="text" id="member_id" name="memberId" value="${ loginUser.memberId }"/>
			<!-- <input type="text" id="member_id" name="boDeleteYN" value=""/ -->
			
			
			<!-- 작성하기 table 시작 -->	
			<table id="travel_table">
				<tr>
			   		 <td>
			   			 <span class="astro_span">*</span><span>사진첨부</span></td>
			   		 <td colspan="6">
			   			
						<span id="span_text">&nbsp;&nbsp;&nbsp;&nbsp;이미지파일(PNG, JPG)만 첨부 가능합니다.</span>
			   		 </td>
				</tr>
				<tr>
					<td>
						<span class="astro_span">*</span><span>코스명</span>
					</td>
					<td colspan="5">
						<input type="text" id="travel_name" name="boTitle"/>
					</td>
				</tr>
				<tr>
					<td>
						<span class="astro_span">*</span><span>지역</span>
					</td>
					<td>
						<select id="select_region" name="trReg">
							<option value = "0">----------------</option>
							<option value = "서울">서울</option>
							<option value = "인천">인천</option>
							<option value = "대전">대전</option>
							<option value = "대구">대구</option>
							<option value = "광주">광주</option>
							<option value = "부산">부산</option>
							<option value = "울산">울산</option>
							<option value = "세종">세종</option>
							<option value = "경기">경기</option>
							<option value = "강원">강원</option>
							<option value = "충북">충북</option>
							<option value = "충남">충남</option>
							<option value = "경북">경북</option>
							<option value = "경남">경남</option>
							<option value = "전북">전북</option>
							<option value = "전남">전남</option>
							<option value = "제주">제주</option>
						</select>
					</td>
					<td>
						<span class="astro_span">*</span><span>테마</span>
					</td>
					<td colspan="3">
						<select id="select_theme" name="trTheme">
							<option value = "0">----------------</option>
							<option value = "관광지">관광지</option>
							<option value = "음식점">음식점</option>
							<option value = "명소">명소</option>
							<option value = "축제">축제</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<span class="astro_span">*</span><span>주소</span>
					</td>
					<td colspan="6"> <!-- 카카오 주소 API -->
						<input type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="주소" name="trAddr"><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">

					</td>
				</tr>
				
			</table>
			
			
			<div id="menu_hash">해쉬태그</div>
			
			<!-- 해쉬태그 입력창 -->
			<div class="insert-hashtag-wrapper">
				<input type="text" id="input-hashtag"  placeholder="#해시태그를 입력해주세요." name="boTag">
				<input type="button" id="input-hashtag-btn"
					onclick="insertHashTags();" value="✅"></div>
	
			<!-- 등록된 해시태그들을 모으는 곳. -->
			<div class="saved-hashtags-wrapper">
				<ul id="saved-hashtags">
					<li><small>#해시태그1<button id="delete_hash">⛔</button></small></li>
					<li><small>#해시태그2<button id="delete_hash">⛔</button></small></li>
					<li><small>#해시태그3<button id="delete_hash">⛔</button></small></li>
				</ul>
			</div>
			
			 <div id="travel_content_div">
				<textarea rows="20" cols="125" id="travel_content" name="boContent"></textarea>
				  <div id="text_count_div">
					<span>현재 글자 수 </span>
					<span id="text_count">8</span>
					<span>자 / 최대 글자 수 2000자</span>
				 </div>
			</div>
			
			
		</div><!-- 전체 div 끝 -->
		
		
		<div id="fileArea">	<!-- 파일 업로드 부분 -->
	   			<input type="file" id="thumbnailImg1" multiple="multiple" name="uploadFile1" onchange="LoadImg(this,1)"/>
	   			 <input type="file" id="thumbnailImg2" multiple="multiple" name="uploadFile2" onchange="LoadImg(this,2)"/>
	   			<input type="file" id="thumbnailImg3" multiple="multiple" name="uploadFile3" onchange="LoadImg(this,3)"/>
	   	</div>		
		
		
		<!-- 버튼 div -->
		<div id="button_div">
			<!-- <button id="button_cancel" onclick="location.href='tList.tv'">취소</button>
			<button id="button_write" onclick="location.href='tInsert.tv'">등록</button> -->
			<button type="button" id="button_cancel" onclick= "location.href='tList.tv'">취소</button>
			<button type="submit" id="button_write">등록</button>
			<!-- <button id="button_write">등록</button> -->
		</div>
	</form>
	</div>
	
	<script>
	// 사진 업로드 시 자리 지정
   		$(function(){
   			$("#fileArea").hide();
   			
   			$("#titleImgArea").click(function(){
   				$("#thumbnailImg1").click();
   			});
   			$("#contentImgArea1").click(function(){
   				$("#thumbnailImg2").click();
   			});
   			$("#contentImgArea2").click(function(){
   				$("#thumbnailImg3").click();
   			});
   		});
   		
   		 // 이미지 업로드 함수
   		function LoadImg(value, num){
   			if(value.files && value.files[0]){
   				var reader = new FileReader();
   				
   				reader.onload = function(e){
   					switch(num){
   					case 1:
   						$('#titleImg').attr("src", e.target.result);
   						break;
   					case 2:
   						$('#contentImg1').attr("src", e.target.result);
   						break;
   					case 3:
   						$('#contentImg2').attr("src", e.target.result);
   						break;
   					}
   				}
   				reader.readAsDataURL(value.files[0]);
   			}	   			
   		} 
   		 
   		 $("#button_write").click(function(){
   			$('#tInsert').submit();
   		 });
   		 
   		 
   		 
	</script>
	
	
	<!-- 주소 API -->
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
	</script>



</section>		
</body>
</html>