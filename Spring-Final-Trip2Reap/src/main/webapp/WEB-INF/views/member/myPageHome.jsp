<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
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
호텔 예약내역 페이지
</body>
</html>