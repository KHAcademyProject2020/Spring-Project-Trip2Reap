<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/common/remote_control.css">

<body>
	<div class="total_remote">
	
		<div class="remote_container" id="hotel_remote_control">
			<div class="remote_banner_container">
				<i class="fas fa-hotel remote_icon"></i>&nbsp; 내가 본 호텔
			</div>
			<ul class="remote_ul" id="hotel_remote_ul">
			</ul>
		</div>

		
		<div class="remote_container"  id="course_remote_control">
			<div class="remote_banner_container">
				<i class="fas fa-map-signs remote_icon"></i>&nbsp; 내가 본 코스
			</div>
			<ul class="remote_ul" id="course_remote_ul">
			</ul>
		</div>


		<%--기쁨- 카카오 채팅방 시작--%>
		<div class="remote_container">
			<div class="remote_banner_container kakao_chat">카카오 상담</div>
		</div>
		<%--기쁨 카카오 채팅방 끝 --%>
	</div> <%--div.total_remote (리모컨전체 끝)--%>
</body>

</html>