<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국방방곡곡 | 나만의 여행코스</title>
      <!--  myPageCourse.css -->
      <link rel="stylesheet" href="resources/css/member/myPageCourse.css">
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
    <!-- 나만의 여행코스 설명란  -->
        <div>
            <div id="infor1"></div>
            <div id="infor2"></div>
            <div id="infor3"><i class="fas fa-map-signs" id="myCourseIcon"></i>나만의 여행코스</div>            
        </div>
     </div>
          
	        <c:if test = "${ empty list }">
	        <div id="all_div">
	            <div id="emptyDiv">
	            <div id="up_space1"></div>
				<div id="emptyCourse">나의 여행코스 목록이 없습니다.</div>
				<div id="up_space1"></div>
				<button id="myCourseBtn">여행코스 보러가기</button>
				<div id="up_space1"></div>
				</div>
			</div>
			</c:if>
			<div id="all_div2">
			<c:forEach var="list" items="${ list }">			
			    <div id="listDiv">
			         <div id="listDiv2">
			             <img src="resources/courseFiles/${ list.changeName }" id="listImg" />
			             <label id="listTitle">${ list.courseTitle }</label> 
			             <label id="listId">@${ list.courseWriter }</label>
			             <label id="listDistance">총 거리 : ${ list.distance }km</label>
			         </div>
			         
			         <div id="day1">
                          <label id="dayLabel">★</label>                         
                     </div>
                     <label id="dayLabel2">여행 코스</label>
                     <input type="hidden" id="nameHidden" value="${ list.courseName }">
                     <div id="nameDiv">
                     <c:set var="name" value="${ list.courseName }"/>
                     <c:set var="nameArr" value="${fn:split(name,',')}"/>
                     
                     <c:forEach var="i" begin="0" end="${fn:length(nameArr)-1}">
                         <div id="nameLabel">
                              <label id="dayLabel3">${ i+1 }</label>
                         </div>
                         <div id="nameLabel2">${ nameArr[i] }</div>
                         <div></div>
                     </c:forEach>
                     <div id="detailBtn"><label id="detailLabel">자세히보기</label></div>                    
                     </div>                  
			     </div>
			</c:forEach>				
	    </div>
     </section>
     <div id="footerSpaces"></div>
     <footer>
   	        <c:import url="../common/footer.jsp" />
	 </footer>

     <script>
          $('#myCourseBtn').click(function(){
   	         location.href="<%= request.getContextPath() %>/courseList.co";
          });
     </script>
</body>
</html>