<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
<script>
$(function(){
	$.ajax({
		url:'hotelCookies.ho',
		type:'post',
		success:function(response){
			console.log(response);
			let rHotel_Container= $('#hotel_remote_control');
			let rHotel_ul= $('#hotel_remote_ul');
			
			rHotel_ul.html(''); //초기화 싹다 비워줌.
			
			if(response.length<=0){
				//조회한 호텔개수가 0개면
				//최근에 본 호텔부분을 보여주지 않음.
				rHotel_Container.css('display', 'none');	
			}else{
				rHotel_Container.css('display', 'flex');
				if(response.length>=3){
					for(var i=response.length-1; i>=response.length-3; i--){
						
						let li_code='';
						li_code+='<li class="remote_li">'
						li_code+='<a href="hotelDetailView.ho?hId='+response[i].boNo+'&page=1" target="_blank">'
						li_code+='<span>'
						li_code+='<img src="resources/buploadFiles/'+response[i].hotelThumbnailImg+'" class="remoteImg" /> '
						li_code+='</span>'
						li_code+='<span class="remoteName">'+response[i].boTitle+'</span>'
						li_code+='</a>'
						li_code+='</li>'
						
						rHotel_ul.append(li_code);
					}
				}else{
					for(var i=response.length-1; i>=0; i--){
						
						let li_code='';
						li_code+='<li class="remote_li">'
						li_code+='<a href="hotelDetailView.ho?hId='+response[i].boNo+'&page=1" target="_blank">'
						li_code+='<span>'
						li_code+='<img src="resources/buploadFiles/'+response[i].hotelThumbnailImg+'" class="remoteImg" /> '
						li_code+='</span>'
						li_code+='<span class="remoteName">'+response[i].boTitle+'</span>'
						li_code+='</a>'
						li_code+='</li>'
						
						rHotel_ul.append(li_code);
					}
				}
				
			}
			
		}
	});
});

</script>
</html>