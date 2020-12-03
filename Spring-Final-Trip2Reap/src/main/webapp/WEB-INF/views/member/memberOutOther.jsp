<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
      <!--  updateMember.css -->
      <link rel="stylesheet" href="resources/css/member/memberOutOther.css">  
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
    <!-- 회원탈퇴 설명란  -->
        <div>
            <div id="infor1"></div>
            <div id="infor2"></div>
            <div id="infor3">회원 탈퇴</div>            
        </div>
        <div id="up_space1"></div>    
        <div id="infoDiv1"></div>
        <div id="infoDiv2">회원탈퇴[이용약관 동의 철회]시 아래 내용을 확인해주세요!</div>
        <div id="up_space2"></div>
        
        
        <!-- 회원탈퇴 박스  -->
		    <div id="infor4"></div>
		    <div id="deleteDiv">
		    <br>&nbsp;&nbsp;
		         그동안 저희 전국방방곡곡을 이용해 주셔서 진심으로 감사합니다.<br>&nbsp;&nbsp;
		         이용 중 불편하셨던 사항을 말씀해주시면, 적극 반영하여 더욱 편안한 서비스를 제공하기 위해 노력하겠습니다.<br><br>&nbsp;&nbsp;
		    **기존 회원 탈퇴 시<br>&nbsp;&nbsp;
		         - 전국방방곡곡 이용약관 동의 철회 시 고객님의 계정은 휴먼 상태가 됩니다. <br>&nbsp;&nbsp;
		         - 전국방방곡곡 이용약관 동의를 철회한 후에라도  1년 이내에 고객센터에 문의 시 서비스를 이용하실 수 있습니다. <br>&nbsp;&nbsp;
		         - 진행중인 전자상거래 이용내역(결제/환불)이 있을 경우, 결제에 관하여 철회하실 수 없습니다. <br>&nbsp;&nbsp;
		         - 고객님의 계정이 휴먼상태가 된 지 1년이 지나면 계정은 자동 파기되며,<br>&nbsp;&nbsp;
		          고객님께서 보유하셨던 혜택 및 정보는 모두 삭제되며, 재가입 시 복원이 불가능합니다. <br><br>&nbsp;&nbsp;
		          
		    **카카오 회원 탈퇴 시<br>&nbsp;&nbsp;
		         - 전국방방곡곡 이용약관 동의 철회 시 고객님의 카카오 계정으로 이용한 모든 서비스의 기록은 파기됩니다. <br>&nbsp;&nbsp;
		         - 전국방방곡곡 이용약관 동의 철회 시 영구 삭제되며, 복원이 되지 않는 점 양해바랍니다. <br>&nbsp;&nbsp;
		         - 진행중인 전자상거래 이용내역(결제/환불)이 있을 경우, 결제에 관하여 철회하실 수 없습니다. <br>&nbsp;&nbsp;
		         - 고객님께서 보유하셨던 혜택 및 정보는 모두 삭제되며, 재가입 시 복원이 불가능합니다. <br><br>&nbsp;&nbsp;
		          
		    **네이버 회원 탈퇴 시<br>&nbsp;&nbsp;
		         - 전국방방곡곡 이용약관 동의 철회 시 고객님의 카카오 계정으로 이용한 모든 서비스의 기록은 파기됩니다. <br>&nbsp;&nbsp;
		         - 전국방방곡곡 이용약관 동의 철회 시 영구 삭제되며, 복원이 되지 않는 점 양해바랍니다. <br>&nbsp;&nbsp;
		         - 진행중인 전자상거래 이용내역(결제/환불)이 있을 경우, 결제에 관하여 철회하실 수 없습니다. <br>&nbsp;&nbsp;
		         - 고객님께서 보유하셨던 혜택 및 정보는 모두 삭제되며, 재가입 시 복원이 불가능합니다. <br><br>&nbsp;&nbsp;
		         
		          회원탈퇴 시 서비스 이용이 불가능해지므로, 다시 한번 신중하게 생각해주세요.
		          감사합니다.<br><br>
		    </div>
        

        <!-- 버튼  -->
        <div id="up_space3"></div>
        <div id="up_space4"></div>
        <div id="delCheck">전국방방곡곡 회원탈퇴[이용약관 동의 철회]를 하시겠습니까?</div>   
        <div id="up_space5"></div>
        <div id="up_space6"></div>
        <input type="button" id="outBtn1" value="취소" onclick="cancel();">
        <div id="up_space7"></div>
        <input type="button" id="outBtn2" value="회원탈퇴">
    </div>
    
    <!-- 비밀번호 확인 창  -->
		<div id="ex1" class="modal">
		    <div id="login_spaceStart"></div>
			<div id="delDiv"><p id="delLabel">TRIP2REAP에서 이용하신 모든 서비스가 삭제됩니다.<br> 정말 회원탈퇴하시겠습니까?</p></div>
			<div id="up_space3"></div>
			<div>
			    <div id="up_space8"></div>
			    <input type="button" id="delBtn2" value="취소">
	            <input type="button" id="delBtn" value="탈퇴하기">
			</div>
			<div id="up_space9"></div>
		</div>	
		<input type="hidden" id="delId" value="${ loginUser.memberId }">
    </section>
    <div style="height : 300px;"></div>
    


    <script>    
       function cancel(){
    	   location.href="<%= request.getContextPath() %>/home.do";
       }
       
       
       $("#outBtn2").click(function(event) {
   		event.preventDefault();
   		$("#ex1").modal({
   			fadeDuration : 250
   		});
       });
       
       
       $("#delBtn").click(function(){
    	   var id = $("#delId").val();
    	      			
     			$.ajax({
   	   			 url : 'deleteMemberOther.me',
   	   			 type : 'post',
   	   			 data : {id:id},
   	   			 success : function(data){
   	   				 if(data == "N"){
   	   				    swal("회원탈퇴에 실패하였습니다🙋");
   	   				 } else if(data == "Y") {
   	   					 console.log("회원탈퇴");
   	   				    location.href="<%= request.getContextPath() %>/logout.me";
   	   				 } 
   	   			 },
   	   			 error : function(data){
   	   				 console.log("서버 실패");
   	   			 }
   	   		  });   	   
    	   
       });
       
       
       $("#delBtn2").click(function(){
    	   location.href="<%= request.getContextPath() %>/memberOutOther.me";
       });
   
    </script>


</body>
</html>