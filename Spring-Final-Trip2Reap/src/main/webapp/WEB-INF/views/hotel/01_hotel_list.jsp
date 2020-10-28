<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- css파일 이용 -->
    <link rel="stylesheet" href="resources/css/hotel/01_hotel_list.css">

    <!-- API CDN-->
    <!--Bootstrap-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>

    <!--FontAwesome-->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
        integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">

    <title>호텔예약 메인 페이지</title>
</head>


<body>
    <%-- navigation-bar(start)--%>
    <c:import url="../common/menubar.jsp" />
    <%-- navigation-bar(end) --%>


    <%-- main-container (start) --%>
    <div class="container main-container">

        <%--호텔 예약 타이틀(start) --%>
        <div class="container" id="title_img_container">
            <div class="container" id="hotel_menu_container">
                <div class="img"></div>
                <h1 id="main-title">호텔 예약</h1>
            </div>
            <hr class="my-4">
        </div>
        <%--호텔예약 타이틀(end) --%>


        <%-- top_menu_bar (start) : 검색 메뉴바 --%>
        <div class="container" id="nav_container">
            <nav id="top_menu_bar">
                <div>
                    <ul id="detail_search">
                        <!--<%--"호텔 등록" 관리자만 가능하다. --%>-->
                        <li>
                            <button id="insertHotel" type="button" class="btn btn-success">호텔 등록</button>
                        </li>
                        <li>
                            <button id="searchHotel" type="button" class="btn btn-success" data-toggle="modal"
                                data-target="#detailSearchModal">상세검색</button>
                        </li>
                    </ul>
                </div>


                <div></div>

                <div>
                    <ul id="category_search">
                        <li><button class="btn btn-success category_btns">인기순</button></li>
                        <li><button class="btn btn-success category_btns">가격순</button></li>
                        <li><button class="btn btn-success category_btns">등급순</button></li>
                    </ul>
                </div>
            </nav>
        </div>
        <%--top_menu_bar(end) --%>



        <%-- hotel lists(start) --%>
        <div class="container" id="hotel_lists_container">
        
            <%--one-hotel info (start) :  1개 호텔 정보만 넣는다.--%>
            <div class="one-hotel-container">
                <%--호텔번호 (추후 jsp코드에 넣을예정)--%>

                <%-- 좋아요버튼 컨테이너--%>
                <div class="like-container">
                    <i class="far fa-heart not_like"></i>
                </div>

                <%-- 호텔정보  컨테이너 --%>
                <div class="hotel-info-container">

                    <!-- 호텔이미지 컨테이너 -->
                    <div class="hotel-thumbnail-img-container">
                        <img src="resources/images/sample_hotel.jpg" alt="{src에 이미지경로를 넣는다.}">
                    </div>


                    <%-- 호텔이름&호텔등급 & 호텔도로명주소 --%>
                    <div class="hotel-detail-info-container">
                        <div class="hotel-rank-address-container">
                            <div class="hotel-name-">
                                <h1>{호텔이름}</h1>
                                <span class="hotel-rank"><b>{호텔등급1~5}</b>성급</span>
                            </div>

                            <p class="hotel-address">{호텔 도로명 주소}</p>
                        </div>

                        <%-- 최소 1박가격 --%>
                        <div class="hotel-miniest-prices-container">
                            <h3>1박 {가격}원</h3>
                        </div>

                        <%-- 호텔 리뷰점수 --%>
                        <div class="review-score-container">
                            <!--별모양 그림~ (소수점첫째자리가 0.5이상일때는 별반개 표시)-->
                            <span>({리뷰점수} / 5)</span>
                        </div>

                        <%-- 해시태그(최대5개) --%>
                        <div class="hash-tags-container">
                            <span>#<small>{해시태그 이름}</small></span>
                        </div>
                    </div>

                </div>
            </div>
            <%--one hotel info (end) --%>
            
            
            
                        <%--one-hotel info (start) :  1개 호텔 정보만 넣는다.--%>
            <div class="one-hotel-container">
                <%--호텔번호 (추후 jsp코드에 넣을예정)--%>

                <%-- 좋아요버튼 컨테이너--%>
                <div class="like-container">
                    <i class="far fa-heart not_like"></i>
                </div>

                <%-- 호텔정보  컨테이너 --%>
                <div class="hotel-info-container">

                    <!-- 호텔이미지 컨테이너 -->
                    <div class="hotel-thumbnail-img-container">
                        <img src="resources/images/sample_hotel.jpg" alt="{src에 이미지경로를 넣는다.}">
                    </div>


                    <%-- 호텔이름&호텔등급 & 호텔도로명주소 --%>
                    <div class="hotel-detail-info-container">
                        <div class="hotel-rank-address-container">
                            <div class="hotel-name-">
                                <h1>{호텔이름}</h1>
                                <span class="hotel-rank"><b>{호텔등급1~5}</b>성급</span>
                            </div>

                            <p class="hotel-address">{호텔 도로명 주소}</p>
                        </div>

                        <%-- 최소 1박가격 --%>
                        <div class="hotel-miniest-prices-container">
                            <h3>1박 {가격}원</h3>
                        </div>

                        <%-- 호텔 리뷰점수 --%>
                        <div class="review-score-container">
                            <!--별모양 그림~ (소수점첫째자리가 0.5이상일때는 별반개 표시)-->
                            <span>({리뷰점수} / 5)</span>
                        </div>

                        <%-- 해시태그(최대5개) --%>
                        <div class="hash-tags-container">
                            <span>#<small>{해시태그 이름}</small></span>
                        </div>
                    </div>

                </div>
            </div>
            <%--one hotel info (end) --%>
            
        </div>
        <%--  hotel list (end) --%>



        <%-- paginations(start) --%>
        <div class="container" id="paginations_container">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <%--맨처음 페이지--%>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>


                    <%--이전페이지--%>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true"><small>&lt;</small></span>
                        </a>
                    </li>

                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>

                    <%--다음 페이지--%>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true"><small>&gt;</small></span>
                        </a>
                    </li>

                    <%--맨마지막 페이지--%>
                    <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
        <%-- paginations (end) --%>
    </div>
    <%-- main-container (end) --%>



    <%-- footer(start) --%>
    <%-- footer(end) --%>



    <%--detail search modal(start)--%>
    <div class="modal fade" id="detailSearchModal" tabindex="-1" aria-labelledby="detailSearchLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="detailSearchLabel">상세 검색</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                
                
                    상세검색페이지
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">검색</button>
                </div>
            </div>
        </div>
    </div>
    <%-- detail search modal(end) --%>
</body>
<script>
//하트를 마우스 호버하면 하트모양을 바꿔보자.


</script>

</html>