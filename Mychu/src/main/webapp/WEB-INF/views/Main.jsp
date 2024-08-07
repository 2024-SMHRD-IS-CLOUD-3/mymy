<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈</title>
    <link rel="stylesheet" href="resources/css/basic.css">
    <link rel="stylesheet" href="resources/css/main.css">
</head>

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

    <!-- m용 시작 -->
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
    
    <script>
        // 스크롤 버튼 이벤트 핸들러
        const prevButton = document.getElementById('prev');
        const nextButton = document.getElementById('next');

        if (prevButton) {
            prevButton.addEventListener('click', function() {
                document.querySelector('#genre_box').scrollBy({
                    left: -100, // Adjust the value as needed
                    behavior: 'smooth'
                });
            });
        }

        if (nextButton) {
            nextButton.addEventListener('click', function() {
                document.querySelector('#genre_box').scrollBy({
                    left: 100, // Adjust the value as needed
                    behavior: 'smooth'
                });
            });
        }

        // 게시글 추가 이벤트 핸들러
        document.getElementById('boardappend').addEventListener('click', function() {
            // 게시글 내용 가져오기
            const content = document.getElementById('post-content').value;
            const author = "${userName}"; // 임시 사용자 아이디
            const date = new Date().toISOString().split('T')[0]; // 현재 날짜

            // 선택된 장르 가져오기
            const selectedGenres = [];
            document.querySelectorAll('#genre_box .check[type="checkbox"]:checked').forEach(checkbox => {
                selectedGenres.push(checkbox.value);
            });

            // 새로운 게시글 요소 생성
            const post = document.createElement('div');
            post.className = 'post';

            // 게시글 헤더 추가
            const postHeader = document.createElement('div');
            postHeader.className = 'post-header';

            const postAuthor = document.createElement('div');
            postAuthor.className = 'author';
            postAuthor.textContent = author;

            const postDate = document.createElement('div');
            postDate.className = 'date';
            postDate.textContent = date;

            postHeader.appendChild(postAuthor);
            postHeader.appendChild(postDate);
            post.appendChild(postHeader);

            // 게시글 태그 추가
            const postTags = document.createElement('div');
            postTags.className = 'post-tags';
            selectedGenres.forEach(genre => {
                const tag = document.createElement('span');
                tag.textContent = genre;
                postTags.appendChild(tag);
            });
            post.appendChild(postTags);

            // 게시글 내용 추가
            const postContent = document.createElement('div');
            postContent.className = 'post-content';
            postContent.textContent = content;
            post.appendChild(postContent);

            // 게시글 풋터 추가 (좋아요 및 댓글 기능)
            const postFooter = document.createElement('div');
            postFooter.className = 'post-footer';

            const likesContainer = document.createElement('div');
            likesContainer.className = 'likes-container';

            const likeButton = document.createElement('button');
            likeButton.innerHTML = '좋아요 <span>&#9829;</span>';
            likeButton.addEventListener('click', function() {
                let likesCount = this.nextElementSibling;
                likesCount.textContent = parseInt(likesCount.textContent) + 1;
            });

            const likesCount = document.createElement('span');
            likesCount.textContent = '0';

            likesContainer.appendChild(likeButton);
            likesContainer.appendChild(likesCount);

            postFooter.appendChild(likesContainer);

            const commentsContainer = document.createElement('div');
            commentsContainer.className = 'comments';

            const commentForm = document.createElement('div');
            commentForm.className = 'comment-form';

            const commentInput = document.createElement('input');
            commentInput.type = 'text';
            commentInput.placeholder = '댓글을 입력하세요';

            const commentButton = document.createElement('button');
            commentButton.textContent = '등록';
            commentButton.addEventListener('click', function() {
                const commentText = commentInput.value;
                const commentAuthor = '댓글 작성자'; // 임시 댓글 작성자
                const commentDate = new Date().toISOString().split('T')[0]; // 현재 날짜
                const commentProfileImg = 'path/to/profile.jpg'; // 임시 프로필 이미지 경로

                if (commentText) {
                    const comment = document.createElement('div');
                    comment.className = 'comment';

                    const commentHeader = document.createElement('div');
                    commentHeader.className = 'comment-header';

                    const commentAuthorElement = document.createElement('div');
                    commentAuthorElement.className = 'comment-author';

                    const commentAuthorImg = document.createElement('img');
                    commentAuthorImg.src = commentProfileImg;

                    const commentAuthorName = document.createElement('span');
                    commentAuthorName.textContent = commentAuthor;

                    const commentDateElement = document.createElement('div');
                    commentDateElement.className = 'comment-date';
                    commentDateElement.textContent = commentDate;

                    commentAuthorElement.appendChild(commentAuthorImg);
                    commentAuthorElement.appendChild(commentAuthorName);
                    commentHeader.appendChild(commentAuthorElement);
                    commentHeader.appendChild(commentDateElement);

                    const commentContent = document.createElement('div');
                    commentContent.className = 'comment-content';
                    commentContent.textContent = commentText;

                    comment.appendChild(commentHeader);
                    comment.appendChild(commentContent);

                    commentsContainer.appendChild(comment);
                    commentInput.value = '';
                }
            });

            commentForm.appendChild(commentInput);
            commentForm.appendChild(commentButton);

            postFooter.appendChild(commentsContainer);
            postFooter.appendChild(commentForm);

            post.appendChild(postFooter);

            // 새로운 게시글을 posts 컨테이너에 추가
            document.getElementById('posts').appendChild(post);

            // 폼 초기화
            document.getElementById('post-content').value = '';
            document.querySelectorAll('#genre_box .check[type="checkbox"]').forEach(checkbox => {
                checkbox.checked = false;
            });
        });

        // 검색 기능 추가
        document.querySelector('.search input').addEventListener('input', function() {
            const query = this.value.toLowerCase();
            const posts = document.querySelectorAll('#posts .post');

            posts.forEach(post => {
                const content = post.querySelector('.post-content').textContent.toLowerCase();
                const tags = Array.from(post.querySelectorAll('.post-tags span')).map(tag => tag.textContent.toLowerCase());

                if (content.includes(query) || tags.some(tag => tag.includes(query))) {
                    post.style.display = '';
                } else {
                    post.style.display = 'none';
                }
            });
        });
    </script>
</body>
</html>