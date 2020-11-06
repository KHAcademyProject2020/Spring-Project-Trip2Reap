<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="resources/css/review/reviewList.css"/>
 <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>  
  <style>
table{

    width: 800px;

    border-top: 1px solid #444444;

    border-collapse: collapse;
    
    margin: 50px;

  }

th, td{

    border-bottom: 1px solid #444444;

    padding: 5px;

  }
  #searchBar{
	border-top: 4px solid black;
	display: flex;
	
}
#board{
	display:flex;
	padding-left:120px;
}
  .dropdown {
    margin-top: 5px;
    margin-bottom: 10px;
    padding: 3px 2px;
    width: 312px; 
}

option {
    width: 312px !important;
}


  </style>
		

<title>Insert title here</title>
</head>
<body>
	<section>
	<div id="board_list">
		<header>
		<c:import url="../common/menubar.jsp" />
		</header>
		<div id="all_div">
		<div id="menu_div">
			<div id="menu_left_div">
				<img src="resources/images/review.jpg" id="menu_img"/>
				<span id="menu" >여행 후기</span>
			</div>
		
		</div>
		</div>
		<!-- text-align뿐만 아니라 대부분 div안에서 작동한다. -->
		<div id="cate_btn" style="display: inline-block; width: 1000px">
			<button class="cate_btn">전체보기</button>
			<button class="cate_btn">여행지</button>
			<button class="cate_btn">맛집</button>
			</div>
			<div style="display: inline-block;">
			<button class="bo_btn">사진형</button>
			<button class="bo_btn">게시판형</button>
		</div>	
		
	
	    <div id="board">
		<table>
		<tr align="center" bgcolor="#efefef">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>좋아요</th>
		</tr>
		
		<c:forEach var="i" begin="1" end="10" step="1" varStatus="loop">
		<tr align="center">
			<td>test</td>
			<td><a href="reviewDetail.bo">tesddddddddddddddt</a></td>
			<td>test</td>
			<td>test</td>
			<td>test</td>
			<td>test</td>
		</tr>
		</c:forEach>
		
		
		<!-- 페이징 처리 -->
		<tr align="center" height="20" id="buttonTab">
			<td colspan="5" >
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.bo">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="blist.bo">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.bo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
			<td>
				
					<button onclick="location.href='reviewInsert.bo';">글쓰기</button>
			
			</td>
		</tr>
		<tr>
			
			<td colspan="6">
				<form id="content" style="text-align: center;">
				 <select name="search">
    			 <option value="작성자">작성자</option>
    			 <option value="제목">제목</option>
   				 <option value="내용">내용</option>
   				 <option value="해쉬태그">해쉬태그</option>
				</select>
  					<input type="text" name="input" class="input" id="search-input">
  					<button type="reset" class="search" id="search-btn">검색</button>
				</form>
			</td>
			
		</tr>
	</table>
		
	
 </div>
 


	
	</div>
	
	

</body>
</html>