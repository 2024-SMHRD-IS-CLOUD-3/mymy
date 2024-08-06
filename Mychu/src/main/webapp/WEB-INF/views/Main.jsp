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
                <button id="prev" class="arrow-btn" type="button">&lt;</button>
             
                <c:forEach items="${list}" var="genre" varStatus="i"> 
                    <input id="genre_${genre.genreIdx}" type="checkbox" name="genre" class="check" value="${genre.genreName}">
                <label for="genre_${genre.genreIdx}"><span>${genre.genreName}</span></label>
                </c:forEach> 
                <button id="next" class="arrow-btn" type="button">&gt;</button>
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