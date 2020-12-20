<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 여행지</title>
<link rel="stylesheet" type="text/css"
	href=" ${pageContext.request.contextPath}/resources/css/travel/travelList.css" />
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/images/favicon.ico"
	type="image/x-icon">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>


</script>
</head>
<body>
	<section>
		<header>
			<c:import url="../common/menubar.jsp" />
		</header>
		<div id="all_div">
			<div id="menubar_div">
				<div id="menu_div">
					<div id="menu_left_div">
						<i class="fas fa-suitcase-rolling" id="menu_img"></i> <span
							id="menu">여행지</span>
					</div>
					<div id="menu_right_div">
						<input type="search" id="input_search" placeholder="검색할 여행지명을 입력하세요" />

						<button id="button_search" type="reset">검색</button> <!--  onclick="goSearchError()" -->
					</div>
				</div>

				<!-- 해쉬태그 카테고리 -->
				<div id="hashtag_div">
					<ul id="hashtag_ul">
						<li><a
							href=" ${pageContext.request.contextPath}/tList.tv?hashTag=전체">#전체</a>&nbsp;&nbsp;
						</li>
						<li><a
							href=" ${pageContext.request.contextPath}/tList.tv?hashTag=문화시설">#문화시설</a>&nbsp;&nbsp;
						</li>
						<li><a
							href=" ${pageContext.request.contextPath}/tList.tv?hashTag=걷기좋은">#걷기좋은</a>&nbsp;&nbsp;
						</li>
						<li><a
							href=" ${pageContext.request.contextPath}/tList.tv?hashTag=쇼핑">#쇼핑</a>&nbsp;&nbsp;
						</li>
						<li><a
							href=" ${pageContext.request.contextPath}/tList.tv?hashTag=자연">#자연</a>&nbsp;&nbsp;
						</li>
						<li><a
							href=" ${pageContext.request.contextPath}/tList.tv?hashTag=맛집">#맛집</a>&nbsp;&nbsp;
						</li>
					</ul>
				</div>
			</div>

			<!-- 지역/테마 카테고리 -->
			<div id="cate_table_div">
				<span id="cate_name">&nbsp;지역</span> <span id="cate_icon">🚕</span>
				<table id="local_table">
					<tr class="localSelectTr">
						<td id="selectAllTd">전체</td>
						<td id="서울">서울</td>
						<td id="인천">인천</td>
						<td id="대전">대전</td>
						<td id="대구">대구</td>
						<td id="광주">광주</td>
						<td id="부산">부산</td>
						<td id="울산">울산</td>
						<td id="세종">세종</td>
					</tr>
					<tr class="localSelectTr">
						<td id="경기">경기</td>
						<td id="강원">강원</td>
						<td id="충북">충북</td>
						<td id="충남">충남</td>
						<td id="경북">경북</td>
						<td id="경남">경남</td>
						<td id="전북">전북</td>
						<td id="전남">전남</td>
						<td id="제주">제주</td>
					</tr>
				</table>

				<span id="cate_name">&nbsp;테마</span> <span id="cate_icon">🚗</span>
				<table id="theme_table">
					<tr>
						<td>전체</td>
						<td id="관광지">관광지</td>
						<td id="음식점">음식점</td>
						<td id="명소">명소</td>
						<td id="축제">축제</td>
					</tr>
				</table>
			</div>



			<div id="list_all_div">
				<div id="list_count_div">
					총<span id="list_count">${ pi.listCount }</span>건
				</div>




				<!-- 여행지 div -->
				<c:if test="${ list eq null }">
					<div>조회결과가 없습니다.</div>
				</c:if>
				<c:forEach var="t" items="${ list }" varStatus="s">
				   <c:set var="Img" value="${ t.changeName }"></c:set>
                    <c:set var="ImgAr" value="${fn:split(Img,',')}">
                    </c:set>
					<div id="list_travel_div">
						<div id="travel_img_div">
							<c:if test="${t.changeName != null }">
								<!-- insert로 등록한 여행지 -->
								<img src="resources/travelFiles/${ ImgAr[0] }"
									id="travel_img" />
							
							</c:if>

							<c:if test="${t.changeName == null }">
								<!-- db에 들어가있던 여행지 -->
								<img src="resources/images/송도" id="travel_img" />
							</c:if>
						</div>

						<div id="travel_name_writer_div">
							<div id="travel_no">${ t.boNo }</div>
							<input type="hidden" class="boNo_hidden" value="${ t.boNo }">
							<c:url var="tdetail" value="tDetail.tv">
								<c:param name="boNo" value="${ t.boNo }" />
								<c:param name="page" value="${ pi.currentPage }" />
							</c:url>
							<div id="travel_name">
								<a href="${ tdetail }">${ t.boTitle } <c:if
										test="${ t.boCount > 30 }">
										<!-- 조회수가 30이상인 게시글은 아이콘표시 왜 안되는거지 -->
										<img src="resources/images/promotional.png" width="25px"
											height="25px">
									</c:if>
								</a>
							</div>

							<div id="travel_theme">${ t.trTheme }</div>
							<div id="travel_writer">${ t.trReg }</div>
							<div id="travel_tag">
								<p class="hashTag" id="hashTag${ t.boNo }" style="display: none"></p>
								<br> <input type="hidden" value=${ t.boNo } id="hashTagVal" />
								<script>
						var hashTag = "${ t.boTag }";
						var hash = hashTag.split('#');
						var size = hash.length;
						for(var i=1; i < size; i++){
							
							$('.hashTag').eq(${s.index}).append("<span class='hashTagSpan'>#"+hash[i]+"</span>&nbsp;&nbsp;")
						}
						$(".hashTag").css("display", "");
					</script>
							</div>
						</div>
						<div id="list_etc" class="dotClass">
							<a href="#modal" id="list_etc_modal">…</a>
						</div>
					</div>

				</c:forEach>


			</div>




			<!--  등록하기 버튼 (관리자만 보이게 ) -->

			<c:if test="${ loginUser.memberId == 'admin' }">
				<div id="button_write_div">
					<button id="button_write" onclick="location.href='tInsertView.tv'">등록하기</button>
				</div>
			</c:if>



			<!-- 페이징 -->
			<div class="paging">

				<!-- 이전 페이지 -->
				<c:if test="${ pi.currentPage <= 1 }">이전페이지
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="tList.tv">
						<c:param name="page" value="${ pi.currentPage - 1 }" />
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
							<c:param name="page" value="${ p }" />
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
						<c:param name="page" value="${ pi.currentPage + 1 }" />
					</c:url>
					<a href="${ after }" class="bt" id="afterBtn">다음 페이지</a>
				</c:if>

			</div>
			<!-- 페이징 div끝 -->

			<input type="hidden" id="travelUserInfo"
				value="${ loginUser.memberId }"> <input type="hidden"
				id="travelBoInfo" value="">


		</div>
		<!-- 전체 div끝 -->





		<!-- modal 시작  -->
		<div id="modal" class="modal">
			<div id="share_div">
				<i class="fas fa-share-alt"></i><span id="mo_share">공유하기</span>
				<button class="url_btn" id="sh-link">URL복사</button>
			</div>
			<hr id="mo_hr">
			<div id="contain_div">
				<i class="fas fa-download"></i><span id="mo_contain">여행지 담기</span>
				<button class="url_btn" id="myTravel">추가하기</button>
				<div id="contain_info">[마이페이지]-[담은 여행지]에서 확인할 수 있습니다.</div>
			</div>
		</div>

		<!-- modal끝 -->


		<script>
	
		
		function detailView(){
 		   location.href="<%=request.getContextPath()%>/tDetail.tv";
 	    }
		
		<%-- function goSearchError(){
			location.href="<%= request.getContextPath() %>/tSearchError.tv";
		} --%>
		
		//등록하기 버튼 누르면 insert로 넘어감.
		$("#button_write").click(function(){
   			$('#tList').submit();
   		 }); 
	
		
		
		
	      
	    $("#local_table td").click(function(){
		var reg = $(this).attr('id')
		
		if(reg == "서울") {
			reg = "서울"
		}
		if(reg == "인천") {
			reg = "인천"
		}
		if(reg == "대전") {
			reg = "대전"
		}
		if(reg == "대구") {
			reg = "대구"
		}
		if(reg == "광주") {
			reg = "광주"
		}
		if(reg == "부산") {
			reg = "부산"
		}
		if(reg == "울산") {
			reg = "울산"
		}
		if(reg == "세종") {
			reg = "세종"
		}
		if(reg == "경기") {
			reg = "경기"
		}
		if(reg == "강원") {
			reg = "강원"
		}
		if(reg == "충북") {
			reg = "충북"
		}
		if(reg == "충남") {
			reg = "충남"
		}
		if(reg == "경북") {
			reg = "경북"
		}
		if(reg == "경남") {
			reg = "경남"
		}
		if(reg == "전북") {
			reg = "전북"
		}
		if(reg == "전남") {
			reg = "전남"
		}
		if(reg == "제주") {
			reg = "제주"
		}
		
		
		
		
		location.href = "tList.tv?"+reg;
		
	})
	
	  $("#theme_table td").click(function(){
		var tm = $(this).attr('id')
		
		if(tm == "관광지") {
			tm = "관광지"
		}
		if(tm == "음식점") {
			tm = "음식점"
		}
		if(tm == "명소") {
			tm = "명소"
		}
		if(tm == "축제") {
			tm = "축제"
		}
		location.href = "tList.tv?"+tm;
	  })	
	      
	      //해쉬태그 span을 누르면 해당 해시태그 검색창으로.
		$(document).on("click",".hashTagSpan",function(){
	         var hashParam = $(this).parent().parent().find('.hashTagSpan').text();
	         hashParam = hashParam.split("#")
	      	hashParam = hashParam[1]
			
        	 location.href = "tList.tv?hashTag="+hashParam;
			});
			 	
		
	    //검색창
	    $("#button_search").click(function(){
			var search = $('#input_search').val()
			if($('#input_search').val()== ""){
				search = "title" = $('#input_search').val()
			}
			location.href = "tList.tv?"+search;
			
		})
		
	    /*   $("#search").bind('keydown', function(key) {
	               if (key.keyCode == 13) {
	            		$(".search").trigger('click')
	            		$("#search").unbind()

	             }
	      }) */
	      

		
		
		//modal창 -----------------------------------------------------
		//$('a[href="#modal"]').click(function(event) {
		$(document).on("click","#list_etc_modal",function(){
         var current = $(this).parent().parent().find('#travel_no').text();
         $('#travelBoInfo').val(current);
      
         event.preventDefault();

         $(this).modal({
            fadeDuration : 250
         });
      });
		
		
		//function travelContain(){}
		$(document).on("click","#myTravel",function(){
	         var memberId = $('#travelUserInfo').val();
	         var boNo = $('#travelBoInfo').val();
	         
	         if(memberId == ""){
	            swal("로그인 후 이용가능합니다🙋");
	         } else {            
	            $.ajax({
	                   url : 'myTravel.me',
	                  type : 'post',
	                  data : {boNo:boNo,memberId:memberId},
	                  success : function(data){
	                      console.log("data : " + data); 
	                     if(data == "Y"){
	                        swal("여행지 담기에 성공하였습니다.\n마이페이지에서 확인해주세요😊");      
	                     } else if(data == "E") {
	                        swal("이미 담긴 여행지입니다🙋");
	                     } else {
	                        swal("여행지 담기에 실패하였습니다🙋");
	                      } 
	                    },
	                    error : function(data){
	                       console.log("서버 실패");
	                    }
	                 });
	         }                   
	      });   
		
		
		
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

		
			
			
			
		
	</script>

	</section>
</body>
</html>