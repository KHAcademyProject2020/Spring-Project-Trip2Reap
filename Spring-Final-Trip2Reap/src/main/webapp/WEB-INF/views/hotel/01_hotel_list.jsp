<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <!-- css -->
    <link rel="stylesheet" href="resources/css/hotel/01_hotel_list.css">

    <!-- font-awesome -->
    <script src="https://kit.fontawesome.com/09697e2134.js" crossorigin="anonymous"></script>
    <title>호텔 페이지</title>

</head>

<body>
    <div id="main-container">
        <div id="title-container">
            <img id="hotel-icon" src="resources/images/hotel.png">
            <span id="title-name">호텔 예약</span>
            <hr>
        </div>

        <div id="button-container">
            <div id="left_btns_container">
                <ul id="left_btns" class="btn_ul">
                    <li><button id="insert-hotel" class="btn">호텔 등록하기</button></li>
                    <li><button id="detail-search" class="btn">상세검색</button></li>
                </ul>

            </div>

            <div></div>

            <div id="right_btns_container">
                <ul id="right_btns" class="btn_ul">
                    <li><button class="btn">인기순</button></li>
                    <li><button class="btn">가격순</button></li>
                    <li><button class="btn">등록순</button></li>
                </ul>
            </div>
        </div>

        <div id="hotel-list-container">

            <!-- 호텔 1개(샘플1) -->
            <div class="one-hotel-info-container">
                <img src="resources/images/sample_hotel.jpg" alt="호텔이미지">

                <div class="detail-info-container">
                    <div>
                        <div class="info-container">
                            <!-- 호텔이름 -->
                            <div class="hotel-name-container">
                                <h1>호텔 델루나{호텔이름}</h1>
                            </div>

                            <!-- 좋아요 버튼 -->
                            <div class="i-like-btn-container">
                                <i class="far fa-heart"></i>
                            </div>
                        </div>
                        <hr>
                    </div>


                    <div class="detail-info-wrapper">
                        <!-- 호텔주소 -->
                        <div class="hotel-addr-wrapper">
                            <small>{호텔주소}</small>
                        </div>


                        <div class="hotel-info-wrapper">
                            <!-- 별점 -->
                            <div class="hotel-review-container">
                                <span class="star-point">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star-half-alt"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                </span>
                                <span> 2.54 / 5 </span>
                            </div>

                            <hr>
                            <!-- 1박 가격 -->
                            <div class="hotel-per-day-price-container info-container">
                                <p>
                                    <small>1박 중</small>&nbsp;&nbsp;<b>47,216원</b>
                                </p>
                            </div>
                        </div>
                    </div>

                    <button class="hotel-reserve-btn">예약하기</button>
                </div>
            </div>
            <!-- 호텔1개(샘플1) 끝-->

            <!-- 호텔 1개(샘플2) -->
            <div class="one-hotel-info-container">
                <img src="resources/images/trump.jpeg" alt="호텔이미지">

                <div class="detail-info-container">
                    <div>
                        <div class="info-container">
                            <!-- 호텔이름 -->
                            <div class="hotel-name-container">
                                <h1>호텔 트럼프</h1>
                            </div>

                            <!-- 좋아요 버튼 -->
                            <div class="i-like-btn-container">
                                <i class="far fa-heart"></i>
                            </div>
                        </div>
                        <hr>
                    </div>


                    <div class="detail-info-wrapper">
                        <!-- 호텔주소 -->
                        <div class="hotel-addr-wrapper">
                            <small>미국 라스베가스 trump 거리</small>
                        </div>


                        <div class="hotel-info-wrapper">
                            <!-- 별점 -->
                            <div class="hotel-review-container">
                                <span class="star-point">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                </span>
                                <span> 3.0 / 5 </span>
                            </div>

                            <hr>
                            <!-- 1박 가격 -->
                            <div class="hotel-per-day-price-container info-container">
                                <p>
                                    <small>1박 중</small>&nbsp;&nbsp;<b>47,216원</b>
                                </p>
                            </div>
                        </div>
                    </div>

                    <button class="hotel-reserve-btn">예약하기</button>
                </div>
            </div>
            <!-- 호텔 1개(샘플2) 끝 -->


            <!-- 호텔 1개(샘플3) 시작 -->
            <div class="one-hotel-info-container">
                <img src="resources/images/sinra.jpeg" alt="호텔이미지">

                <div class="detail-info-container">
                    <div>
                        <div class="info-container">
                            <!-- 호텔이름 -->
                            <div class="hotel-name-container">
                                <h1>신라호텔</h1>
                            </div>

                            <!-- 좋아요 버튼 -->
                            <div class="i-like-btn-container">
                                <i class="far fa-heart"></i>
                            </div>
                        </div>
                        <hr>
                    </div>


                    <div class="detail-info-wrapper">
                        <!-- 호텔주소 -->
                        <div class="hotel-addr-wrapper">
                            <small>서울특별시 중구 장충동 동호로249</small>
                        </div>


                        <div class="hotel-info-wrapper">
                            <!-- 별점 -->
                            <div class="hotel-review-container">
                                <span class="star-point">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                </span>
                                <span> 3.0 / 5 </span>
                            </div>

                            <hr>
                            <!-- 1박 가격 -->
                            <div class="hotel-per-day-price-container info-container">
                                <p>
                                    <small>1박 중</small>&nbsp;&nbsp;<b>47,216원</b>
                                </p>
                            </div>
                        </div>
                    </div>

                    <button class="hotel-reserve-btn">예약하기</button>
                </div>
            </div>
            <!-- 호텔 1개(샘플3) 끝 -->


            <!-- 호텔1개 (샘플4) 시작 -->
            <div class="one-hotel-info-container">
                <img src="resources/images/sinra.jpeg" alt="호텔이미지">

                <div class="detail-info-container">
                    <div>
                        <div class="info-container">
                            <!-- 호텔이름 -->
                            <div class="hotel-name-container">
                                <h1>신라호텔</h1>
                            </div>

                            <!-- 좋아요 버튼 -->
                            <div class="i-like-btn-container">
                                <i class="far fa-heart"></i>
                            </div>
                        </div>
                        <hr>
                    </div>


                    <div class="detail-info-wrapper">
                        <!-- 호텔주소 -->
                        <div class="hotel-addr-wrapper">
                            <small>서울특별시 중구 장충동 동호로249</small>
                        </div>


                        <div class="hotel-info-wrapper">
                            <!-- 별점 -->
                            <div class="hotel-review-container">
                                <span class="star-point">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                </span>
                                <span> 3.0 / 5 </span>
                            </div>

                            <hr>
                            <!-- 1박 가격 -->
                            <div class="hotel-per-day-price-container info-container">
                                <p>
                                    <small>1박 중</small>&nbsp;&nbsp;<b>47,216원</b>
                                </p>
                            </div>
                        </div>
                    </div>

                    <button class="hotel-reserve-btn">예약하기</button>
                </div>
            </div>
            <!-- 호텔1개(샘플4) 끝 -->


            <!-- 호텔 1개(샘플5) 시작 -->
            <div class="one-hotel-info-container">
                <img src="resources/images/sinra.jpeg" alt="호텔이미지">

                <div class="detail-info-container">
                    <div>
                        <div class="info-container">
                            <!-- 호텔이름 -->
                            <div class="hotel-name-container">
                                <h1>신라호텔</h1>
                            </div>

                            <!-- 좋아요 버튼 -->
                            <div class="i-like-btn-container">
                                <i class="far fa-heart"></i>
                            </div>
                        </div>
                        <hr>
                    </div>


                    <div class="detail-info-wrapper">
                        <!-- 호텔주소 -->
                        <div class="hotel-addr-wrapper">
                            <small>서울특별시 중구 장충동 동호로249</small>
                        </div>


                        <div class="hotel-info-wrapper">
                            <!-- 별점 -->
                            <div class="hotel-review-container">
                                <span class="star-point">
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="fas fa-star"></i>
                                    <i class="far fa-star"></i>
                                    <i class="far fa-star"></i>
                                </span>
                                <span> 3.0 / 5 </span>
                            </div>

                            <hr>
                            <!-- 1박 가격 -->
                            <div class="hotel-per-day-price-container info-container">
                                <p>
                                    <small>1박 중</small>&nbsp;&nbsp;<b>47,216원</b>
                                </p>
                            </div>
                        </div>
                    </div>

                    <button class="hotel-reserve-btn">예약하기</button>
                </div>
            </div>
            <!-- 호텔1개(샘플5) 끝 -->

        </div>
        <!--호텔리스트 끝  -->


        <!-- 호텔페이지네이션 시작 -->
        <div id="pagination-container">
            <nav>
                <ul>

                    <!-- 맨앞으로 -->
                    <li><a href="">&laquo;</a></li>
                    <li></li>

                    <!-- 페이지번호 -->
                    <li><a href="">1</a></li>
                    <li><a href="">2</a></li>
                    <li><a href="">3</a></li>
                    <li><a href="">4</a></li>
                    <li><a href="">5</a></li>

                    <!-- 맨뒤로 이동 -->
                    <li><a href="">&raquo;</a></li>
                </ul>
            </nav>

        </div>
        <!-- 호텔페이지네이션 끝 -->
    </div>


    <!-- modal-->
    <div id="modal-container">
        <div id="modal-background" class="modal-background">
            <div class="modal">

                <div class="close-modal-container">
                    <div></div>
                    <div>
                        <i id="close_btn" class="fas fa-times"></i>
                    </div>
                </div>

                <div class="modal-title-container">
                    <h2>상세검색</h2>
                </div>

                <div class="modal-body-container">
                    <table >
                        <tr colspan=3>
                            <td>
                                <h5>지역검색</h5>
                            </td>
                            <td>
                                <select class="detail-search-option" name="place" id="place">
                                    <option value="">지역선택</option>
                                    <option value="강원도">강원도</option>
                                    <option value="경기도">경기도</option>
                                    <option value="경상남도">경상남도</option>
                                    <option value="경상북도">경상북도</option>
                                    <option value="광주광역시">광주광역시</option>
                                    <option value="대구광역시">대구광역시</option>
                                    <option value="대전광역시">대전광역시</option>
                                    <option value="부산광역시">부산광역시</option>
                                    <option value="서울특별시">서울특별시</option>
                                    <option value="세종특별자치시">세종특별자치시</option>
                                    <option value="인천광역시">인천광역시</option>
                                    <option value="울산광역시">울산광역시</option>
                                    <option value="전라북도">전라북도</option>
                                    <option value="전라남도">전라남도</option>
                                    <option value="제주특별자치도">제주특별자치도</option>
                                    <option value="충청북도">충청북도</option>
                                    <option value="충청남도">충청남도</option>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <h5>호텔등급</h5>
                            </td>
                            <td>
                                <select class="detail-search-option" name="rank" id="rank">
                                    <option value="">등급 선택</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <h5>가격대 </h5>
                            </td>
                            <td>
                                <select class="detail-search-option" name="price-per-day" id="price-per-day">
                                    <option value="">가격 선택</option>
                                    <option value="5만원 미만">5만원 미만</option>
                                    <option value="10만원 미만">5만원 이상 ~ 10만원 미만</option>
                                    <option value="15만원 미만">10만원 이상 ~ 15만원 미만</option>
                                    <option value="20만원 미만">15만원 이상 ~ 20만원 미만</option>
                                    <option value="20만원 이상">20만원 이상</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h5>호텔이름</h5>
                            </td>
                            <td>
                                <input class="detail-search-option" name="hotel-name" id="hotel-name" type="text">
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="modal-btn-container">
                    <button id="detail-hotel-search">호텔 검색</button>
                </div>

            </div>
        </div>
    </div>
    <!-- modal끝 -->


</body>
<script>
    // modal
    $(function(){
        var $detailSearchBtn=$('#detail-search'),
        $modalContainer = $('#modal-container'),
        $body = $('body'),
        $content= $('#main-container'),
        $closeBtn= $('#close_btn'),
        $btnId;

        // 상세검색 버튼을 클릭.
        $detailSearchBtn.on('click', function(){
            //버튼아이디를 불러옵니다.
            $btnId= $(this).attr('id'); //detail-search 
            
            //modal-container에 기존 클래스들을 빼놓고, btnId클래스를 적용합니다.
            $modalContainer
                .removeAttr('class')
                .addClass($btnId);

            $content
                .removeAttr('class')
                .addClass('content');

            $body.addClass('modal-active'); //body에 modal-active라는 클래스를 적용.
            
            $content.addClass($btnId);
        });

        //닫기버튼(x 표시 아이콘) 클릭시
        $closeBtn.on('click', function(){
            $modalContainer.addClass('out');
            $body.removeClass('modal-active'); //modal-active 클래스 해제
        
            if($modalContainer.hasClass($btnId)){
                $content.addClass('out');
            }
        });
    });

    $(function(){
        $('.far-heart').click(function(){
            
        });
    });

</script>


</html>