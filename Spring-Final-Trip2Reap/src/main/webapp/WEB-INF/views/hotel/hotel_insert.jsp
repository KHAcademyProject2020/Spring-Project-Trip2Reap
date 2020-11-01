<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- css -->
    <!--  
    <link rel="stylesheet" href="resources/css/hotel/insert_hotel.css">
    -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <link rel="stylesheet" href="resources/css/hotel/insert_hotel.css">

    <title>호텔 등록하기</title>
</head>

<body>

    <div>
        <!-- <c:import url="../common/menubar.jsp"/> -->
    </div>

    <!--(common all pages related with hotel) main-container -->
    <div id="main-container">

        <!-- (common all pages related with hotel) title-container -->
        <div id="title-container">
            <!--for jsp 
                <img id="hotel-icon" src="resources/images/hotel.png"> 
            -->
            <img id="hote-icon" src="./hotel.png">
            <span id="title-name">호텔 예약</span>
        </div>

        <form action="POST">
            <div id="sub-title-container">
                <h1>호텔 등록</h1>
            </div>

            <!-- 호텔 이름 입력-->
            <div class="insert-common-container">
                <div>
                    <p style="color:#913716;">* 는 필수 입력사항 입니다!</p>
                </div>
                <div>
                    <input id="hotel_name" name="hotel_name" type="text">
                </div>
            </div>

            <!--호텔 메인 썸네일 이미지 등록1 -->
            <div class="insert-common-container">
                <div>
                    <h3>* 호텔 메인 이미지 등록</h3>
                </div>

            </div>

            <!-- 호텔 디테일 이미지 등록 2-->
            <div class="insert-common-container">
                <div>
                    <h3>&nbsp;&nbsp;호텔 디테일 이미지 등록</h3>
                </div>
            </div>

            <!--호텔 도로명 주소 3 -->
            <div class="insert-common-container">
                <div>
                    <h3>* 호텔 도로명 주소</h3>
                </div>
            </div>

            <!-- 호텔 객실 정보 입력 4-->
            <div class="insert-common-container">
                <div>
                    <h3>* 호텔 객실 정보</h3>
                </div>
            </div>

            <!-- 호텔 전화번호 입력 5-->
            <div class="insert-common-container">
                <div>
                    <h3>* 호텔 전화번호</h3>
                </div>
            </div>

            <!-- 호텔 운영시간 6-->
            <div class="insert-common-container">
                <div>
                    <h3>* 호텔 운영시간</h3>
                </div>

            </div>

            <!-- 호텔 옵션 선택 7-->
            <div class="insert-common-container">
                <div>
                    <h3>* 호텔 옵션 선택</h3>

                </div>
            </div>

            <!-- 호텔 사이트 8-->
            <div class="insert-common-container">
                <div>
                    <h3>&nbsp;&nbsp;호텔 사이트</h3>
                    <input name="hotel_url" type="url" placeholder="https://">
                </div>
            </div>

            <!-- 호텔 해시태그 입력9 -->
            <div class="insert-common-container">
                <div class="insert-hashtag-guide-wrapper">
                    <h3>&nbsp;&nbsp;해시태그 입력</h3>
                    <ul>
                        <li><i class="fas fa-hashtag"></i>해시태그 입력 예시&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : <b>#호텔</b></li>
                        <li><i class="fas fa-hashtag"></i>해시태그 입력 최대글자 수 : <b>5글자</b></li>
                        <li><i class="fas fa-hashtag"></i>해시태그 최대 입력개수&nbsp;&nbsp;&nbsp;&nbsp; : <b>5개</b></li>
                    </ul>
                </div>

                <div class="insert-hashtag-wrapper">
                    <input type="text"  id="input-hashtag" placeholder="해시태그를 입력해주세요.">
                    <button id="input-hashtag-btn" onclick="insertHashTags();">해시태그 등록</button>
                </div>

                <!-- 등록된 해시태그들을 모으는 곳. -->
                <div class="saved-hashtags-wrapper">
                    <ul id="saved-hashtags">
                        <li><small>해시태그가 없습니다!</small></li>
                    </ul>
                </div>
                <script>
                    // insert hashtag function
                    function insertHashTags(){
                        //입력받은 해시태그
                        let inputHashTag= $('input-hashtag').val();
                        console.log(inputHashTag);

                        //해시태그 저장리스트
                        let hashTags=$('#saved-hashtags');
                        
                        hashTags.empty();
                        hashTags.append('<li><small>'+inputHashTag+'</small>');
                    }
                </script>
            </div>

            <!-- 호텔 등록하기 버튼 -->
            <input type="submit" id="insert-hotel-btn" value="등록 하기" />

        </form>        
    </div>

</body>

</html>