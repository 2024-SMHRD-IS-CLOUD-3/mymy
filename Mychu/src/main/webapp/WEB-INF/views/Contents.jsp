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
$(document).ready(function() {
	$("#go_top").click(function() {
		$("html, body").animate({
			scrollTop : 0
		}, "slow");
		return false;
	});
});
</script>
</head>

<body>
	<div id="home_wrap">
		<div>
			<a href="#" id="go_top"> <img src="resources/img/top_icon.png"
				alt="top icon">
			</a>
		</div>

		<!-- 모바일용 헤더 -->
		<header>
			<div class="logo_m">
				<a href="goMain"><img src="resources/img/logo.gif"></a>
			</div>
		</header>

		<div id="home">
			<div id="search_box">
            <form action="goContents" method="get">
                <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" value="${param.keyword}" autocomplete="off" />
                <button type="submit">검색</button>
            </form>
            <ul id="autocomplete-list" style="border: 1px solid #ccc; display: none; position: absolute; background-color: white; z-index: 1000;">
                <!-- 자동완성 결과가 여기에 추가됩니다 -->
            </ul>
        </div>
			<div class="con_wrap">
				<!-- 인기영화 -->
				<h1>인기영화</h1>
				<div class="con top_movies">
					<c:forEach items="${moviesList}" var="movie">
						<div class="movie">
							<img src="${movie.moviePosterUrl}" alt="이미지"></img>
							<div class="m_info">
								<h4>${movie.movieTitleKr}</h4>
								<p class="opened-at">
									개봉일 :
									<fmt:formatDate value="${movie.openedAt}" pattern="yyyy-MM-dd" />
								</p>
							</div>
						</div>
					</c:forEach>
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
	 <script>
    $(document).ready(function() {
        var selectedIndex = -1;

        // 자동완성 항목 탐색
        $("#keyword").on("input", function() {
            var keyword = $(this).val();
            selectedIndex = -1;
            if (keyword.length > 0) {
                $.ajax({
                    url: "autocomplete",
                    method: "GET",
                    data: { keyword: keyword },
                    success: function(data) {
                        var list = $("#autocomplete-list");
                        list.empty();
                        if (data.length > 0) {
                            list.show();
                            $.each(data, function(index, value) {
                                list.append("<li class='autocomplete-item'>" + value + "</li>");
                            });
                        } else {
                            list.hide();
                        }
                    }
                });
            } else {
                $("#autocomplete-list").hide();
            }
        });

        // 키보드 이벤트 처리
        $("#keyword").on("keydown", function(e) {
            var listItems = $("#autocomplete-list li");
            if (listItems.length > 0) {
                if (e.key === "ArrowDown") {
                    selectedIndex = (selectedIndex + 1) % listItems.length;
                    listItems.removeClass("selected");
                    $(listItems[selectedIndex]).addClass("selected");
                    scrollToView(listItems[selectedIndex]);
                } else if (e.key === "ArrowUp") {
                    selectedIndex = (selectedIndex - 1 + listItems.length) % listItems.length;
                    listItems.removeClass("selected");
                    $(listItems[selectedIndex]).addClass("selected");
                    scrollToView(listItems[selectedIndex]);
                } else if (e.key === "Enter") {
                    e.preventDefault();
                    if (selectedIndex >= 0) {
                        $("#keyword").val($(listItems[selectedIndex]).text());
                        $("#autocomplete-list").hide();
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
                parent.scrollTop(parent.scrollTop() + elementTop - parentHeight + $(element).outerHeight());
            } else if (elementTop < 0) {
                parent.scrollTop(parent.scrollTop() + elementTop);
            }
        }

        // 자동완성 항목 클릭 시
        $(document).on("click", ".autocomplete-item", function() {
            $("#keyword").val($(this).text());
            $("#autocomplete-list").hide();
        });

        // 클릭 외 영역 클릭 시 자동완성 리스트 닫기
        $(document).click(function(e) {
            if (!$(e.target).closest('#search_box').length) {
                $("#autocomplete-list").hide();
            }
        });
    });
</script>
</body>

</html>