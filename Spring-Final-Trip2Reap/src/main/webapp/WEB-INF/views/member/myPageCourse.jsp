<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나만의 여행코스</title>
      <!--  myPageCourse.css -->
      <link rel="stylesheet" href="resources/css/member/myPageCourse.css">
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
            <div id="infor3">나만의 여행코스</div>            
        </div>
        <div id="up_space1"></div>
     </div>
     </section>
     
     <div style="height: 300px;"></div>
</body>
</html>