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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    
</head>

<body>
    <c:if test="${not empty loginInfo}">
         <c:if test="${empty userGenres}">
            <form action="saveGenres" post="method">
               <input type="hidden" name="userId" value="${loginInfo.userId}" >
               <div id="genre_modal">
                  <label class="label_title">선호하는 장르 세 개를 선택하세요 </label>
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

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
const Toast = Swal.mixin({
    toast: true,
    position: 'center-center',
    showConfirmButton: false,
    timer: 700,
    timerProgressBar: false
});

$(document).ready(function() {
    // 체크박스 선택을 3개로 제한하는 함수
    $("input[type=checkbox]").on("change", function() {
        var maxAllowed = 3;
        var checkedCount = $("input[type=checkbox]:checked").length;
        
        // 체크된 체크박스가 3개 이상이면
        if (checkedCount > maxAllowed) {
            $(this).prop("checked", false); // 선택을 취소
            Toast.fire({
                icon: 'info',
                title: '세 개만 선택 가능'
            }); // 경고 메시지
        }
    });
});
</script>

</body>

</html>