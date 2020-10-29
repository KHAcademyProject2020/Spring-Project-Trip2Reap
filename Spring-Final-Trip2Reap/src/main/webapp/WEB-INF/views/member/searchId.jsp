<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
   <!--  searchId.css -->
      <link rel="stylesheet" href="resources/css/member/searchId.css">   
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
        <div id="loginBox" style="display:inline-block; height:400px; width:770px; border: 1px solid rgb(213, 213, 213);">
            <ul id="tab">
                <li id="searchId">아이디 찾기</li>
                <li>비밀번호 찾기</li>
            </ul>
        <div></div>
        <div id="checkEmail">
	        <input type="radio" id="checkEmail_1" style="color: darkgray;">
	        <label id="checkEmail_2">이메일로 찾기</label>
	    </div>
        <script>
        $(document).ready(function(){
        	$('ul.tab li').click(function(){
        		var tab_id = $(this).attr('data')
        	});
        });
       </script>
       
        </div>
    </div>
    
    </section>
    <div style="height:1000px;"></div>
    
    
</body>
</html>