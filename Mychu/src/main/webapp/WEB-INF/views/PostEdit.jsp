<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <td>${board.writer}</td>
            <!-- <td>${board.writer}</td> -->
         </tr>

         <tr>
            <td class="poster">포스터</td>
            <td class="print">글 내용</td>
         </tr>

         <tr>
            <td colspan="2"><a href="list"><button>뒤로가기</button></a></td>
         </tr>
      </table>
      <!-- 게시글 내용 끝 -->

      <!-- 댓글 작성 -->
      <form action="" method="post">
         <table id="comment_write">
            <tr>
               <td>대글</td>
               <td>
                  <textarea rows="4" style="resize: none;" name="postContent"></textarea>
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
               <img id="pp" src="resources/img/test_img.jpg" alt="댓글 작성자 프로필">
               <!-- 댓글 작성자 정보 -->
               <div class="user_info">
                  <div class="info">댓글유저닉</div>
                  <div class="created_at">댓글작성일자</div>
               </div>

               <!-- 댓글 수정, 댓글 삭제 -->
               <div class="edit_delete">
                  <a><span>수정</span></a>
                  <span>삭제</span>
               </div>
            </div>

            <!-- 댓글 내용 -->
            <div class="content_section">댓글내용</div>
         </div>
      </div>
      <!-- 댓글 끝 -->

   </div>


</body>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <td>${board.writer}</td>
            <!-- <td>${board.writer}</td> -->
         </tr>

         <tr>
            <td class="poster">포스터</td>
            <td class="print">글 내용</td>
         </tr>

         <tr>
            <td colspan="2"><a href="list"><button>뒤로가기</button></a></td>
         </tr>
      </table>
      <!-- 게시글 내용 끝 -->

      <!-- 댓글 작성 -->
      <form action="" method="post">
         <table id="comment_write">
            <tr>
               <td>대글</td>
               <td>
                  <textarea rows="4" style="resize: none;" name="postContent"></textarea>
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
               <img id="pp" src="resources/img/test_img.jpg" alt="댓글 작성자 프로필">
               <!-- 댓글 작성자 정보 -->
               <div class="user_info">
                  <div class="info">댓글유저닉</div>
                  <div class="created_at">댓글작성일자</div>
               </div>

               <!-- 댓글 수정, 댓글 삭제 -->
               <div class="edit_delete">
                  <a><span>수정</span></a>
                  <span>삭제</span>
               </div>
            </div>

            <!-- 댓글 내용 -->
            <div class="content_section">댓글내용</div>
         </div>
      </div>
      <!-- 댓글 끝 -->

   </div>


</body>

>>>>>>> branch 'master4' of https://github.com/2024-SMHRD-IS-CLOUD-3/mymy.git
</html>