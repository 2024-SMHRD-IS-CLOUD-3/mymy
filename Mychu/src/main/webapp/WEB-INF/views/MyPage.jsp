<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Movie Post</title>
  <meta name="description" content="Movie Post">
  <meta name="author" content="Movie Post Creator">
  <link rel="stylesheet" href="resources/css/font.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link rel="stylesheet" href="resources/css/mypage.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
 
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
        <img alt="프로필" src="resources/profile/${not empty loginInfo.profile ? loginInfo.profile : 'ellipse_2.jpeg'}" class="e6_835"></input>
        <h4>${loginInfo.userName}</h4>
        <c:forEach items="${userGenres}" var="userGenres" varStatus="i" >
               <c:if test="${loginInfo.userIdx eq userGenres.user.userIdx}">
           <span>#${userGenres.genre.genreName}</span>
        </c:if>
        </c:forEach>
        <br>
        <br>
        <div class="button-grid">
        <form action="profileEdit" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="userId" value="${loginInfo.userId}">
         	<button type="button" class="btn btn-custom btn-sm" onclick="document.getElementById('fileInput').click();">
  					사진 변경
			</button>
			<input type="file" id="fileInput" style="display:none;" name="file" onchange="this.form.submit()">
			</form>
        <a href="goWrite">  <button type="button" class="btn btn-custom btn-sm"> 게시글 작성</button></a>
          <a href="goSaveTicket"><button type="button" class="btn btn-custom btn-sm">티켓 만들기</button></a>
          <a href="userLogout"> <button type="button" class="btn btn-custom btn-sm">로그아웃</button></a>
          <a href="userDelete?idx=${loginInfo.userIdx}" onclick="showToast()"> <button type="button" class="btn btn-custom btn-sm">회원탈퇴</button></a>
        </div>
      </div>
    </div>

    <div class="right1">
      <h4 class="myticket">My Ticket</h4>
      <!-- 티켓1 -->
       <c:set var="displayIndex" value="0" />
    <div class="flip-container-wrapper">
       <c:forEach items="${tickets}" var="ticket" varStatus="i">
       
    <c:if test="${loginInfo.userIdx eq ticket.userIdx.userIdx}">
        <div class="flip-container">
            <div class="flipper">
                <div class="front" style="background-image: url('<c:url value="${ticket.movieIdx.moviePosterUrl}"/>');"></div>
                <div class="back" style="background-image: url('<c:url value="/resources/ticket/final_image_${ticket.movieIdx.movieIdx}.png"/>');">
                    <span class="e6_004">${ticket.movieIdx.movieTitleKr}</span><br>
                    <span class="e6_005">날짜: <fmt:formatDate value="${ticket.createdAt}"
										pattern="yyyy-MM-dd" /> </span><br>
                    <span class="e6_006">${ticket.memo}</span><br>
                </div>
            </div>
         <form action="ticketDelete">
         <input type="hidden" name="ticketIdx" value="${ticket.ticketIdx}">
        <button class="delete" type="submit">삭제</button>
        </form>
        </div>
        <c:set var="displayIndex" value="${displayIndex + 1}" />
        
    </c:if>
</c:forEach>
        </div>

<hr>
        <h4 class="mypost">My Post</h4>
      <div class="foot">
        <ul class="post-list">
        <c:forEach items="${posts}" var="post" varStatus="i">
        <c:if test="${loginInfo.userIdx eq post.userIdx.userIdx}">
          <li class="post-item">
            <h5>${post.movieIdx.movieTitleKr}</h5>
            <div class="post-content">${post.postContent}</div>
            <div class="post-author">${post.userIdx.userName}</div>
            <br>
           
           
            <a href="postEdit?idx=${post.postIdx}" class="delete"><span>수정</span></a> <a href="postDelete?id=${post.postIdx}" class="delete"><span>삭제</span></a>
            <a href="postDetail?idx=${post.postIdx}" class="delete"><span>상세보기</span></a> 
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
    <script>

    const Toast = Swal.mixin({
 	    toast: true,
 	    position: 'center',
 	    showConfirmButton: false,
 	    timer: 3000,
 	    timerProgressBar: true,
 	    didOpen: (toast) => {
 	        toast.addEventListener('mouseenter', Swal.stopTimer)
 	        toast.addEventListener('mouseleave', Swal.resumeTimer)
 	    }
 	});

 	function showToast() {
 	    Toast.fire({
 	        icon: 'info',
 	        title: '회원 탈퇴 완료.'
 	    });
 	}
    </script>
    

</body>

</html>
