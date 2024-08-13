<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 작성</title>
<link rel="stylesheet" href="resources/css/font.css">
<link rel="stylesheet" href="resources/css/default.css">
<link rel="stylesheet" href="resources/css/postwrite.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

	<div id="home_wrap">

		<!-- 모바일용 헤더 -->
		<header>
			<div class="logo_m">
				<a href="goMain"><img src="resources/img/logo.png"></a>
			</div>
		</header>

		<div id="home">
			<div class="con_wrap">
				<div class="board">
					<div class="container">
						<div class="m_poster"></div>

						<div class="m_info">
							<!-- enctype="multipart/form/data" -> 어떤 데이터들을 어떻게 보낼건지 경로 + 실체 -->

							<div id="search_box">
								<form action="goContents" method="get">
									<input type="text" name="keyword" id="keyword"
										placeholder="검색어를 입력하세요" value="${param.keyword}"
										autocomplete="off" />
									<button type="button">검색</button>
								</form>
								<ul id="autocomplete-list"
									style="border: 1px solid #ccc; display: none; position: absolute; background-color: white; z-index: 1000;">
									<!-- 자동완성 결과가 여기에 추가됩니다 -->
								</ul>
							</div>

							<form action="BoardWrite" method="post"
								enctype="multipart/form-data">

								<div class="m_info_data">검색창</div>

								<div class="m_info_data">영화제목</div>

								<textarea rows="10" style="resize: none;" name="content"
									placeholder="작성할 내용을 입력하세요"></textarea>

								<input type="file" name="file" style="float: right;"> <input
									type="submit" value="등록하기"> <input type="reset"
									value="초기화">
							</form>
						</div>
					</div>
					<!-- container 끝 -->
				</div>
				<!-- board 끝 -->
			</div>
			<!-- con_wrap 끝 -->
		</div>
		<!-- home 끝 -->

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
	</div>

	<script>
		$(document)
				.ready(
						function() {
							var selectedIndex = -1;

							// 자동완성 항목 탐색
							$("#keyword")
									.on(
											"input",
											function() {
												var keyword = $(this).val();
												selectedIndex = -1;
												if (keyword.length > 0) {
													$
															.ajax({
																url : "autocomplete",
																method : "GET",
																data : {
																	keyword : keyword
																},
																success : function(
																		data) {
																	var list = $("#autocomplete-list");
																	list
																			.empty();
																	if (data.length > 0) {
																		list
																				.show();
																		$
																				.each(
																						data,
																						function(
																								index,
																								value) {
																							list
																									.append("<li class='autocomplete-item'>"
																											+ value
																											+ "</li>");
																						});
																	} else {
																		list
																				.hide();
																	}
																}
															});
												} else {
													$("#autocomplete-list")
															.hide();
												}
											});

							// 키보드 이벤트 처리
							$("#keyword")
									.on(
											"keydown",
											function(e) {
												var listItems = $("#autocomplete-list li");
												if (listItems.length > 0) {
													if (e.key === "ArrowDown") {
														selectedIndex = (selectedIndex + 1)
																% listItems.length;
														listItems
																.removeClass("selected");
														$(
																listItems[selectedIndex])
																.addClass(
																		"selected");
														scrollToView(listItems[selectedIndex]);
													} else if (e.key === "ArrowUp") {
														selectedIndex = (selectedIndex - 1 + listItems.length)
																% listItems.length;
														listItems
																.removeClass("selected");
														$(
																listItems[selectedIndex])
																.addClass(
																		"selected");
														scrollToView(listItems[selectedIndex]);
													} else if (e.key === "Enter") {
														e.preventDefault();
														if (selectedIndex >= 0) {
															$("#keyword")
																	.val(
																			$(
																					listItems[selectedIndex])
																					.text());
															$(
																	"#autocomplete-list")
																	.hide();
														}
													}
												}
											});

							// 선택된 항목을 보기로 스크롤
							function scrollToView(element) {
								var parent = $(element).parent();
								var elementTop = $(element).position().top;
								var parentHeight = parent.height();

								if (elementTop + $(element).outerHeight() > parentHeight) {
									parent.scrollTop(parent.scrollTop()
											+ elementTop - parentHeight
											+ $(element).outerHeight());
								} else if (elementTop < 0) {
									parent.scrollTop(parent.scrollTop()
											+ elementTop);
								}
							}

							// 자동완성 항목 클릭 시
							$(document).on("click", ".autocomplete-item",
									function() {
										$("#keyword").val($(this).text());
										$("#autocomplete-list").hide();
									});

							// 클릭 외 영역 클릭 시 자동완성 리스트 닫기
							$(document)
									.click(
											function(e) {
												if (!$(e.target).closest(
														'#search_box').length) {
													$("#autocomplete-list")
															.hide();
												}
											});
						});
	</script>
</body>

</html>