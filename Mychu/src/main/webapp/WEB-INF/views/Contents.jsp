<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>컨텐츠</title>
    <link rel="stylesheet" href="resources/css/font.css">
    <link rel="stylesheet" href="resources/css/default.css">
    <link rel="stylesheet" href="resources/css/contents.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // 탑버튼
        $(document).ready(function () {
            // 스크롤 이벤트 감지
            $(window).scroll(function () {
                if ($(this).scrollTop() > 300) { // 300px 이상 스크롤 시 버튼 표시
                    $('#go_top').fadeIn();
                } else {
                    $('#go_top').fadeOut();
                }
            });

            // 위로 가기 버튼 클릭 시 애니메이션
            $("#go_top").click(function () {
                $("html, body").animate({
                    scrollTop: 0
                }, "slow");
                return false;
            });
        });
    </script>
</head>

<body>
    <div id="home_wrap">
        <div id="go_top" class="top_bt"><img src="resources/img/top_icon.png" alt="top icon"></div>

        <!-- 모바일용 헤더 -->
        <header>
            <div class="logo_m"><a href="goMain"><img src="resources/img/logo.png"></a></div>
        </header>

        <div id="home">
            <!-- 검색창 -->
            <div id="search_box">
                <form action="goContents" method="get" class="search_con">
                    <input type="text" name="keyword" id="keyword" placeholder="검색할 영화를 입력하세요" value="${param.keyword}"
                        autocomplete="off" />
                    <!-- <button type="button">검색</button> -->
                    <ul id="autocomplete-list">
                    <!-- 자동완성 결과 여기에 추가 -->
                	</ul>
                </form>
            </div>
            
            <!-- 영화 영역 -->
            <div class="con_wrap">
                <div class="con top_movies">
                    <c:forEach items="${moviesList}" var="movie">

                        <div class="movie">
                            <img src="${movie.moviePosterUrl}" alt="영화 포스터 이미지"></img>

                            <div class="m_info">
                                <h4 class="movie-title">${movie.movieTitleKr}</h4> <!-- 마우스를 올릴 대상 -->                                
                                <p class="opened-at">
                                    개봉일 :
                                    <fmt:formatDate value="${movie.openedAt}" pattern="yyyy-MM-dd" />
                                </p>
                                <div class="overlay-text">${movie.movieTitleKr}</div>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </div> <!-- con_wrap 끝 -->
        </div> 
        
            <!-- 고정 메뉴-->
        <div id="nav_box">
            <a href="goMain">
                <div class="navcon"><img src="resources/img/home_icon.png" alt="홈">
                    <div class="menu_bt"><span>홈</span></div>
                </div>
            </a>
            
                        <c:if test="${empty loginInfo}">
                <!-- 로그인 전 -->
                <a href="#" class="nav_link" data-href="goLogin">
                    <div class="navcon">
                        <img src="resources/img/bookmark_icon.png" alt="나만의 컨텐츠">
                        <div class="menu_bt">
                            <span>나만의 컨텐츠</span>
                        </div>
                    </div>
                </a>
                <a href="#" class="nav_link" data-href="goLogin">
                    <div class="navcon">
                        <img src="resources/img/edit_icon.png" alt="게시글 작성">
                        <div class="menu_bt">
                            <span>게시글 작성</span>
                        </div>
                    </div>
                </a>
                <a href="#" class="nav_link" data-href="goLogin">
                    <div class="navcon">
                        <img src="resources/img/profile_icon.png" alt="로그인/회원가입">
                        <div class="menu_bt">
                            <span>로그인 / 회원가입</span>
                        </div>
                    </div>
                </a>
            </c:if>

            <c:if test="${not empty loginInfo}">
                <!-- 로그인 후 -->
                <a href="goContents">
                    <div class="navcon"><img src="resources/img/bookmark_icon.png" alt="나만의 컨텐츠">
                        <div class="menu_bt"><span>나만의 컨텐츠</span></div>
                    </div>
                </a>

                <a href="goWrite">
                    <div class="navcon"><img src="resources/img/edit_icon.png" alt="게시글 작성">
                        <div class="menu_bt"><span>게시글 작성</span></div>
                    </div>
                </a>

                <a href="gomy_Page">
                    <div class="navcon"><img src="resources/img/profile_icon.png" alt="프로필">
                        <div class="menu_bt"><span>마이페이지</span></div>
                    </div>
                </a>
                <a href="userLogout">
                    <div class="navcon"><img src="resources/img/logout_icon.png" alt="로그아웃">
                        <div class="menu_bt"><span>로그아웃</span></div>
                    </div>
                </a>
            </c:if>

<!--             <div class="logo_pc"><img src="resources/img/r_logo.png"></div> -->
        </div>
    </div>

    <script>
    $(document).ready(function () {
        var selectedIndex = -1; // 전역 변수로 selectedIndex 선언

        // 자동완성 항목 탐색
        $("#keyword").on("input", function () {
            var keyword = $(this).val();
            selectedIndex = -1; // 입력 시 selectedIndex 초기화
            if (keyword.length > 0) {
                $.ajax({
                    url: "autocomplete",  // 자동완성 데이터를 가져올 엔드포인트
                    method: "GET",
                    data: { keyword: keyword },
                    success: function (data) {
                        var list = $("#autocomplete-list");
                        list.empty();  // 기존 리스트 초기화
                        if (data.length > 0) {
                            list.show();  // 리스트 표시
                            $.each(data, function (index, value) {
                                list.append("<li class='autocomplete-item'>" + value + "</li>");
                            });
                        } else {
                            list.hide();  // 검색 결과가 없으면 숨기기
                        }
                    }
                });
            } else {
                $("#autocomplete-list").hide();
            }
        });

        // 키보드 이벤트 처리 (ArrowUp, ArrowDown, Enter)
        $("#keyword").on("keydown", function (e) {
            var listItems = $("#autocomplete-list li");  // 자동완성 리스트 항목들

            if (listItems.length > 0) { // 자동완성 항목이 있을 때만
                if (e.key === "ArrowDown") {
                    e.preventDefault(); // 기본 동작 막기
                    selectedIndex = (selectedIndex + 1) % listItems.length;  // 리스트 끝에서 처음으로
                    listItems.removeClass("selected");  // 모든 항목에서 'selected' 클래스 제거
                    $(listItems[selectedIndex]).addClass("selected");  // 선택된 항목에 'selected' 클래스 추가
                } else if (e.key === "ArrowUp") {
                    e.preventDefault(); // 기본 동작 막기
                    selectedIndex = (selectedIndex - 1 + listItems.length) % listItems.length;  // 리스트 처음에서 끝으로
                    listItems.removeClass("selected");  // 모든 항목에서 'selected' 클래스 제거
                    $(listItems[selectedIndex]).addClass("selected");  // 선택된 항목에 'selected' 클래스 추가
                } else if (e.key === "Enter") {
                    if (selectedIndex >= 0 && listItems.length > 0) {
                        // 자동완성 리스트에서 선택된 항목이 있을 경우
                        e.preventDefault();  // 기본 폼 제출 방지
                        var selectedText = $(listItems[selectedIndex]).text();  // 선택된 항목의 텍스트
                        $("#keyword").val(selectedText);  // 선택된 항목을 입력 필드에 반영
                        $("#autocomplete-list").hide();  // 자동완성 리스트 숨기기

                        // 선택된 항목이 있을 경우 바로 폼 제출
                        $(this).closest("form").submit();
                    }
                }
            } else {
                // 자동완성 목록이 없을 때 Enter 키를 누르면 폼 제출
                if (e.key === "Enter") {
                    // 자동완성 항목이 없으면 기본적으로 폼 제출을 허용
                    return true;
                }
            }
        });

        // 검색 버튼 클릭 시
        $("form button[type=button]").on("click", function () {
            var listItems = $("#autocomplete-list li");
            
            // 자동완성 목록에서 선택된 항목이 있을 경우
            if (selectedIndex >= 0 && listItems.length > 0) {
                var selectedText = $(listItems[selectedIndex]).text();  // 선택된 항목의 텍스트
                $("#keyword").val(selectedText);  // 선택된 항목을 입력 필드에 반영
            }

            // 폼 제출 (자동완성 항목이 선택되었든 아니든)
            $(this).closest("form").submit();
        });

        // 자동완성 항목 클릭 시
        $(document).on("click", ".autocomplete-item", function () {
            $("#keyword").val($(this).text());  // 클릭한 항목을 입력창에 설정
            $("#autocomplete-list").hide();  // 자동완성 리스트 숨기기
        });

        // 클릭 외 영역 클릭 시 자동완성 리스트 닫기
        $(document).click(function (e) {
            if (!$(e.target).closest('#search_box').length) {
                $("#autocomplete-list").hide();  // 클릭한 곳이 검색창 외부라면 자동완성 리스트 숨기기
            }
        });
    });
   </script>
</body>

</html>