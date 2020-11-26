<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/review/reviewInsert.css"/>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>  
<title>Insert title here</title>
</head>
<body>
<section>
	<header>
   	 <c:import url="../common/menubar.jsp" />
	</header>
	
	<!-- 전체 div -->
	<div id="all_div">
		<!-- 메뉴 이름 div -->
		<div id="menu_div">
			<div id="menu_left_div">
					<i class="fas fa-camera-retro" id="menuIcon3"></i>
				<span id="menu">여행 후기 작성</span>
			</div>
		</div>
		
		<form action="rInsert.bo" method="post">
		<div id="wrapperForm">
			<br><br>
			<div class="writeForm" id="writer">
			<strong>작성자</strong>
			<input type="text" name="memberId" readonly value="${loginUser.memberId }" style="background: lightgrey;" >
			</div>
			<br><br>
			
			<br><br>
			<div class="writeForm" id="title"> 
			<textarea name="boTitle" placeholder="제목을 입력해 주세요." class="textarea_input" style="height: 40px;"></textarea>
			</div>
			<br><br>
			<div class="writeForm" id="hashTag">
			태그 <input type="text" name="boTag">
			</div>
			<br><br><br>
			<div class="writeForm" id="content">
			
			내용<br>
			<textarea name="boContent" rows="30" cols="100"></textarea>
			</div>
			
			<input type="submit" value="제출">
			
			</div>
			
			
			 
		</form>
		
	
	</div>
	
	
	
</section>		
</body>
</html>
