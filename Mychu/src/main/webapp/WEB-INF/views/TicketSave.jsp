<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 작성</title>
<link rel="stylesheet" href="resources/css/font.css">
<link rel="stylesheet" href="resources/css/default.css">
<link rel="stylesheet" href="resources/css/ticketsave.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

   <div id="home_wrap">

      <!-- 모바일용 헤더 -->
      <header>
         <div class="logo_m">
            <a href="goMain"><img src="resources/img/logo.png"></a>
         </div>
      </header>

      <div id="home">
         <div class="con_wrap">
               <div class="container">
               
                <!-- 검색창 -->
               <div id="search_box">
              <form action="#" method="get"  class="search_con">
                 <input type="text" name="keyword" id="keyword" placeholder="검색할 영화를 입력하세요" value="${param.keyword}" autocomplete="off" />
                 <!-- <button type="button">검색</button> -->
                 <ul id="autocomplete-list" style="border: 1px solid #ccc; display: none; position: absolute; background-color: white; z-index: 1000;">
                 <!-- 자동완성 결과가 여기에 추가됩니다 -->
                 </ul>
                 </form>
              </div>
                     
                     <form action="saveTicket" method="post" enctype="multipart/form-data" id="post_box">
                        
                		  <div class="m_poster"></div> <!-- 영화 포스터가 표시될 곳 -->

                 		 <div class="m_info">
                   		  <!-- enctype="multipart/form/data" -> 어떤 데이터들을 어떻게 보낼건지 경로 + 실체 -->

                     
						<input type="hidden" name="userId" value="${loginInfo.userId}">
						
						<!-- 영화 ID를 숨겨서 전송 (추가된 부분) -->
						
                        <div class="m_info_data"></div>

                        <div class="m_info_data" id="movie_T">
                        
                        </div>
                        
                        <input type="hidden" name="movieTitleKr" id="movieIdxHidden">
                         <div id="search_box">
                        <input type="text" name="memo" id="memo" placeholder="원하는 말을 적어주세요"  autocomplete="off" />
                       </div>
                        <input type="reset" value="초기화" class="btn">
                        <input type="submit" value="등록하기" class="btn">
                     </div>
                     </form>
                  </div>
               </div>
         </div>
      </div>
      <!-- home 끝 -->

      <!-- 고정 메뉴-->
      <div id="nav_box">
         <a href="goMain">
            <div class="navcon">
               <img src="resources/img/home_icon.png" alt="홈">
               <div class="menu_bt">
                  <span>홈</span>
               </div>
            </div>
         </a>

         <c:if test="${empty loginInfo}">
            <!-- 로그인 전 -->
            <a href="goLogin">
               <div class="navcon">
                  <img src="resources/img/bookmark_icon.png" alt="나만의 컨텐츠">
                  <div class="menu_bt">
                     <span>나만의 컨텐츠</span>
                  </div>
               </div>
            </a>

            <a href="goLogin">
               <div class="navcon">
                  <img src="resources/img/edit_icon.png" alt="게시글 작성">
                  <div class="menu_bt">
                     <span>게시글 작성</span>
                  </div>
               </div>
            </a>

            <a href="goLogin">
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
               <div class="navcon">
                  <img src="resources/img/bookmark_icon.png" alt="나만의 컨텐츠">
                  <div class="menu_bt">
                     <span>나만의 컨텐츠</span>
                  </div>
               </div>
            </a>

            <a href="goWrite">
               <div class="navcon">
                  <img src="resources/img/edit_icon.png" alt="게시글 작성">
                  <div class="menu_bt">
                     <span>게시글 작성</span>
                  </div>
               </div>
            </a>
            <a href="gomy_Page">
               <div class="navcon">
                  <img src="resources/img/profile_icon.png" alt="프로필">
                  <div class="menu_bt">
                     <span>마이페이지</span>
                  </div>
               </div>
            </a>
            <a href="userLogout">
               <div class="navcon">
                  <img src="resources/img/logout_icon.png" alt="로그아웃">
                  <div class="menu_bt">
                     <span>로그아웃</span>
                  </div>
               </div>
            </a>
         </c:if>

         <div class="logo_pc">
            <img src="resources/img/r_logo.png" alt="logo">
         </div>
      </div>
   </div>

   <script>
   $(document).ready(function() {
       var selectedIndex = -1; // 선택된 항목의 인덱스 초기값

       // 자동완성 항목 탐색
       $("#keyword").on("input", function() {
           var keyword = $(this).val();
           selectedIndex = -1; // 입력 시 선택된 인덱스 초기화
           if (keyword.length > 0) {
               $.ajax({
                   url: "autocomplete",  // 자동완성 데이터를 가져올 엔드포인트
                   method: "GET",
                   data: { keyword: keyword },
                   success: function(data) {
                       var list = $("#autocomplete-list");
                       list.empty();  // 기존 리스트 초기화
                       if (data.length > 0) {
                           list.show();  // 리스트 표시
                           $.each(data, function(index, value) {
                               list.append("<li class='autocomplete-item'>" + value + "</li>");
                           });
                       } else {
                           list.hide();  // 검색 결과가 없으면 숨기기
                       }
                   }
               });
           } else {
               $("#autocomplete-list").hide(); // 키워드가 없으면 자동완성 목록 숨기기
           }
       });
       
    // 자동완성 항목 클릭 시
       $(document).on("click", ".autocomplete-item", function() {
    var selectedTitle = $(this).text();
    $("#keyword").val(selectedTitle);
    $("#autocomplete-list").hide();

    // 선택된 영화의 포스터 URL을 가져오는 추가 요청
    $.ajax({
        url: "getPosterUrl",  // 포스터 URL을 반환하는 엔드포인트
        method: "GET",
        data: { title: selectedTitle },
        success: function(response) {
            var posterUrl = response.posterUrl;
            console.log("Received Poster URL:", selectedTitle); // 포스터 URL이 제대로 수신되었는지 확인
            if (posterUrl) {
                // 선택된 영화의 포스터를 m_poster의 배경으로 설정
                $(".m_poster").css('background-image', 'url(' + posterUrl + ')');
                $("#movie_T").text(selectedTitle);
                $("#movieIdxHidden").val(selectedTitle);
            } else {
                $(".m_poster").css('background-image', 'none');
                $(".m_poster").html('<p>포스터를 불러올 수 없습니다.</p>');
            }
            
            // 숨겨진 필드에 movieIdx 설정
            $("#movieIdxHidden").val(seletedTitle);
        },
        error: function(xhr, status, error) {
            console.error("Failed to retrieve poster URL: ", status, error);
            $(".m_poster").css('background-image', 'none');
            $(".m_poster").html('<p>포스터를 불러오는 중 오류가 발생했습니다.</p>');
        }
    });
});

       // 키보드 방향키 및 Enter 키 입력 처리
       $("#keyword").on("keydown", function (e) {
           var listItems = $("#autocomplete-list li");

           if (listItems.length > 0) { // 자동완성 항목이 있을 때만 처리
               if (e.key === "ArrowDown") { // 아래 방향키
                   e.preventDefault();
                   selectedIndex = (selectedIndex + 1) % listItems.length; // 리스트 끝에서 처음으로 이동
                   listItems.removeClass("selected");
                   $(listItems[selectedIndex]).addClass("selected");

                   // 선택된 항목이 화면에 보이도록 스크롤 조정
                   listItems[selectedIndex].scrollIntoView({
                       behavior: 'smooth',
                       block: 'nearest'
                   });
               } else if (e.key === "ArrowUp") { // 위 방향키
                   e.preventDefault();
                   selectedIndex = (selectedIndex - 1 + listItems.length) % listItems.length; // 리스트 처음에서 끝으로 이동
                   listItems.removeClass("selected");
                   $(listItems[selectedIndex]).addClass("selected");

                   // 선택된 항목이 화면에 보이도록 스크롤 조정
                   listItems[selectedIndex].scrollIntoView({
                       behavior: 'smooth',
                       block: 'nearest'
                   });
               } else if (e.key === "Enter") { // Enter 키
                   e.preventDefault();
                   if (selectedIndex >= 0) { // 선택된 항목이 있으면
                       $(listItems[selectedIndex]).trigger("click"); // 선택된 항목 클릭 트리거
                   }
               }
           }
       });

       // 자동완성 항목 클릭 시
       $(document).on("click", ".autocomplete-item", function() {
           $("#keyword").val($(this).text());  // 클릭한 항목을 입력창에 설정
           $("#autocomplete-list").hide();  // 자동완성 리스트 숨기기
       });

       // 클릭 외 영역 클릭 시 자동완성 리스트 닫기
       $(document).click(function(e) {
           if (!$(e.target).closest('#search_box').length) {
               $("#autocomplete-list").hide();  // 클릭한 곳이 검색창 외부라면 자동완성 리스트 숨기기
           }
       });
   });
   </script>
</body>

</html>
