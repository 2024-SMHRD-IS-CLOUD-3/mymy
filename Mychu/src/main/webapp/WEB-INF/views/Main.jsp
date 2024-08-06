<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈</title>
    <link rel="stylesheet" href="resources/css/basic.css">
    <link rel="stylesheet" href="resources/css/main.css">
</head>

<!-- top 버튼

<script>
    $(document).ready(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 0) {
            $('#go_top').fadeIn();
            } else {
            $('#go_top').fadeOut();
            }
            });
        $('.top_bt').click(function() {
            $('html, body').animate({
                scrollTop: 0
            }, 400);
            return false;
        });
    });
</script>

 -->

 <script>
    
 </script>

<body>
    <div id="home_pc_wrap">
        <div id="go_top" class="top_bt"><img src="resources/img/top_icon.png"></div>

        <div id="nav_box">
            <a href="/boot"><div class="navcon menu1"><img src="resources/img/home_icon.png"><div class="menu_bt">홈</div></div></a>
            <a href="goContent"><div class="navcon menu2"><img src="resources/img/bookmark_icon.png"><div class="menu_bt">나만의 컨텐츠</div></div></a>

			<c:if test="${empty loginInfo}">
            	<a href="goLogin"><div class="navcon menu3"><img src="resources/img/profile_icon.png"><div class="menu_bt">로그인 / 회원가입</div></div></a>
			</c:if>
			
			<c:if test="${not empty loginInfo}">
            	<a href="gomy_Page"><div class="navcon menu4"><img src="resources/img/profile_icon.png"><div class="menu_bt">마이페이지</div></div></a>
            	<a href="userLogout"><div class="navcon menu5"><img src="resources/img/logout_icon.png"><div class="menu_bt">로그아웃</div></div></a>
			</c:if>
			
            <div class="logo"><img src="resources/img/r_logo.gif"></div>
        </div>
        <div id="home_pc">
            <div class="con_wrap_pc">
                <div class="container">
        <form class="post-form">
            <textarea id="post-content" rows="4" placeholder="영화 추천 글 작성시에는 게시물 내용에 OTT 플랫폼(넷플릭스, 웨이브, 티빙, 왓차 등)을 포함하여 장르를 선택해주세요" required></textarea>
            <div role="slider" id="genre_box">
                <!-- <button id="prev" class="arrow-btn" type="button">&lt;</button> -->
                <input id="genre_1" type="checkbox" name="genre" class="check" value="코미디">
                <label for="genre_1"><span>코미디</span></label>
                <!-- <input id="genre_2" type="checkbox" name="genre" class="check" value="로맨스">
                <label for="genre_2"><span>로맨스</span></label>
                <input id="genre_3" type="checkbox" name="genre" class="check" value="드라마">
                <label for="genre_3"><span>드라마</span></label>
                <input id="genre_4" type="checkbox" name="genre" class="check" value="멜로">
                <label for="genre_4"><span>멜로</span></label>
                <input id="genre_5" type="checkbox" name="genre" class="check" value="호러">
                <label for="genre_5"><span>호러</span></label>
                <input id="genre_6" type="checkbox" name="genre" class="check" value="스릴러">
                <label for="genre_6"><span>스릴러</span></label>
                <input id="genre_7" type="checkbox" name="genre" class="check" value="액션">
                <label for="genre_7"><span>액션</span></label>
                <input id="genre_8" type="checkbox" name="genre" class="check" value="판타지">
                <label for="genre_8"><span>판타지</span></label>
                <input id="genre_9" type="checkbox" name="genre" class="check" value="SF">
                <label for="genre_9"><span>SF</span></label>
                <input id="genre_10" type="checkbox" name="genre" class="check" value="애니메이션">
                <label for="genre_10"><span>애니메이션</span></label> -->
                <!-- <button id="next" class="arrow-btn" type="button">&gt;</button> -->
            </div>
            <br>
            <button type="button" id="boardappend">등록</button>
        </form>
        <div class="search">
            <input type="text" placeholder="검색할 게시물 내용을 입력하세요">
            <button type="submit">🍳</button>
        </div>
        <div id="posts"></div>
    </div>
            </div>
        </div>
    </div> <!-- pc용 home_pc_wrap 끝 -->

    <!-- m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 -->
    <div id="home_m_wrap">
        <div id="go_top" class="top_bt"><img src="resources/img/top_icon.png"></div>
        <!-- 헤더 고정 -->
        <header id="header_m"><div class="logo_m"><img src="resources/img/logo.gif"></div></header>
        <div id="home_m">
            <div class="con_wrap_m">
               <div class="container">
        <form class="post-form">
            <textarea id="post-content" rows="4" placeholder="영화 추천 글 작성시에는 게시물 내용에 OTT 플랫폼(넷플릭스, 웨이브, 티빙, 왓차 등)을 포함하여 장르를 선택해주세요" required></textarea>
            <div role="slider" id="genre_box">
                <!-- <button id="prev" class="arrow-btn" type="button">&lt;</button> -->
                <input id="genre_1" type="checkbox" name="genre" class="check" value="코미디">
                <label for="genre_1"><span>코미디</span></label>
                
            </div>
            <br>
            <button type="button" id="boardappend">등록</button>
        </form>
        <div class="search">
            <input type="text" placeholder="검색할 게시물 내용을 입력하세요">
            <button type="submit">🍳</button>
        </div>
        <div id="posts"></div>
    </div>
            </div>
        </div>
        <!-- 네비 고정 -->
        <div id="nav_box_m">
            <div class="navcon_m menu1_m">  <a href="/boot"><img src="resources/img/home_icon.png"> </a></div>
            <div class="navcon_m menu2_m"><img src="resources/img/bookmark_icon.png"></div>
           <c:if test="${empty loginInfo}">
            <div class="navcon_m menu3_m"> <a href="goLogin"><img src="resources/img/profile_icon.png"></a></div>
            </c:if>
            <c:if test="${not empty loginInfo}">
            <div class="navcon_m menu3_m"> <a href="gomy_Page"><img src="resources/img/profile_icon.png"></a></div>
            <div class="navcon_m menu3_m"> <a href="userLogout"><img src="resources/img/logout_icon.png"></a></div>
            </c:if>
            
        </div>
    </div> <!-- 반응형 home_m_wrap 끝 -->
    
    <script src="resources/js/main.js"></script>
</body>
</html>