<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나만의 여행코스</title>
<link rel="stylesheet" type="text/css" href="resources/css/course/courseTitleInsert.css"/>
</head>
<body>	
	<header>
    <%@ include file="../common/menubar.jsp" %>
    </header>
	
	<section>
	<div id="all_div">
		<!-- 메뉴 이름 div -->
		<div id="menu_div">
			<div id="coMenu">
				<i class="fas fa-map-signs" id="menuIcon2"></i>
				<span id="coMenuLabel">여행코스 만들기</span>
			</div>
		</div>
		
		<!-- 표지  -->
		<div id="tiSpace1"></div>
		<div id="tiSpace2"></div>
		<div id="titleImgDiv">
		    <img src="resources/images/메인배너1.png" id="titleImg">
		    <i class="far fa-images" id="titleIcon"></i>		    
		    <label id="titleLabel">표지 이미지 변경</label>		    
		</div>

    </div>

    <form name="signform" method="POST" ENCTYPE="multipart/form-data" action="courseInsertAttachment.co">
        <input type="file" id="file" name="file" style="display:none;" onchange="changeValue(this)" accept="image/*">
    </form>

    <button id="insBtn" onclick="insetBtn();">클릭</button>
    </section>

    <script>
    $('#titleImgDiv').click(function (e) {
            document.signform.target_url.value = document.getElementById('titleImg').src;
             e.preventDefault();
              $('#file').click();
    });  

    function changeValue(obj){
           document.signform.submit();
    }
    </script>


    <script>
    function insetBtn(){
		location.href="<%= request.getContextPath() %>/courseInsert.co";
	}
    </script>

</body>
</html>