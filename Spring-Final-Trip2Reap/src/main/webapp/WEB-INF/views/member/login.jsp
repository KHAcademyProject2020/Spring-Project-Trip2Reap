<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
         
       footer {height: 200px;}     
      
       #loginDiv{ height : 80px; text-align: center; }
       #loginInfo{ width: 300px; height: 35px; font-size: 13px;
                   border: 1px solid lightgray; }
       #loginButton{ background-color: rgb(119,175,130); color: white; border: none;
                     width: 310px; height: 38px; font-weight: bold;}
       #loginButton2{ width: 310px; height : 40px; }
       #loginButton3{ width: 310px; height : 47px; }
       #board_list{ margin : 40px auto 0px auto;}
     
      
</style>

</head>
<body>
    <header>
    <%@ include file="../common/menubar.jsp" %>
    </header>
    
    <section>
    <!-- 각자 구현할 부분  -->
    <div id="board_list"><!-- 추가한 div(수진k) width:1000으로 가로길이도 맞추려했는데 왜 자꾸 오른쪽으로 밀릴까요.. 이것때문에 계속 수정하다가 너무 복잡해서 실패하고 오래걸렸어여 ㅠㅠ  일단 margin만 넣었어요-->
        <div style="height:80px;"></div> 
        <div style="display: inline-block; width: 530px;"></div>
        <div style="display: inline-block; width:450px; height:3px; 
                   background-color: rgb(119,175,130); border: none;"></div>     
        <div style="height:50px;">
        
        </div> 
        
        <div style="width:1530px; height:50px; text-align: center;">
        <label style="font-size: 30px; font-weight:bold;">로그인</label>
    
	    <div style="width:1500px; height:20px;"></div>   
	    <form action="loginCheck.me" method="post">
	    <div id="loginDiv">
	        <input type="text" id="loginInfo" name="memberId" placeholder="           아이디를 입력해주세요"
	         onfocus="this.placeholder=''" onblur="this.placeholder='           아이디를 입력해주세요'" >
	        <div style="height:15px;"></div>
	        <input type="text" id="loginInfo" name="memberPwd" placeholder="           비밀번호를 입력해주세요"
	         onfocus="this.placeholder=''" onblur="this.placeholder='           비밀번호를 입력해주세요'">
	    </div>
	    <div style="width:1000px; height:25px;"></div>
	    <div style="width:610px; display: inline-block;"></div>
	    <div style="display: inline-block;">
	        <input type="checkbox" style="width: 20px; vertical-align: middle;">
	        <label style="font-size: 12px; vertical-align: middle;">아이디 저장</label>
	    </div>
	    <div style="height: 15px;"></div>
	    <div id="loginDiv">
	        <button id="loginButton" onclick="loginBtn()">로그인</button>
	        <div style="height: 15px;"></div>
	        <div style="height: 15px; font-size: 12px;">
	            <label>아이디 찾기</label>
	            <label>&nbsp;|&nbsp;</label>
	            <label>비밀번호 찾기</label>
	            <label>&nbsp;|&nbsp;</label>
	            <label>회원가입</label>
	        </div>
	    </div>  
	    </form>  
	    <div>
	        <div style="height: 20px;"></div>
	        <div style="text-align: center;">
	            <img id="loginButton2" src="resources/images/카카오로그인.png">
	        </div>
	        <div style="height: 10px;"></div>
	        <div style="text-align: center;">
	            <img id="loginButton3" src="resources/images/네이버로그인.png">
	        </div>    
	    </div>
	    <div style="height:60px;"></div>
	    <div style="display: inline-block; width:530px"></div>
	    <div style="display: inline-block; width:450px; height:3px; 
	                background-color: rgb(119,175,130); border: none;"></div>
	    </div> 
   </div>
    
 
 
    
    <div style="height: 300px;"></div>
    </section>   
    
    <footer></footer>    

</body>
</html>