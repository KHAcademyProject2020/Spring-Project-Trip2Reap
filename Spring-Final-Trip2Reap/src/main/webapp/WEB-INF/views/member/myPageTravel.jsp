<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 내가 담은 여행지</title>
      <!--  myPageTravel.css -->
      <link rel="stylesheet" href="resources/css/member/myPageTravel.css"> 
      <link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
</head>
<body>
    <header>
    <%@ include file="../common/menubar.jsp" %>
    
    <c:if test="${ loginUser.mCategory eq 'member' }">    
    <%@ include file="../member/myPage.jsp" %>    
    </c:if>
    
    <c:if test="${ loginUser.mCategory ne 'member' }">    
    <%@ include file="../member/myPage_kakao_naver.jsp" %>    
    </c:if>
    </header>
    
    <section>
    <div id="board_list">
    <!-- 내가 담은 여행지 설명란  -->
        <div>
            <div id="infor1"></div>
            <div id="infor2"></div>
            <div id="infor3">내가 담은 여행지</div>            
        </div>
        <div id="up_space1"></div>
     </div>
     
     <div id="list_all_div">			
			<!-- 여행지 div -->
			<c:if test = "${ list eq null }">
				<div>등록하신 여행지 목록이 없습니다.</div>
			</c:if>
			<c:forEach var="t" items="${ list }">
			
			<div id="list_travel_div">
				<div id="travel_img_div">
					<c:if test="${t.change_name != null }"> <!-- insert로 등록한 여행지 -->
					 <img src="resources/travelFiles/${ t.change_name }" id="travel_img" /> 
					</c:if>
					
					<c:if test="${t.change_name == null }"> <!-- db에 들어가있던 여행지 -->
					<img src="resources/images/송도" id="travel_img" /> 
					</c:if>
				</div>
				
				<div id="travel_name_writer_div">
					<div id="travel_no">${ t.boNo }</div>
					<input type="hidden" class="boNo_hidden" value="${ t.boNo }">
					
					<c:url var="tdetail" value="tDetail.tv">
						<c:param name="boNo" value="${ t.boNo }"/>
						<c:param name="page" value="1"/>
					</c:url>	
					
					<div id="travel_name">
						<a href="${ tdetail }">${ t.bo_title }
							<c:if test="${ t.boCount > 30 }"> 
								<img src="resources/images/promotional.png" width="25px" height="25px"> 
							</c:if>
						</a>	
					</div>
					
					<div id="travel_theme">${ t.tr_theme }</div>
					<div id="travel_tag">#${ t.bo_Tag }</div>
				
						  <div id="travel_tag">

		        					<!-- 해쉬태그  -->
		                        </div>
				</div>
				<!-- 삭제하기  -->
			</div>
			
			</c:forEach>
			
		</div>
     </section>
     
     <div style="height: 300px;"></div>
</body>
</html>