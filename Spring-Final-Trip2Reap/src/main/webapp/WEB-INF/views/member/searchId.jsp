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
        <div style="height: 100px; width:100vw;">
            <div style="display: inline-block; width:650px;"></div>
            <div style="display: inline-block; height: 50px; font-size: 30px; font-weight:bold; text-align: center;">아이디/비밀번호 찾기</div>
            <div style="display: inline-block; width:200px;"></div>
            <div style="display: inline-block; width:580px;"></div>
            <div style="display: inline-block; font-weight:bold; color:darkgray; text-align: right;">원하는 인증방법을 선택해 아이디/비밀번호를 확인할 수 있어요!</div>
        </div>
        <div style="height: 25px;"></div>
        <div id="space_2" style="display:inline-block; width:400px;"></div>
        <div id="loginBox" class="tab" style="display:inline-block; height:400px; width:770px; border: 1px solid rgb(213, 213, 213);">
            <ul id="tab">
                <li id="id" class="tab-link current" >아이디 찾기</li>
                <li id="pwd" class="tab-link">비밀번호 찾기</li>
            </ul>

        <div id="searchId" >
	        <input type="radio" id="checkEmail_1" style="color: darkgray;">
	        <label id="checkEmail_2">아이디 찾기</label>
	    </div>
	    <div id="searchPwd" >
	        <input type="radio" id="checkEmail_1" style="color: darkgray;">
	        <label id="checkEmail_2">비밀번호 찾기</label>
	    </div>
	    </div>	    

        
	    
        <!-- <script>
        $(document).ready(function(){
        	$('.tab li').click(function(){
        		$('.tab li').css({'background' : 'rgb(246, 246, 246)', 'border-bottom-color' : 'rgb(213,213,213)'});        		
        		$(this).css({'border-bottom-color' : 'white', 'background' : 'white'});
        	});
        });
       </script> -->
       
       <script>
           $(function(){
        	   $('#id').on('click',function(){
        		  $('#searchId').css('display','block');
        		  $('#searchPwd').css('display','none');
        	   });
        	   
        	   $('#pwd').on('click',function(){
         		  $('#searchId').css('display','none');
         		  $('#searchPwd').css('display','block');
         	   });
           });
       </script>
       
        </div>
    </div>
    
    </section>
    <div style="height:1000px;"></div>
    
    
</body>
</html>