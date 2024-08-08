<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>컨텐츠</title>
<link rel="stylesheet" href="resources/css/font.css">
<link rel="stylesheet" href="resources/css/default.css">
<link rel="stylesheet" href="resources/css/contents.css">
</head>

<body>
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
				<!-- 인기영화 -->
				<h1>인기영화</h1>

				<!-- input id값 = label for값 연결 -->
				<c:if test="${movies.movieIdx eq 2}">

					<div class="con top_movies">
						<div class="movie">
							<img src="${movies.moviePosterUrl}" alt="이미지"></img>
							<div class="m_info">
								<h4>1영화제목 ${movies.movieTitleKr}</h4>
								<p>여기는 1영화정보${moies.OpendAt}</p>
								</c:if>

							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>2영화제목</h4>
								<p>여기는 2영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>3영화제목</h4>
								<p>여기는 3영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>4영화제목</h4>
								<p>여기는 4영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>5영화제목</h4>
								<p>여기는 5영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>6영화제목</h4>
								<p>여기는 6영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>7영화제목</h4>
								<p>여기는 7영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>8영화제목</h4>
								<p>여기는 8영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>9영화제목</h4>
								<p>여기는 9영화정보</p>
							</div>
						</div>

					</div>

					<!-- 팔로우 친구 -->
					<h1>팔로우 친구</h1>

					<div class="con follow_picks">
						<div class="movie">
							<img src="resources/img.jpg" alt="이미지"></img>
							<div class="m_info">
								<h4>영화제목</h4>
								<p>여기는 영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="resources/img.jpg" alt="이미지"></img>
							<div class="m_info">
								<h4>영화제목</h4>
								<p>여기는 영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>영화제목</h4>
								<p>여기는 영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>영화제목</h4>
								<p>여기는 영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>영화제목</h4>
								<p>여기는 영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>영화제목</h4>
								<p>여기는 영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>영화제목</h4>
								<p>여기는 영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>영화제목</h4>
								<p>여기는 영화정보</p>
							</div>
						</div>
						<div class="movie">
							<img src="" alt="이미지"></img>
							<div class="m_info">
								<h4>영화제목</h4>
								<p>여기는 영화정보</p>
							</div>
						</div>
					</div>
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
			</a> <a href="goContent">
				<div class="navcon">
					<img src="resources/img/bookmark_icon.png">
					<div class="menu_bt">
						<span>나만의 컨텐츠</span>
					</div>
				</div>
			</a> <a href="goLogin">
				<div class="navcon">
					<img src="resources/img/edit2_icon.png">
					<div class="menu_bt">
						<span>게시글 작성</span>
					</div>
				</div>
			</a>

			<!-- 로그인 전 -->
			<a href="goLogin">
				<div class="navcon">
					<img src="resources/img/profile_icon.png">
					<div class="menu_bt">
						<span>로그인 / 회원가입</span>
					</div>
				</div>
			</a>

			<!-- 로그인 후 -->
			<a href="gomy_Page">
				<div class="navcon">
					<img src="resources/img/profile_icon.png">
					<div class="menu_bt">
						<span>마이페이지</span>
					</div>
				</div>
			</a> <a href="goMain">
				<div class="navcon">
					<img src="resources/img/logout_icon.png">
					<div class="menu_bt">
						<span>로그아웃</span>
					</div>
				</div>
			</a>

			<div class="logo_pc">
				<img src="resources/img/r_logo.gif">
			</div>
		</div>
	</div>
</body>

</html>