<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 상세페이지</title>
    <link rel="stylesheet" href="resources/css/font.css">
    <link rel="stylesheet" href="resources/css/default.css">
    <link rel="stylesheet" href="resources/css/PostDetail.css">
</head>

<body>
    <div id="home_wrap">
        <div>
            <a href="#" id="go_top"> <img src="resources/img/top_icon.png" alt="top icon"></a>
        </div>

       <div id="home">
        <div class="con_wrap">
	    <div class="board">
	        <!-- 게시글 내용 -->
	        <div class="post-container">
	            <div class="image-section">
	                <img class="poster-image" src="${post.movieIdx.moviePosterUrl}" alt="이미지" />
	            	<a href="goMain"><button type="button" class="back-button">뒤로가기</button></a>
	            </div>
	            
	            <div class="details-section">
	                <h1>${board.title}</h1>
	                <p class="author">작성자 : ${post.userIdx.userName}</p>
	                <p class="post-content">${post.postContent}</p>
	                <button class="ott_tag"># ${post.postOtt}</button>
	
	                <!-- 댓글 작성 -->
	                <form action="commentWrite" method="post" class="comment-form">
	                    <input type="hidden" name="userIdx" value="${loginInfo.userIdx}">
	                    <input type="hidden" name="postIdx" value="${post.postIdx}">
	                    <div class="comment-form-content">
	                        <span class="comment-author">${loginInfo.userName}</span>
	                        <textarea rows="4" name="cmtContent" placeholder="댓글을 작성하세요"></textarea>
	                        <button type="submit">등록</button>
	                    </div>
	                </form>
	
	                <!-- 댓글창 -->
	                <div id="comment_box" class="comment-box">
	                    <c:forEach items="${comment}" var="comment">
	                        <c:if test="${post.postIdx eq comment.postIdx.postIdx}">
	                            <div class="comment-item">
	                                <div class="comment-user-info">
	                                    <span class="comment-user">${comment.userIdx.userName}</span>
	                                    <p class="comment-content">${comment.cmtContent}</p>
	                                    <span class="comment-date">
	                                    <fmt:formatDate value="${comment.createdAt}"
                             					pattern="yyyy-MM-dd HH:mm:ss" />
                        				</span>
                      
	                                </div>
	                                <c:if test="${loginInfo.userIdx eq comment.userIdx.userIdx}">
	                                    <form action="commentDelete" method="post" class="comment-actions">
	                                        <input type="hidden" name="postIdx" value="${post.postIdx}">
	                                        <input type="hidden" name="cmtIdx" value="${comment.cmtIdx}">
	                                        <button type="submit">삭제</button>
	                                    </form>
	                                </c:if>
	                            </div>
	                        </c:if>
	                    </c:forEach>
	                </div> <!-- 댓글창 끝 -->
	            </div>
	        </div>
	        </div>
	    </div> <!-- board 끝 -->
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
                        <img src="resources/img/bookmark_icon.png" alt="영화 검색">
                        <div class="menu_bt">
                            <span>영화 검색</span>
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
                    <div class="navcon"><img src="resources/img/search_icon.png" alt="영화 검색">
                        <div class="menu_bt"><span>영화 검색</span></div>
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

             <div class="logo_pc"><img src="resources/img/r_logo.png"></div>
        </div>
    </div>

    <script>
        function goBack() {
            window.history.back();
        }
    </script>
</body>

</html>