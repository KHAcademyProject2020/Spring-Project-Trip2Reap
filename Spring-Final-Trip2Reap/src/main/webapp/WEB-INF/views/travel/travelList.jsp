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
		<div id="menubar_div">
			<div id="menu_div">
				<div id="menu_left_div">
					<i class="fas fa-suitcase-rolling" id="menu_img"></i>
					<span id="menu">여행지</span>
				</div>
				<div id="menu_right_div">
					<input type="text" id="input_search" />
					
					<button id="button_search" onclick="goSearchError()">검색</button>
				</div>
			</div>
			
			<!-- 해쉬태그 카테고리 -->
			<div id="hashtag_div">
				<ul id="hashtag_ul">
					<li>
						<a href=" ${pageContext.request.contextPath}/tList.tv">#전체</a>&nbsp;&nbsp; <!-- 해당 해쉬태그 검색페이지로 이동하게 수정. 검색기능12/9까지-->
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
		</div>
		
		<!-- 지역/테마 카테고리 -->
		<div id="cate_table_div">
			<span id="cate_name">&nbsp;지역</span>
				<span id="cate_icon">🚕</span>
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
			
			<span id="cate_name">&nbsp;테마</span>
				<span id="cate_icon">🚗</span>
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
				총<span id="list_count">${ pi.listCount }</span>건
			</div>
			
			
			 
			
			<!-- 여행지 div -->
			<c:if test = "${ list eq null }">
				<div>조회결과가 없습니다.</div>
			</c:if>
			<c:forEach var="t" items="${ list }">
			
			<div id="list_travel_div">
				<div id="travel_img_div">
					<c:if test="${t.changeName != null }"> <!-- insert로 등록한 여행지 -->
					 <img src="resources/travelFiles/${ t.changeName }" id="travel_img" /> 
					</c:if>
					
					<c:if test="${t.changeName == null }"> <!-- db에 들어가있던 여행지 -->
					<img src="resources/images/송도" id="travel_img" /> 
					</c:if>
				</div>
				
				<div id="travel_name_writer_div">
					<div id="travel_no">${ t.boNo }</div>
					<c:url var="tdetail" value="tDetail.tv">
						<c:param name="boNo" value="${ t.boNo }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>	
					<div id="travel_name">
						<a href="${ tdetail }">${ t.boTitle }</a>
						<c:if test="${ travel.boCount > 20 }"> <!-- 조회수가 20이상인 게시글은 아이콘표시 왜 안되는거지 -->
								
								<img src="resources/images/promotional.png" width="30px" height="30px"> 
							
						</c:if>
					</div>
					<div id="travel_theme">${ t.trTheme }</div>
					<div id="travel_writer">${ t.trReg }</div>
					<div id="travel_tag">#${ t.boTag }</div>
				</div>
				<div id="list_etc"><a href="#modal">…</a></div>
			</div>
			
			</c:forEach>
			
		</div>
			
		
		
		
		
		<!--  등록하기 버튼 (관리자만 보이게 ) --> 
		
			 <c:if test="${ loginUser.memberId == 'admin' }">  
				<div id="button_write_div">
					<button id="button_write" onclick= "location.href='tInsertView.tv'">등록하기</button>
				</div>
		 	</c:if>
	 
			
			
			<!-- 페이징 -->
			<div class="paging">
			
				<!-- 이전 페이지 -->
				<c:if test="${ pi.currentPage <= 1 }">이전페이지
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="tList.tv">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>	
				<a href="${ before }" class="bt" id="beforeBtn">이전 페이지</a>
			</c:if>
				

				<!-- 페이지 -->
			
					
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<a href="${ pagination }" class="num on">${ p }</a> &nbsp;
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="tList.tv">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }" class="num">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
			
                
                <!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					다음 페이지
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="tList.tv">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }" class="bt" id="afterBtn">다음 페이지</a>
				</c:if>
                
			</div><!-- 페이징 div끝 -->
			

		
		
	</div><!-- 전체 div끝 -->
	
	
	
	
	
	   <!-- modal 시작  -->
		<div id="modal" class="modal">
		    <div id="share_div">
		    	<i class="fas fa-share-alt"></i><span id="mo_share">공유하기</span>
		    	<button class="url_btn" id="sh-link">URL복사</button>
		    </div>
		    <hr id="mo_hr">
		    <div id="contain_div">
		    	<i class="fas fa-download" ></i><span id="mo_contain">여행지 담기</span>
		    	<button class="url_btn" onclick="containTravel()">추가하기</button>
		    	<div id="contain_info">[마이페이지]-[담은 여행지]에서 확인할 수 있습니다.</div>
		    </div>
		</div>
   
   	 <!-- modal끝 -->
   	 
   	 
	<script>
		function detailView(){
 		   location.href="<%= request.getContextPath() %>/tDetail.tv";
 	    }
		
		function goSearchError(){
			location.href="<%= request.getContextPath() %>/tSearchError.tv";
		}
		
		
		//modal창
		$('a[href="#modal"]').click(function(event) {
			event.preventDefault();

			$(this).modal({
				fadeDuration : 250
			});
		});
		
		function containTravel(){
			swal("여행지를 담았습니다","마이페이지에서 확인하세요","success");//이미 담은 여행지이거나 로그인하지않은경우 담기지 않아야함.(추후수정필요) 
		}
		
		
		
		//url복사하기
		$(document).on("click", "#sh-link", function(e) { // 링크복사 시 화면 크기 고정 
			$('html').find('meta[name=viewport]').attr('content', 'width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no'); 
			var html = "<input id='clip_target' type='text' value='' style='position:absolute;top:-9999em;'/>"; 
			$(this).append(html); 
			
			var input_clip = document.getElementById("clip_target"); 
				//현재 url 가져오기 -> 해당 여행지 url 가져오기로 수정완 (12/12)
				var _url = $(location).attr("location.href='tDetail.tv?boNo=${t.boNo}&page={pi.currentPage}'"); 
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
						$('html').find('meta[name=viewport]').attr('content', 'width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes'); 
					} else { 
						swal("URL이 복사에 실패했습니다.", "이 브라우저는 지원하지 않습니다.", "error");
						} 
					} catch (err) { 
						swal("URL이 복사에 실패했습니다.", "이 브라우저는 지원하지 않습니다.", "error");
						} 
			}); //클립보드 복사 기능 끝

		
			
			$("#button_write").click(function(){
	   			$('#tList').submit();
	   		 }); 
		
			
	</script>
	
</section>
</body>
</html>