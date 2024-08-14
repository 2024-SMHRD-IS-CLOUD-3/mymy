<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장르선택</title>
    <link rel="stylesheet" href="resources/css/font.css">
	<link rel="stylesheet" href="resources/css/genrechoice.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>

<body>
    <c:if test="${not empty loginInfo}">
         <c:if test="${empty userGenres}">
            <form action="saveGenres" post="method">
               <input type="hidden" name="userId" value="${loginInfo.userId}" >
               <div id="genre_modal">
                  <label class="label_title">선호하는 장르 3가지 선택</label>
                  <div class="genre_box">
                  <!-- input id값 = label for값 연결 -->
                  <c:forEach items="${genres}" var="genre" varStatus="i">
                  <input id="genre_${genre.genreIdx}" type="checkbox"
                  name="genreIds" class="check" value="${genre.genreIdx}">
                  <label for="genre_${genre.genreIdx}"><span>${genre.genreName}</span></label>
               </c:forEach>
            </div>
            <input type="submit" value="선택 완료" class="submit_btn">
         </div>
       </form>
   </c:if>
</c:if>

</body>

</html>