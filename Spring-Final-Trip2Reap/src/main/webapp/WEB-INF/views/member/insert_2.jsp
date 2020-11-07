<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
   <!--  insert_2.css -->
      <link rel="stylesheet" href="resources/css/member/insert_2.css">  
      <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script> 
</head>
<body>
    <header>
    <%@ include file="../common/menubar.jsp" %>
    </header>
    
    <section>
    <div id="board_list">
    <!-- 회원가입 설명란  -->
        <div id="space_1"></div>
        <div id="space_2">
            <div id="info1"></div>
            <div id="info2">회원가입</div>
            <div id="info3"></div>
            <div id="info4"></div>
            <div id="info7">01. 약관동의 > </div>
            <div id="info5">02</div>
            <div id="info6">정보입력</div>
            <div id="info7">> 03. 가입완료</div>
        </div>
        <div id="space_3"></div>
        
        <!-- 정보입력란 -->
        <div id="infoDiv1"></div>
        <div id="infoDiv2">*</div>
        <div id="infoDiv3">는 필수 입력 항목입니다.</div>
        <div id="space_4"></div>
        <div id="infoDiv4"></div>
        
        <!-- 아이디  -->
        <div id="id1"><label class="infoLabel">아이디</label></div><div id="id2"><label id="commonLabel">*</label>
        <input type="text" id="idText" class="infoText" name="idText" placeholder="6~12자 영문,숫자"
	         onfocus="this.placeholder=''" onblur="this.placeholder='6~12자 영문,숫자'" autocomplete="off"></div>
        <div id="space_5"></div>
        
        <!-- 비밀번호  -->       
        <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">비밀번호</label></div><div id="pwd2" class="infoRight"><label id="commonLabel">*</label>
        <input type="text" id="pwdText" class="infoText" name="pwdText" placeholder="영문+숫자/특수문자 6~12자 조합"
	         onfocus="this.placeholder=''" onblur="this.placeholder='영문+숫자/특수문자 6~12자 조합'" autocomplete="off"></div>
        <div id="space_5"></div>
        
        <!-- 비밀번호 재확인  -->
        <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">비밀번호</label></div><div id="pwd2" class="infoRight"><label id="commonLabel">*</label>
        <input type="text" id="pwdText2" class="infoText" name="pwdText2" placeholder="비밀번호 재확인"
	         onfocus="this.placeholder=''" onblur="this.placeholder='비밀번호 재확인'" autocomplete="off"></div>
	    <div id="space_5"></div>
	    
	    <div id="space_3"></div>	    
	         
	    <!-- 이름  -->
	    <!-- <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">이름</label></div><div id="name" class="infoRight"><label id="commonLabel">*</label>
        <input type="text" id="nameText" class="infoText" name="nameText" placeholder="6~10자"
	         onfocus="this.placeholder=''" onblur="this.placeholder='6~10자'" autocomplete="off"></div>
        <div id="space_5"></div> -->
        <div id="infoDiv4"></div>
        <div id="name"><label class="infoLabel">이름</label></div><div id="name2"><label id="commonLabel">*</label>
        <input type="text" id="nameText" class="infoText" name="nameText" placeholder="6~10자"
	         onfocus="this.placeholder=''" onblur="this.placeholder='6~10자'" autocomplete="off"></div>
        <div id="space_5"></div>
        
	    
	    <!-- 닉네임  -->
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">닉네임</label></div><div id="nickname" class="infoRight"><label id="commonLabel">*</label>
        <input type="text" id="nicknameText" class="infoText" name="nicknameText" placeholder="6~10자"
	         onfocus="this.placeholder=''" onblur="this.placeholder='6~10자'" autocomplete="off"></div>
        <div id="space_5"></div>
        
        <!-- 이메일  -->
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">이메일</label></div><div id="email" class="infoRight"><label id="commonLabel">*</label>
            <input type="text" id="emailText" name="emailText" placeholder="example@naver.com"
	            onfocus="this.placeholder=''" onblur="this.placeholder='example@naver.com'" autocomplete="off">
	        <div id="sendMessage"><label id="mailLabel">인증메일 전송</label></div>  
	    </div>
        <div id="space_5"></div>
        
        <!-- 인증번호  -->
        <div id="confirmDiv">
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">인증번호</label></div><div id="confirm" class="infoRight"><label id="commonLabel">*</label>
            <input type="text" id="confirmText" name="confirmText">
	        <div id="confirmMessage"><label id="confirmLabel">인증확인</label></div>  
	    </div>
        </div>
        
        <!-- 휴대전화  -->
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">휴대전화</label></div><div id="phone" class="infoRight"><label id="commonLabel">*</label>
        <input type="text" id="phoneText" class="infoText" name="phoneText" placeholder="-없이 입력"
	         onfocus="this.placeholder=''" onblur="-없이 입력'" autocomplete="off"></div>
        <div id="space_5"></div>
        
        <!-- 성별  -->
	    <div id="infoDiv4"></div>
        <div class="infoLeft"><label class="infoLabel">성별</label></div><div id="gender" class="infoRight">
           <input type="button" value="남자" id="man">
           <input type="button" value="여자" id="woman">
        </div>

        <!-- 버튼  -->
        <div id="space_6"></div>
        <div id="space_7"></div>
        <input type="button" id="applyBtn1" value="취소" onclick="cancel();">
        <div id="space_8"></div>
        <input type="button" id="applyBtn2" value="회원가입" onclick="ok();">
	    
    
    </div>
    </section>
    <div style="height : 1000px;"></div>
</body>
</html>