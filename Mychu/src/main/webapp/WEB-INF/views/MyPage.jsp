<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Movie Post</title>
  <meta name="description" content="Movie Post">
  <meta name="author" content="Movie Post Creator">
  <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="resources/css/mypage.css">

 
</head>

<body>
  <!-- 네브바 -->
  <nav class="navbar navbar-light bg-light">
    <div class="container">
      <a class="navbar-brand" href="goMain">
        <img src="resources/img/logo.png" alt="Bootstrap" width="400px" height="120px">
      </a>
    </div>
  </nav>

  <div class="container">
    <div class="head1">
      <div class="photobox">
       <img alt="프로필" src="resources/profile/${not empty loginInfo.profile ? loginInfo.profile : 'ellipse_2.png'}" class="e6_835">
        <h4>${loginInfo.userName}</h4>
        <c:forEach items="${userGenres}" var="userGenres" varStatus="i" >
               <c:if test="${loginInfo.userIdx eq userGenres.user.userIdx}">
           <span>#${userGenres.genre.genreName}</span>
        </c:if>
        </c:forEach>
        <br>
        <br>
        <div class="button-grid">
          <button type="button" class="btn btn-custom btn-sm">프로필 수정</button>
        <a href="goWrite">  <button type="button" class="btn btn-custom btn-sm"> 게시글 작성</button></a>
          <a href="goSaveTicket"><button type="button" class="btn btn-custom btn-sm">티켓 만들기</button></a>
          <a href="userLogout"> <button type="button" class="btn btn-custom btn-sm">로그아웃</button></a>
        </div>
      </div>
    </div>

    <div class="right1">
      <h4 class="myticket">My Ticket</h4>
      <!-- 티켓1 -->
       <c:set var="displayIndex" value="0" />
       <c:forEach items="${tickets}" var="ticket" varStatus="i">
       
    <c:if test="${loginInfo.userIdx eq ticket.userIdx.userIdx}">
    
        <div class="flip-container${displayIndex}">
            <div class="flipper${displayIndex}">
                <div class="front${displayIndex}" style="background-image: url('<c:url value="${ticket.movieIdx.moviePosterUrl}"/>');"></div>
                <div class="back${displayIndex}" style="background-image: url('<c:url value="/resources/img/back1.png"/>');">
                    <span class="e6_004">영화 제목</span><br>
                    <span class="e6_005">날짜: </span><br>
                    <span class="e6_006">댓글: </span><br>
                    <span class="e6_007">평점</span>
                    <span class="e6_008">★★★★★</span>
                </div>
            </div>
        </div>
        <c:set var="displayIndex" value="${displayIndex + 1}" />
        
    </c:if>
</c:forEach>


      <div class="foot">
        <ul class="post-list">
        
        <c:forEach items="${posts}" var="post" varStatus="i">
        <c:if test="${loginInfo.userIdx eq post.userIdx.userIdx}">
          <li class="post-item">
            <h5>${post.movieIdx.movieTitleKr}</h5>
            <div class="post-content">${post.postContent}</div>
            <div class="post-author">${post.userIdx.userName}</div>
            <div class="comments">댓글: 정말 좋은 리뷰네요!</div>
            <a href="postEdit"><span>수정</span></a> <a href="postDelete?id=${post.postIdx}"><span>삭제</span></a>
          </li>
        </c:if>
        </c:forEach>
          
          
        </ul>
      </div>
    </div>
  </div>

  <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    
    

</body>

</html>
