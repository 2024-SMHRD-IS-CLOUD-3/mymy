<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>홈</title>
<link rel="stylesheet" href="resources/css/main.css">
<link rel="stylesheet" href="resources/css/default.css">
<link rel="stylesheet" href="resources/css/font.css">

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
	<c:if test="${not empty loginInfo}">
		 <c:if test="${empty userGenres}">
		<form action="saveGenres" post="method">
		<input type="hidden" name="userId" value="${loginInfo.userId}" /> 
			<div id="genre_modal">
				<div class="genre_box">
					<label class="label_title">선호하는 장르 3가지 선택</label>
					<!-- input id값 = label for값 연결 -->
					<c:forEach items="${genres}" var="genre" varStatus="i">
						<input id="genre_${genre.genreIdx}" type="checkbox" name="genreIds"
							class="check" value="${genre.genreIdx}">
						<label for="genre_${genre.genreIdx}"><span>${genre.genreName}</span></label>
					</c:forEach>
				</div>

				<input type="submit" value="선택 완료" class="submit_btn">
			</div>
		</form>
	</c:if>
	</c:if>
	<div id="home_wrap">
		<div id="go_top" class="top_bt">
			<img src="resources/img/top_icon.png">
		</div>

		<!-- 모바일용 헤더 -->
		<header>
			<div class="logo_m">
				<a href="goMain"><img src="resources/img/logo.gif"></a>
			</div>
		</header>

		<div id="home">
			<div class="con_wrap">

				<c:forEach items="${posts}" var="post" varStatus="i">
					<div class="container">
						<div class="user-section">
							<div>
								<strong>${post.userIdx.userName}</strong>
							</div>
							<div class="created-at">
								<fmt:formatDate value="${post.createdAt}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</div>
						</div>
						<div>${post.postContent}</div>
						<a class="like-section" href="javascript:void(0);"
							onclick="increaseLike()"> 좋아요 ♥ <span class="like-count">0</span>
						</a>
					</div>
				</c:forEach>




			</div>
		</div>

		<!-- 고정 메뉴-->
		<div id="nav_box">
			<a href="goMain">
				<div class="navcon">
					<img src="resources/img/home_icon.png">
					<div class="menu_bt">
						<span>홈</span>
					</div>
				</div>
			</a>

			<c:if test="${empty loginInfo}">
				<!-- 로그인 전 -->

				<a href="goLogin">
					<div class="navcon">
						<img src="resources/img/bookmark_icon.png">
						<div class="menu_bt">
							<span>나만의 컨텐츠</span>
						</div>
					</div>
				</a>

				<a href="goLogin">
					<div class="navcon">
						<img src="resources/img/edit2_icon.png">
						<div class="menu_bt">
							<span>게시글 작성</span>
						</div>
					</div>
				</a>

				<a href="goLogin">
					<div class="navcon">
						<img src="resources/img/profile_icon.png">
						<div class="menu_bt">
							<span>로그인 / 회원가입</span>
						</div>
					</div>
				</a>

			</c:if>

			<c:if test="${not empty loginInfo}">
				<!-- 로그인 후 -->
				<a href="goContents">
					<div class="navcon">
						<img src="resources/img/bookmark_icon.png">
						<div class="menu_bt">
							<span>나만의 컨텐츠</span>
						</div>
					</div>
				</a>

				<a href="goWrite">
					<div class="navcon">
						<img src="resources/img/edit2_icon.png">
						<div class="menu_bt">
							<span>게시글 작성</span>
						</div>
					</div>
				</a>

				<a href="gomy_Page">
					<div class="navcon">
						<img src="resources/img/profile_icon.png">
						<div class="menu_bt">
							<span>마이페이지</span>
						</div>
					</div>
				</a>
				<a href="userLogout">
					<div class="navcon">
						<img src="resources/img/logout_icon.png">
						<div class="menu_bt">
							<span>로그아웃</span>
						</div>
					</div>
				</a>
			</c:if>

			<div class="logo_pc">
				<img src="resources/img/r_logo.gif">
			</div>
		</div>
	</div>
</body>

</html>