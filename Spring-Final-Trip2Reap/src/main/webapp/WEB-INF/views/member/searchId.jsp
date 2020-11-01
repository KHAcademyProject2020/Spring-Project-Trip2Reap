<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
   <!--  searchId.css -->
      <link rel="stylesheet" href="resources/css/member/searchId.css">  
      <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>  
</head>
<body>
    <header>
    <%@ include file="../common/menubar.jsp" %>
    </header>
    
    <section>
    <div id="board_list">
        <div id="space_1"></div>
        <div style="height: 100px; width:1300px;">
            <div style="display: inline-block; width:500px;"></div>
            <div style="display: inline-block; height: 50px; font-size: 30px; font-weight:bold; text-align: center;">아이디/비밀번호 찾기</div>
            <div style="display: inline-block; width:200px;"></div>
            <div style="display: inline-block; width:425px;"></div>
            <div style="display: inline-block; font-weight:bold; color:darkgray; text-align: right;">원하는 인증방법을 선택해 아이디/비밀번호를 확인할 수 있어요!</div>
        </div>
        <div style="height: 25px;"></div>
        <div id="space_2" style="display:inline-block; width:260px;"></div>
        <div id="loginBox" class="tab" style="display:inline-block; height:400px; width:770px; border: 1px solid rgb(213, 213, 213);">
            <ul id="tab">
                <li id="id" class="tab-link current" >아이디 찾기</li>
                <li id="pwd" class="tab-link">비밀번호 찾기</li>
            </ul>

        <div id="searchId" style="line-height: 80px;" >
            <div style="display: inline-block; width: 200px;"></div>
	        <input type="radio" id="checkPhone_1" name="idPhoneEmail" style="color: darkgray; width: 30px;" checked="checked">
	        <label id="checkPhone_2" style="margin-right: 50px;">휴대전화로 찾기</label>
	        <input type="radio" id="checkEmail_1" name="idPhoneEmail" style="color: darkgray; width: 30px;">
	        <label id="checkEmail_2">이메일로 찾기</label>
	    </div>  
	    
	    <div id="searchPwd" style="display: none; line-height: 80px;">
	        <div style="display: inline-block; width: 300px;"></div>
	        <input type="radio" id="checkEmail_3" name="idPhoneEmail" style="color: darkgray; width: 30px;">
	        <label id="checkEmail_4" >이메일로 찾기</label>
	    </div>
	    <div id="phone">휴대전화로 찾기ㅎㅎ</div>
	    <div id="email" style="display: none;">이메일로 찾기ㅎㅎ</div>
	    <div id="pwdEmail" style="display: none;">비밀번호 : 이메일로 찾기</div>
	    </div>	          
       
       <script>
           $(function(){
        	   $('#id').on('click',function(){
        		  $('#searchId').css('display','inline-block');
        		  $('#searchPwd').css('display','none');
        		  $('.tab li').css({'background' : 'rgb(246, 246, 246)', 'border-bottom-color' : 'rgb(213,213,213)'});        		
          		  $(this).css({'border-bottom-color' : 'white', 'background' : 'white'});   
          		  $('input:radio[id=checkPhone_1]').prop('checked','true');
          		  $('#phone').show();
  			      $('#email').hide();
  			      $('#pwdEmail').hide();
        	   });
        	   
        	   $('#pwd').on('click',function(){
         		  $('#searchId').css('display','none');
         		  $('#searchPwd').css('display','inline-block');
         		  $('.tab li').css({'background' : 'rgb(246, 246, 246)', 'border-bottom-color' : 'rgb(213,213,213)'});        		
         		  $(this).css({'border-bottom-color' : 'white', 'background' : 'white'});
         		  $('input:radio[id=checkEmail_3]').prop('checked','true');
         		  $('#pwdEmail').show();
   			      $('#email').hide();
   			      $('#phone').hide();
         	   });
        	   
        	   $('input:radio[name=idPhoneEmail]').click(function(){
        		  if($('input:radio[id=checkPhone_1]').is(':checked')){
        			  $('#phone').show();
        			  $('#email').hide();
        			  $('#pwdEmail').hide();
        		  } else if($('input:radio[id=checkEmail_1]').is(':checked')) {
        			  $('#email').show();
        			  $('#phone').hide();
        			  $('#pwdEmail').hide();
        		  } else if($('input:radio[id=checkEmail_3]').is(':checked')){
         			 $('#pwdEmail').show();
       			     $('#email').hide();
       			     $('#phone').hide();
         		  }  			  
         		  });
        	   
           });
       </script>
       
        </div>
    
    </section>
    <div style="height:1000px;"></div>
    
    
</body>
</html>