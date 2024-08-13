<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">

  <title>Html Generated</title>
  <meta name="description" content="Figma htmlGenerator">
  <meta name="author" content="htmlGenerator">
  <link href="https://fonts.googleapis.com/css?family=Inter&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="resources/css/default.css">
  <link rel="stylesheet" href="resources/css/mypage.css">
  <style>
    body {
      background: #E5E5E5;
    }
  </style>

</head>

<body>
  <div class=e4_803>
    <div class="e6_863">
    </div>


    <div class=e6_861>
      <!-- 프로필사진  -->
      <div class="e5_809">
      </div>

      <div class=e6_834>
        <div class="e6_835">
        <img alt="프로필" src="resources/profile/${not empty loginInfo.profile ? loginInfo.profile : 'ellipse_2.png'}" class="e6_835">
        </div>
        <div class="e6_836"></div>
      </div>

      <span class="e6_837">${loginInfo.userName}</span>
      <div class=e6_839>
        <span class="e6_003" >장르1 장르2 장르3</span>
      </div>


      <div class=e6_843>
        <div class=e6_844>
          <span class="e6_845">122</span>
          <span class="e6_846">게시글</span>
        </div>
        <!-- <div class=e6_847> -->
        <!-- <span class="e6_848">37K</span> -->
        <!-- <span class="e6_849">likes</span> -->
        <!-- </div> -->
        <div class=e6_850>
          <span class="e6_851">67</span>
          <span class="e6_852">팔로잉</span>
        </div>
      </div>
      <div class=e6_853>
        <div class=e6_854>
          <div class="e6_855">
            <span class="e6_856">프로필 수정</span>
          </div>
          <br>
          <div class="e6_001">
            <span class="e6_002">티켓 만들기</span>
          </div>
        </div>

      </div>
    </div>


    <span class="e6_951">마이티켓</span>
    <span class="e6_952">작성한 글</span>
    <!-- <span class="e6_000">좋아요 한 글</span> -->



    <div class=e6_953>


      <!-- <div class="e6_954"></div> -->
      <div class="flip-container">
        <div class="flipper">
          <div class="front"></div>
          <div class="back">
            <span class="e6_004">영화 제목</span>
            <br>
            <span class="e6_005">DATE : </span>
            <br>
            <span class="e6_006">COMMENT : </span>
            <br>
            <span class="e6_007">평점</span>
            <span class="e6_008">★★★★★</span>
          </div>
        </div>
      </div>


      <div class="e6_963">
      </div>

    </div>
      <!-- 고정 메뉴-->
		<div id="nav_box">
			<a href="goMain">
				<div class="navcon">
					<img src="resources/img/home_icon.png" alt="홈">
					<div class="menu_bt">
						<span>홈</span>
					</div>
				</div>
			</a>

			<c:if test="${empty loginInfo}">
				<!-- 로그인 전 -->
				<a href="goLogin">
					<div class="navcon">
						<img src="resources/img/bookmark_icon.png" alt="나만의 컨텐츠">
						<div class="menu_bt">
							<span>나만의 컨텐츠</span>
						</div>
					</div>
				</a>

				<a href="goLogin">
					<div class="navcon">
						<img src="resources/img/edit_icon.png" alt="게시글 작성">
						<div class="menu_bt">
							<span>게시글 작성</span>
						</div>
					</div>
				</a>

				<a href="goLogin">
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
					<div class="navcon">
						<img src="resources/img/bookmark_icon.png" alt="나만의 컨텐츠">
						<div class="menu_bt">
							<span>나만의 컨텐츠</span>
						</div>
					</div>
				</a>

				<a href="goWrite">
					<div class="navcon">
						<img src="resources/img/edit_icon.png" alt="게시글 작성">
						<div class="menu_bt">
							<span>게시글 작성</span>
						</div>
					</div>
				</a>
				<a href="gomy_Page">
					<div class="navcon">
						<img src="resources/img/profile_icon.png" alt="프로필">
						<div class="menu_bt">
							<span>마이페이지</span>
						</div>
					</div>
				</a>
				<a href="userLogout">
					<div class="navcon">
						<img src="resources/img/logout_icon.png" alt="로그아웃">
						<div class="menu_bt">
							<span>로그아웃</span>
						</div>
					</div>
				</a>
			</c:if>

			<div class="logo_pc">
				<img src="resources/img/r_logo.png" alt="logo">
			</div>
		</div>
</body>

</html>