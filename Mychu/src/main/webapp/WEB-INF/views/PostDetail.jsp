<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>글 상세페이지</title>
   <link rel="stylesheet" href="resources/css/font.css">
   <link rel="stylesheet" href="resources/css/default.css">
   <link rel="stylesheet" href="resources/css/글상세페이지.css">
</head>

<body>
   <div id="board">
      <!-- 게시글 내용 -->
      <table id="list" style="background-color: beige;">

         <tr>
            <td>제목</td>
            <td>${board.title}</td>
            <!-- <td>${board.title}</td> -->
         </tr>

         <tr>
            <td>작성자</td>
            <td>${post.userIdx.userId}</td>
            <!-- <td>${board.writer}</td> -->
         </tr>
		<img src="${post.movieIdx.moviePosterUrl}" alt="이미지"/>
         <tr>
            <td class="poster"></td>
            <td class="print">${post.postContent}</td>
         </tr>

         <tr>
            <td colspan="2"><button onclick="goBack()">뒤로가기</button></td>
         </tr>
      </table>
      <!-- 게시글 내용 끝 -->

      <!-- 댓글 작성 -->
      <form action="commentWrite" method="post">
         <table id="comment_write">
         <input type="hidden" name="userIdx" value="${loginInfo.userIdx}">
         <input type="hidden" name="postIdx" value="${post.postIdx}"
         
            <tr>
               <td>${loginInfo.userId}</td>
               <td>
                  <textarea rows="4" style="resize: none;" name="cmtContent"></textarea>
                  <button type="submit" >댓글작성하기</button>
               </td>
            </tr>
         </table>
      </form>
      <!-- 댓글 작성 끝 -->

      <!-- 댓글창 -->
      <div id="comment_box">
         <div class="comment_con">
            <div class="user_section">
               <!-- 댓글 작성자 프로필 -->
               <c:forEach items="${comment}" var="comment">
               <c:if test="${post.postIdx eq comment.postIdx.postIdx}">
               <!--  <img id="pp" src="resources/img/test_img.jpg" alt="댓글 작성자 프로필">
              	--!>
               <!-- 댓글 작성자 정보 -->
               <div class="user_info">
                  <div class="info">${comment.userIdx.userId}</div>
                  <div class="info">${comment.cmtContent}</div>
                  
                  <div class="created_at">${comment.createdAt}</div>
               </div>

               <!-- 댓글 수정, 댓글 삭제 -->
               
               <c:if test="${loginInfo.userIdx eq comment.userIdx.userIdx}">
               <div class="edit_delete">
                  <form action="commentDelete">
                  	<input type="hidden" name="postIdx" value="${post.postIdx}">
                  	<input type="hidden" name="cmtIdx" value="${comment.cmtIdx}">
                  <button type="submit">삭제</button>
                  </form>
               </div>
               </c:if>
               </c:if>
                </c:forEach>
            </div>

            <!-- 댓글 내용 -->
            <div class="content_section">댓글내용</div>
         </div>
      </div>
      <!-- 댓글 끝 -->

   </div>

<script>
function goBack() {
    window.history.back();
}
</script>
</body>

</html>