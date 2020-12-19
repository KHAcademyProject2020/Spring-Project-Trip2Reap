<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/common/remote_control.css">

<body>
	<%--2020.12.19 --%>
	<div class="total_remote">
	
		<%--(은강) 내가 본 호텔 조회 리모콘 시작(은강)--%>
		<div class="remote_container" id="hotel_remote_control">
			<div class="remote_banner_container">최근에 본 호텔</div>
			<ul class="remote_ul" id="hotel_remote_ul">
			</ul>
		</div>

		<%--(은강) 내가 본 호텔 리모콘 끝 --%>
		
		
		
		<%--내가 본 코스 리모컨(기쁨) --%>
		<%--<c:if test="${}"> --%>
			<div class="remote_container">
				<div class="remote_banner_container">내가 본 코스</div>
				
				<ul class="remote_ul" id="course_remote_control">
				
					<li class="remote_li">
						<a>
							<span>
								<img src="resources/images/sample_hotel.jpg" alt="호텔이미지" class="remoteImg"/>
							</span>
							<span class="remoteName">코스이름</span>
						</a>
					</li>
				</ul>
			</div>
		<%--</c:if> --%>
		<%--내가본 코스 끝 --%>
		

		<%--기쁨- 카카오 채팅방 시작--%>
		<div class="remote_container">
			<div class="remote_banner_container kakao_chat">카카오 상담</div>
		</div>
		<%--기쁨 카카오 채팅방 끝 --%>
	</div> <%--div.total_remote (리모컨전체 끝)--%>
</body>

</html>