<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홈</title>
    <style>
        @font-face {
            font-family: 'SUITE-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
            font-weight: 900;
            font-style: normal;
        }

        * {
            margin: 0;
            padding: 0;
        }

        li {
            list-style:none;
        }

        #home_m_wrap{
            display: none;
        }

        body {
            width: 100%;
            height: 100%;
            background-color: hwb(0 95% 5%);
            /* background-image: url(https://images.unsplash.com/photo-1708939658226-674b9834fa88?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D); */
            background-size: cover;
            font-family: 'SUITE-Regular';
        }

        .top_bt {
            position: fixed;
            right: 20px;
            bottom: 70px;
            width: 24px;
            height: 24px;
        }

        #home_pc_wrap {
            position: absolute;
            width: 100%;
            box-sizing: border-box;
            margin: auto;
            font-family: 'SUITE-Regular';
        }

        #go_top {
            position: fixed;
            bottom: 20px;
            right: 20px;
        }

        #nav_box {
            width: 20%;
            height: 100vh; /* li-hi 80px */
            float:left;
            position: sticky;
            border-right: 0.5px solid hwb(0 89% 11% / 0.973);
            box-sizing: border-box;
        }

        #nav_box .navcon {
            width:100%;
            /* height: 25px; */
            padding: 25px 0px;
            list-style: none;
            display: inline-flex;
            border-bottom: 0.5px solid hwb(0 89% 11% / 0.973);
        }

        #nav_box .navcon img {
            width: 25px;
            height: 25px;
            margin: 0px 13px 0px 20px;
        }

        #nav_box .navcon .menu_bt {
            display: inline-flex;
            margin-top: 2px;
            box-sizing: border-box;
            font-size: 17px;
        }

        #nav_box .navcon:hover {
            /* background-color: hsl(0, 0%, 93%); */
            box-shadow: 0px 5px 5px hsla(218, 86%, 50%, 0.103);
        }

        #nav_box .logo {
            width: 100%;
            position: sticky;
            top: 100%;
        }

        #nav_box .logo > img {
            width: 170px;
            height: 440px;
            margin: 0px 0px 10px 6px;
        }

        #home_pc {
            float: right;
            width: 80%;
            padding: 30px;
            box-sizing: border-box;
            background-color: #ffffffde;
            box-shadow: 10px 10px 10px hsla(212, 100%, 89%, 0.541);
            font-family: 'SUITE-Regular';
        }

        /* pc 끝 pc 끝 pc 끝 pc 끝 pc 끝 pc 끝 pc 끝 pc 끝 pc 끝 pc 끝 pc 끝 */

        /*
            여기부터 반응형 반응형 반응형 반응형 반응형 반응형 반응형 반응형 반응형
            여기부터 반응형 반응형 반응형 반응형 반응형 반응형 반응형 반응형 반응형
            여기부터 반응형 반응형 반응형 반응형 반응형 반응형 반응형 반응형 반응형
        */

        #home_m_wrap {
            position: relative;
            width: 100%;
            background-color: hwb(0 95% 5%);
            font-family: 'SUITE-Regular';
        }

        #home_m_wrap .top_bt {
            bottom: 90px;
        }

        #header_m {
            width: 100%;
            height: 160px;
            position: sticky;
            top: 0;
            background-color: hsl(0, 0%, 97%);
            border-bottom: 0.5px solid hwb(0 89% 11% / 0.973);
        }

        .logo_m {
            margin: auto;
            width: 400px;
            height: 90%;
        }
        
        .logo_m > img {
            width: 100%;
            height: 100%;
            margin-top: 8px;
        }

        #home_m {
            width: 100%;
            background-color: #ffffffde;
            box-sizing: border-box;
        }

        .con_wrap_m {
            width: 100%;
            padding: 4%;
            margin: auto;
            box-sizing: border-box;
        }

        /* 모바일 footer 고정 */
        #nav_box_m {
            width: 100%;
            height: 52px;
            position: sticky;
            display: flex;
            bottom: 0;
            background-color: hsl(0, 0%, 97%);
        }

        #nav_box_m .navcon_m {
            width: 50%;
            height: 100%;
            border-top: 0.1px solid rgb(227, 227, 227);
            text-align: center;
        }

        .menu2_m {
            border-left: 0.1px solid rgb(227, 227, 227);
            border-right: 0.1px solid rgb(227, 227, 227);
        }

        #nav_box_m .navcon_m img {
            margin-top: 13px;
        }

        #nav_box_m .navcon_m:hover {
            background-color: hsl(0, 0%, 93%);
        }

        #nav_box_m .navcon_m:hover img {
            width: 25px;
            height: 25px;
        }

        /* 스타일 마감 바로 위에 적어줌 */
        @media screen and (max-width:1200px) {
            #home_pc_wrap {
                display: none;
            }

            #home_m_wrap {
                display: block;
            }
        }

        @media screen and (max-width:600px) {
            #home_pc_wrap {
                display: none;
            }

            #home_m_wrap {
                display: block;
            }
        }
    </style>
</head>

<!-- top 버튼

<script>
    $(document).ready(function() {
        $(window).scroll(function() {
            if ($(this).scrollTop() > 0) {
            $('#go_top').fadeIn();
            } else {
            $('#go_top').fadeOut();
            }
            });
        $('.top_bt').click(function() {
            $('html, body').animate({
                scrollTop: 0
            }, 400);
            return false;
        });
    });
</script>

 -->

<body>
    <div id="home_pc_wrap">
        <div id="go_top" class="top_bt"><img src="resources/img/top_icon.png"></div>
        <div id="nav_box">
            <div class="navcon menu1"><img src="resources/img/home_icon.png"><div class="menu_bt"> <a href="/boot">홈</a></div></div>
            <div class="navcon menu2"><img src="resources/img/bookmark_icon.png"><div class="menu_bt">나만의 컨텐츠</div></div>
            <div class="navcon menu3"><img src="resources/img/profile_icon.png"><div class="menu_bt"><a href="goLogin">로그인 / 회원가입</a></div></div>
            <div class="logo"><img src="resources/img/r_logo.gif"></div>
        </div>
        <div id="home_pc">
            <div class="con_wrap_pc">
                어또ㅓㅎ게채우지
            </div>
        </div>
    </div> <!-- pc용 home_pc_wrap 끝 -->

    <!-- m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 m용 시작 -->
    <div id="home_m_wrap">
        <div id="go_top" class="top_bt"><img src="resources/img/top_icon.png"></div>
        <!-- 헤더 고정 -->
        <header id="header_m"><div class="logo_m"><img src="resources/img/logo.gif"></div></header>
        <div id="home_m">
            <div class="con_wrap_m">
                어쩌구저쩌구
            </div>
        </div>
        <!-- 네비 고정 -->
        <div id="nav_box_m">
            <div class="navcon_m menu1_m"> <a href="/boot"><img src="resources/img/home_icon.png"> </a></div>
            <div class="navcon_m menu2_m"><img src="resources/img/bookmark_icon.png"></div>
          <div class="navcon_m menu3_m">   <a href="goLogin"><img src="resources/img/profile_icon.png"> </a></div> 
        </div>
    </div> <!-- 반응형 home_m_wrap 끝 -->
</body>
</html>
