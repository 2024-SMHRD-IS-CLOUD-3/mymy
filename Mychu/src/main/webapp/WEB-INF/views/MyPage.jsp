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
          <button type="button" class="btn btn-custom btn-sm">티켓 만들기</button>
          <a href="userLogout"> <button type="button" class="btn btn-custom btn-sm">로그아웃</button></a>
        </div>
      </div>
    </div>

    <div class="right1">
      <h4 class="myticket">My Ticket</h4>
      <!-- 티켓1 -->
      <div class="flip-container">
        <div class="flipper">
          <div class="front"></div>
          <div class="back">
            <span class="e6_004">영화 제목</span><br>
            <span class="e6_005">날짜: </span><br>
            <span class="e6_006">댓글: </span><br>
            <span class="e6_007">평점</span>
            <span class="e6_008">★★★★★</span>
          </div>
        </div>
      </div>

      <!-- 티켓2 -->
      <div class="flip-container2">
        <div class="flipper2">
          <div class="front2"></div>
          <div class="back2">
            <span class="e6_004">영화 제목</span><br>
            <span class="e6_005">날짜: </span><br>
            <span class="e6_006">댓글: </span><br>
            <span class="e6_007">평점</span>
            <span class="e6_008">★★★★★</span>
          </div>
        </div>
      </div>

      <!-- 티켓3 -->
      <div class="flip-container3">
        <div class="flipper3">
          <div class="front3"></div>
          <div class="back3">
            <span class="e6_004">영화 제목</span><br>
            <span class="e6_005">날짜: </span><br>
            <span class="e6_006">댓글: </span><br>
            <span class="e6_007">평점</span>
            <span class="e6_008">★★★★★</span>
          </div>
        </div>
      </div>





      <div class="foot">
        <ul class="post-list">
          <li class="post-item">
            <h5>영화 제목: 영화 1</h5>
            <div class="post-content">이 영화는 정말 감동적이었습니다. 추천합니다!</div>
            <div class="post-author">작성자: 사용자1</div>
            <div class="comments">댓글: 정말 좋은 리뷰네요!</div>
          </li>
          <li class="post-item">
            <h5>영화 제목: 영화 2</h5>
            <div class="post-content">스토리가 복잡해서 이해하기 어려웠습니다.</div>
            <div class="post-author">작성자: 사용자2</div>
            <div class="comments">댓글: 저도 비슷하게 느꼈어요.</div>
          </li>
          <li class="post-item">
            <h5>영화 제목: 영화 3</h5>
            <div class="post-content">배우들의 연기가 인상적이었어요.</div>
            <div class="post-author">작성자: 사용자3</div>
            <div class="comments">댓글: 저도 그 부분이 인상적이었어요.</div>
          </li>
          <li class="post-item">
            <h5>영화 제목: 영화 4</h5>
            <div class="post-content">사운드트랙이 훌륭했습니다.</div>
            <div class="post-author">작성자: 사용자4</div>
            <div class="comments">댓글: OST가 정말 좋았죠.</div>
          </li>
        </ul>
      </div>
    </div>
  </div>

  <!-- 부트스트랩 -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>

</html>
