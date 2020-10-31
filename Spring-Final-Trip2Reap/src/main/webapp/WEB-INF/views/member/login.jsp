<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

   <!--  login.css -->
   <link rel="stylesheet" href="resources/css/member/login.css">
   <script src="https://kit.fontawesome.com/8828f475ef.js" crossorigin="anonymous"></script>

</head>
<body>
    <header>
    <%@ include file="../common/menubar.jsp" %>
    </header>
    
    <section>
    <!-- 각자 구현할 부분  -->
    <div id="board_list">
        <!-- 초록 선  -->
        <div id="space_1"></div>         
        <div id="space_2"></div>
        <div id="space_3"></div>     
        <div id="space_4"></div> 
        
        <!-- 로그인 라벨  -->
        <div id="loginLabel_space">
        <label id="loginLabel">로그인</label>
        
        <!-- 로그인 form  -->
	    <div id="space_5"></div>   
	    <form action="loginCheck.me" method="post">
	    <div id="loginDiv">
	      <!-- 글자입력시 padding값 없애주기  -->
	        <input type="text" id="loginInfo" class="loginInfo_1" name="memberId" placeholder="아이디를 입력해주세요"
	         onfocus="this.placeholder=''" onblur="this.placeholder='아이디를 입력해주세요'" autocomplete="off" >
	        <div id="space_6"></div>
	        <input type="password" id="loginInfo" name="memberPwd" class="loginInfo_2" placeholder="비밀번호를 입력해주세요"
	         onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호를 입력해주세요'" autocomplete="off">
	    </div>
	    <div id="space_7"></div>
	    
	    <!-- 아이디 저장  -->
	    <div id="idSave_1">
	        <input type="checkbox" id="idSave_2">
	        <label id="idSave_3">아이디 저장</label>
	    </div>
	    <div id="idSave_4"></div>
	    
	    <!-- 버튼  -->
	    <div id="loginDiv">
	        <button id="loginButton" onclick="loginBtn()">로그인</button>
	        <div id="space_8"></div>
	        <div id="space_9">
	            <label class="search" onclick="searchId()">아이디 찾기</label>
	            <label>&nbsp;|&nbsp;</label>
	            <label class="search">비밀번호 찾기</label>
	            <label>&nbsp;|&nbsp;</label>
	            <label class="search">회원가입</label>
	        </div>
	    </div>  
	    </form>  
	    <div>
	        <div id="space_10"></div>
	        <div id="otherBtn">
	            <img id="loginButton2" src="resources/images/카카오로그인.png">
	        </div>
	        <div id="space_11"></div>
	        <div id="otherBtn">
	            <img id="loginButton3" src="resources/images/네이버로그인.png">
	        </div>    
	    </div>
	    <div id="space_12"></div>
	    
	    <!-- 초록줄 아래  -->
	    <div id="space_13"></div>
	    </div> 
   </div>
    
    <div style="height: 700px;"></div>
    </section>   
    
    <footer></footer>    
    
    <script>
       function searchId(){
    	   location.href="<%= request.getContextPath() %>/searchId.me";
       }
    </script>

</body>
</html>