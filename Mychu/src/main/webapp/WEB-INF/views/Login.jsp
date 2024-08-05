<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인, 회원가입 페이지 / 장르 3가지 선택 checkbox</title>
    <style>
        @font-face {
            font-family: 'SUITE-Regular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
            font-style: normal;
        }

        @keyframes logoani{
            from{transform:translate(0xp, 0xp);}
            to{transform:translate(8px, 8px);}
        }

        * { margin: 0; padding: 0;}

        img { -webkit-user-drag: none;
        }

        body {
            width: 100%;
            height: 100vh;
            display: flex;
            background-image: url(https://images.unsplash.com/photo-1708939658226-674b9834fa88?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
            background-size: cover;
        }

        #wrap {
            position: relative;
            width: 600px;
            height: 760px; /* 640px */
            padding: 20px 40px;
            box-sizing: border-box;
            margin: auto;
            background-color: #ffffffde;
            box-shadow: 10px 10px 10px hsla(212, 100%, 89%, 0.541);
            border-radius: 12px;
            font-family: 'SUITE-Regular';
        }

        #back {
            position: absolute;
            margin-top: 202px;
            right: 40px;
            font-size: 22px;
            font-weight: 600;
            cursor: pointer;
        }

        #logo {
            width: 100%;
            height: 25%;
            animation: logoani 0.8s infinite alternate;
        }

        #wrap .tab {
            font-size: 22px;
            font-weight: 600;
            /* padding-top: 18px; -> pointer 영역잡힘 */
            padding-bottom: 5px;
            margin: 18px 25px 20px 0;
            display: inline-table;
            border-bottom: 2px solid transparent;
            cursor: pointer;
            user-select: none;
        }

        #wrap .login_bt:checked + .tab,
        #wrap .join_bt:checked + .tab {
            border-color: #1161ee;
        }

        #wrap .login_bt,
        #wrap .join_bt{
            display: none;
        }

        #form_wrap #login_form .login,
        #form_wrap #join_form .join{
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            position: absolute;
            transform: rotateY(180deg);
            backface-visibility: hidden;
            transition: all .5s linear;
        }

        #form_wrap {
            position: relative;
            perspective: 1000px;
            transform-style: preserve-3d;
        }

        #login_form .label,
        #join_form .label {
            display: block;
            margin-bottom: 10px;
            user-select: none;
        }

        #login_form .input,
        #join_form .input {
            font-size: 17px;
            box-sizing: border-box;
            width: 100%;
            display: block;
            padding: 15px 20px;
            border-radius: 25px;
            border-color: hsla(0, 0%, 100%, 0);
            background-color: hwb(222 91% 0%); /* !!! 쿠키 저장 값으로 자동 완성하면 색 입혀짐 */
            font-family: 'SUITE-Regular';
        }

        #genre_box {
            width: 100%;
            height: 45px;  /* 50px */
            overflow: hidden;
            white-space: nowrap;
            cursor: move;
            -webkit-user-drag: none; -khtml-user-drag: none; -moz-user-drag: none; -o-user-drag: none; -ms-user-drag: none;
        }

        #genre_box label {
            font-size: 17px;
            display: inline-block;
            padding: 12px 20px;
            margin-left: 5px;
            border-radius: 25px;
            border-color: hsla(0, 0%, 100%, 0);
            background-color: hwb(222 91% 0%);
            font-family: 'SUITE-Regular';
            -webkit-user-drag: none;
            user-select: none;
            cursor: move;
            -webkit-user-drag: none; -khtml-user-drag: none; -moz-user-drag: none; -o-user-drag: none; -ms-user-drag: none;
        }

        #genre_box .check[type="checkbox"] {
            display: none;
            -webkit-user-drag: none;
            user-select: none;
        }

        #genre_box .check[type="checkbox"]:checked + label {
            background-color: #1161ee;
            color: white;
            cursor: pointer;
        }

        #login_form .login form .button,
        #join_form .join form .button {
            font-size: 17px;
            box-sizing: border-box;
            padding: 15px 20px;
            width: 100%;
            background-color: #1161ee;
            color: white;
            border-radius: 25px;
            border-color: hsla(0, 0%, 100%, 0);
            font-family: 'SUITE-Regular';
            cursor: pointer;
        }

        #login_form .login form .button,
        #join_form .join form .button {
            position: absolute;
            top: 410px;
        }

        #back:hover {
            color: hwb(34 0% 0%);
        }

        #login_form .login .button:hover,
        #join_form .join .button:hover{
            background-color: rgb(0, 85, 231);
        }

        #wrap .login_bt:checked + .tab + .join_bt + .tab + #form_wrap #login_form .login {
            transform: rotate(0deg);
        }

        #wrap .join_bt:checked + .tab + #form_wrap #join_form .join {
            transform: rotate(0deg);
        }

        /* 스타일 마감 바로 위에 작성 */
        @media screen and (max-width:1200px) {
            #wrap {
                width: 500px;
                height: 760px; /* 650px */
            }
        }

        @media screen and (max-width:600px) {
            #wrap {
                width: 400px;
                height: 760px; /* 650px */
            }
        }
    </style>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    
    <script>
		$(document).ready(function()
		{
			var bMove = false;
			var startX = 0;
			var scrollLeft = 0;
			var slider = document.querySelector("#genre_box");

			slider.addEventListener("mousedown", function(e){
				bMove = true;
				startX = e.pageX - slider.offsetLeft;
				scrollLeft = slider.scrollLeft;
			});

			slider.addEventListener("mouseleave", function(){
				bMove = false;
			});

            slider.addEventListener("click", function(e){
				bMove = false;
                if (startX - e.pageX !== 0) {
                    e.preventDefault();
                }
			});

			slider.addEventListener("mouseup", function(){
				bMove = false;
			});

			slider.addEventListener("mousemove", function(e){
				if( bMove )
				{
					const x = e.pageX - slider.offsetLeft;
					const walk = x - startX;
					slider.scrollLeft = scrollLeft - walk;
				}
			});
		
        } );
    </script>
</head>

<body>
    
    <div id="wrap"> <!-- 로그인 / 회원가입 -->
        <div id="back"><a href="/boot">메인으로 이동</a></div>
        
        <img id="logo" src="resources/img/logo.gif" alt="로고">

        <input id="tab-1" type="radio" name="tab" class="login_bt" checked><label for="tab-1" class="tab">로그인</label>
        <input id="tab-2" type="radio" name="tab" class="join_bt"><label for="tab-2" class="tab">회원가입</label>

        <div id="form_wrap"> <!-- 폼 div -->
            
            <div id="login_form"> <!-- 로그인 -->
                <div class="login">
                    <form action="login" method="post" name="login">
                        <label class="label">아이디</label>
                        <input id="user_id" type="text" class="input" placeholder="아이디를 입력하세요">
                        <br>
                        <label class="label">비밀번호</label>
                        <input id="user_pw" type="password" class="input" placeholder="비밀번호를 입력하세요">
                        <br>
                        <input type="submit" value="로그인" class="button">
                    </form>
                </div>
            </div>

            <div id="join_form"> <!-- 회원가입 -->
                <div id="join_form"> <!-- 회원가입 -->
                <div class="join">
                    <form action="join" method="post">
                        <label class="label">아이디</label>
                        <input id="user_id" type="text" class="input" placeholder="사용하실 아이디를 입력하세요 " name="user_id">
                        <br>            
                        <label class="label">비밀번호</label>
                        <input id="user_pw" type="password" class="input" placeholder="사용하실 비밀번호를 입력하세요" name="user_pw">
                        <br>
                        <label class="label">닉네임</label>
                        <input id="user_name" type="text" class="input" placeholder="사용하실 닉네임을 입력하세요" name="user_name">
                        <br>
                        <label for="genre" class="label">선호하는 장르 3가지 선택</label>
                        <div role="slider" id="genre_box">
                            <input id="genre_1" type="checkbox" name="genre" class="check" value="코미디">
                            <label for="genre_1"><span>코미디</span></label>
                            <input id="genre_2" type="checkbox" name="genre" class="check" value="로맨스">
                            <label for="genre_2"><span>로맨스</span></label>
                            <input id="genre_3" type="checkbox" name="genre" class="check" value="드라마">
                            <label for="genre_3"><span>드라마</span></label>
                            <input id="genre_4" type="checkbox" name="genre" class="check" value="가족">
                            <label for="genre_4"><span>가족</span></label>
                            <input id="genre_5" type="checkbox" name="genre" class="check" value="애니메이션">
                            <label for="genre_5"><span>애니메이션</span></label>
                            <input id="genre_6" type="checkbox" name="genre" class="check" value="호러">
                            <label for="genre_6"><span>호러</span></label>
                            <input id="genre_7" type="checkbox" name="genre" class="check" value="스릴러">
                            <label for="genre_7"><span>스릴러</span></label>
                            <input id="genre_8" type="checkbox" name="genre" class="check" value="미스터리">
                            <label for="genre_8"><span>미스터리</span></label>
                            <input id="genre_9" type="checkbox" name="genre" class="check" value="판타지">
                            <label for="genre_9"><span>판타지</span></label>
                            <input id="genre_10" type="checkbox" name="genre" class="check" value="SF">
                            <label for="genre_10"><span>SF</span></label>
                            <input id="genre_11" type="checkbox" name="genre" class="check" value="액션">
                            <label for="genre_11"><span>액션</span></label>
                            <input id="genre_12" type="checkbox" name="genre" class="check" value="범죄">
                            <label for="genre_12"><span>범죄</span></label>
                            <input id="genre_13" type="checkbox" name="genre" class="check" value="역사">
                            <label for="genre_13"><span>역사</span></label>
                            <input id="genre_14" type="checkbox" name="genre" class="check" value="전쟁">
                            <label for="genre_14"><span>전쟁</span></label>
                            <input id="genre_15" type="checkbox" name="genre" class="check" value="음악">
                            <label for="genre_15"><span>음악</span></label>
                            <input id="genre_16" type="checkbox" name="genre" class="check" value="서양">
                            <label for="genre_16"><span>서양</span></label>
                            <input id="genre_17" type="checkbox" name="genre" class="check" value="모험">
                            <label for="genre_17"><span>모험</span></label>
                            <input id="genre_18" type="checkbox" name="genre" class="check" value="다큐멘터리">
                            <label for="genre_18"><span>다큐멘터리</span></label>
                        </div>
                        <br>
                        <input type="submit" value="회원가입" class="button">
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>