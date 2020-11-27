<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/review/reviewInsert.css" />
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
					<i class="fas fa-camera-retro" id="menuIcon3"></i> <span id="menu">여행
						후기 작성</span>
				</div>
			</div>

			<form action="rInsert.bo" method="post">
				<div id="wrapperForm">
					<br> <br>
					<div class="writeForm" id="writer">
						<strong>작성자 ${loginUser.memberId }</strong> <input type="hidden"
							name="memberId" readonly value="${loginUser.memberId }">
					</div><br><br>
					
					<div id="cate">
					
						<select id="select_search" name="caCode" >
							<option>카테고리를 선택해주세요</option>
							<option value="2">여행 코스</option>
							<option value="3">여행지</option>
							<option value="4">맛집</option>
							<option value="5">호텔</option>
						</select>

					</div>
					<br> 
					<div class="writeForm" id="title">
						<textarea name="boTitle" placeholder="제목을 입력해 주세요."
							class="textarea_input" style="height: 40px;"></textarea>
					</div>
					<br> <br>
				
		
					<div id="drop" class="test">
						이미지를 끌어다 쓰세요
						<input type="file" id="thumbnailImg1" multiple="multiple" name="uploadFile1" onchange="preview(this,1)"/>
					<div id="thumbnails"></div>
					</div>
					<br>
					<div class="writeForm" id="content">

						
						<textarea  placeholder="내용을 입력해주세요" name="boContent" rows="30" cols="100"></textarea>
						
						
						<div class="writeForm" id="hashTag">
							태그 <input type="text" name="boTag">
						</div>
					</div>
					
					<br>

					<input type="submit" value="제출">	<input type="button" id="btnSubmit" value="업로드" />

				</div>



			</form>


		</div>
		
		<div id="titleImgArea" class="pictureArea">
				<img id="titleImg"/>
			</div>
			 <div id="contentImgArea1" class="pictureArea">
				<img id="contentImg1"/>
			</div>
			<div id="contentImgArea2" class="pictureArea">
				<img id="contentImg2"/>
			</div>
			
			<div id="titleImgTxt">
				<div class="pictureName">
					<span class="astro_span">*</span>대표이미지
				</div>
			</div>
			<div id="contentImgTxt">
				<div class="pictureName">내용이미지1</div>
			</div>
			<div id="contentImgTxt">
				<div class="pictureName">내용이미지2</div>
			</div>
			
		
		
		<script>
			var uploadFiles = [];

			var $drop = $("#drop");

			$drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄

				$(this).addClass('drag-over');

			}).on("dragleave", function(e) { //드래그 요소가 나갔을때

				$(this).removeClass('drag-over');
			}).on("dragover", function(e) {
				e.stopPropagation();
				e.preventDefault();
			}).on('drop', function(e) {
				e.preventDefault();
				$(this).removeClass('drag-over');
				var files = e.originalEvent.dataTransfer.files;
				for (var i = 0; i < files.length; i++) {
					var file = files[i];
					console.log(file);
					var size = uploadFiles.push(file);
					preview(file, size - 1);
				}
			});
			function preview(file, idx) {
				var reader = new FileReader();
				reader.onload = (function(f, idx) {
					return function(e) {
						var $div = $('<div class="thumb"> \
				<div class="close" data-idx="' + idx + '">X</div> \
				<img src="'
								+ e.target.result
								+ '" title="'
								+ escape(f.name) + '" /> \
				</div>');
						$("#thumbnails").append($div);
						f.target = $div;
					};
				})(file, idx);
				reader.readAsDataURL(file);
			}
			var mode = 1; //0:여러 파일을 한번에 업로드, 1:여러 파일을 각각 차례대로 업로드
			var uploadStatus = {
				total : 0,
				count : 0
			};
			$("#btnSubmit").on("click", function(e) {
				if (mode == 0)
					groupUpload();
				else if (mode == 1) {
					$.each(uploadFiles, function(i, file) {
						if (file.upload != 'disable')
							uploadStatus.total++;
					});
					eachUpload();
				}
			});
			//전체파일 한번에 업로드
			function groupUpload() {
				var formData = new FormData();
				$.each(uploadFiles, function(i, file) {
					if (file.upload != 'disable')
						formData.append('upload-file', file, file.name);
				});
				$.ajax({
					url : '/api/etc/file/upload',
					data : formData,
					type : 'post',
					contentType : false,
					processData : false,
					xhr : function() { //XMLHttpRequest 재정의 가능
						var xhr = $.ajaxSettings.xhr();

						return xhr;
					},
					success : function(ret) {
						alert("완료");
					}
				});
			}
			//개별 파일 업로드
			function eachUpload() {
				var file = uploadFiles.shift();
				if (!file) {
					setTimeout(alert.bind(null, '게시글이 등록되었습니다.'), 300);
					return;
				}
				if (file.upload == 'disable') {
					eachUpload();
					return;
				}
				var formData = new FormData();
				formData.append('upload-file', file, file.name);

				$.ajax({
					url : '/api/etc/file/upload',
					data : formData,
					type : 'post',
					contentType : false,
					processData : false,
					xhr : function() { //XMLHttpRequest 재정의 가능
						var xhr = $.ajaxSettings.xhr();

						return xhr;
					},
					success : function(ret) {
						uploadStatus.count++;
						setTimeout(eachUpload, 500); //다음 파일 업로드
					}
				});
			}

			$("#thumbnails").on("click", ".close", function(e) {
				var $target = $(e.target);
				var idx = $target.attr('data-idx');
				uploadFiles[idx].upload = 'disable';
				$target.parent().remove();
			});
		</script>






	</section>
</body>
</html>
