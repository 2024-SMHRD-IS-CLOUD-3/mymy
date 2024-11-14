<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 수정</title>
<link rel="stylesheet" href="resources/css/font.css">
<link rel="stylesheet" href="resources/css/default.css">
<link rel="stylesheet" href="resources/css/postedit.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
</head>

<body>
   <div id="home_wrap">

      <div id="home">
                     
         <div class="con_wrap">
              
               <div class="container">
               
               <!-- 검색창 -->
               <div id="search_box">
             	 <div  class="search_con">
					<input type="text" name="keyword" id="keyword" placeholder="수정은 영화변경이 불가능합니다."readonly onclick="showToast()" />                
                 <ul id="autocomplete-list" style="border: 1px solid #ccc; display: none; position: absolute; background-color: white; z-index: 1000;">
                 <!-- 자동완성 결과가 여기에 추가됩니다 -->
                 </ul>
                </div>
              </div>
              
                  <form action="postUpdate" method="post" enctype="multipart/form-data" id="post_box">
                     
                  <div class="m_poster" style="background-image:url('${post.movieIdx.moviePosterUrl}')"></div> <!-- 영화 포스터가 표시될 곳 -->

                  <div class="m_info">
                     <!-- enctype="multipart/form/data" -> 어떤 데이터들을 어떻게 보낼건지 경로 + 실체 -->
        			
                  <input type="hidden" name="userId" value="${loginInfo.userId}">
                   <input type="hidden" name="postIdx" value="${post.postIdx}" />
                  <!-- 영화 ID를 숨겨서 전송 (추가된 부분) -->
                        <div class="m_info_data" id="movie_T">
                        </div>
                 	
                  
                        <input type="hidden" name="movieTitleKr" id="movieIdxHidden">
                        
                        <textarea rows="5" style="resize: none;" name="postContent"
                           placeholder="작성할 내용을 입력하세요">${post.postContent}</textarea>

                    
                    
                    
                    
                      <div class="ott_box">
    <label for="ott_1" class="radio_button">넷플릭스
        <input type='radio' id="ott_1" name='postOtt' value='넷플릭스'
            <c:if test="${post.postOtt eq '넷플릭스'}">checked</c:if>
        />
        <span class="custom_radio"></span>
    </label>

    <label for="ott_2" class="radio_button">티빙
        <input type='radio' id="ott_2" name='postOtt' value='티빙'
            <c:if test="${post.postOtt eq '티빙'}">checked</c:if>
        />
        <span class="custom_radio"></span>
    </label>

    <label for="ott_3" class="radio_button">쿠팡플레이
        <input type='radio' id="ott_3" name='postOtt' value='쿠팡플레이'
            <c:if test="${post.postOtt eq '쿠팡플레이'}">checked</c:if>
        />
        <span class="custom_radio"></span>
    </label>

    <label for="ott_4" class="radio_button">웨이브
        <input type='radio' id="ott_4" name='postOtt' value='웨이브'
            <c:if test="${post.postOtt eq '웨이브'}">checked</c:if>
        />
        <span class="custom_radio"></span>
    </label>

    <label for="ott_5" class="radio_button">왓챠
        <input type='radio' id="ott_5" name='postOtt' value='왓챠'
            <c:if test="${post.postOtt eq '왓챠'}">checked</c:if>
        />
        <span class="custom_radio"></span>
    </label>

    <label for="ott_6" class="radio_button">디즈니+
        <input type='radio' id="ott_6" name='postOtt' value='디즈니+'
            <c:if test="${post.postOtt eq '디즈니+'}">checked</c:if>
        />
        <span class="custom_radio"></span>
    </label>
</div>
                        <br>
                        <input type="submit" value="수정하기" class="btn">
                        <input type="reset" value="초기화" class="btn">
                     </div>
                     </form>
                  </div>
               </div>
         </div>
      </div>
      <!-- home_wrap 끝 -->



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
                        <img src="resources/img/bookmark_icon.png" alt="나만의 컨텐츠">
                        <div class="menu_bt">
                            <span>나만의 컨텐츠</span>
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
                    <div class="navcon"><img src="resources/img/bookmark_icon.png" alt="나만의 컨텐츠">
                        <div class="menu_bt"><span>나만의 컨텐츠</span></div>
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
        
   <script>
   

   const Toast = Swal.mixin({
	    toast: true,
	    position: 'center',
	    showConfirmButton: false,
	    timer: 600,
	    timerProgressBar: false
	});

	function showToast() {
	    Toast.fire({
	        icon: 'info',
	        title: '영화 변경은 불가능합니다.'
	    });
	}


      
      
   </script>

</body>

</html>
