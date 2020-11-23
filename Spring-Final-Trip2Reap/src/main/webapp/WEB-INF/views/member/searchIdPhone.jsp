<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <header>
    <%@ include file="../common/menubar.jsp" %>
    </header>    

    <!-- 리스트가 존재하지 않으면  -->
    <c:if test="${ empty list }">
        <div id="noId">아이디가 존재하지 않습니다.</div>
    </c:if>
    
    <!-- 리스트가 존재하면  -->
    <c:if test="${ !empty list }">
    <p>아이디 존재</p>
        <c:forEach var="list" items="${ list }">
           <div id="searchId">${ list.memberId }</div>
        </c:forEach>
    </c:if>

</body>
</html>