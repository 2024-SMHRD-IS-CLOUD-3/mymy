<%@page import="java.util.ArrayList"%>
<%@page import="com.mychu.entity.Users"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인, 회원가입 페이지</title>
    <link rel="stylesheet" href="resources/css/font.css">
    <link rel="stylesheet" href="resources/css/login.css">
    <link rel="stylesheet" href="resources/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
   
   
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인, 회원가입 페이지</title>
    <link rel="stylesheet" href="resources/css/font.css">
    <link rel="stylesheet" href="resources/css/login.css">
    <link rel="stylesheet" href="resources/css/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
</head>

<body>
    <img id="log_img1" src="resources/img/3d-glassy-flexible-user-interface-with-play-buttons.png" alt="3d이미지">
    <img id="log_img2" src="resources/img/3d-glassy-sleek-flowy-glass-ribbons.png" alt="3d이미지">

    <div id="wrap">
        <div id="wrap_box">
            <img id="logo" src="resources/img/logo.png" alt="로고">
            <div id="back"><a href="/boot">MAIN</a></div>
            <input id="tab-1" type="radio" name="tab" class="login_btn" checked><label for="tab-1"
                class="tab">LOGIN</label>
            <input id="tab-2" type="radio" name="tab" class="join_btn"><label for="tab-2" class="tab">JOIN</label>

            <div id="form_wrap">
                <!-- 로그인 -->
                <div id="login_form">
                    <div class="login">
                        <form action="login" method="post" onsubmit="checkLogin(event)">
                            <input name="userId" type="text" class="input" placeholder="아이디를 입력하세요" id="userId"
                                autocomplete="off">
                            <input name="userPw" type="password" class="input" placeholder="비밀번호를 입력하세요" id="userPw"
                                autocomplete="new-password">
                            <button type="submit" class="btn">로그인</button>
                        </form>
                    </div>
                </div>
                <!-- 회원가입 -->
                <div id="join_form">
                    <div class="join">
                        <form action="join" method="post" onsubmit="checkJoin(event)">
                            <div class="input_group">
                                <input name="userId" type="text" class="input" placeholder="사용하실 아이디를 입력하세요"
                                    id="inputId" autocomplete="off">
                                <button type="button" value="N" class="ckeck_btn" id="ckeck1" onclick="checkId()">중복확인
                                </button>
                            </div>
                            <input name="userPw" type="password" class="input input_name" placeholder="사용하실 비밀번호를 입력하세요"
                                autocomplete="new-password" id=userPw">
                            <div class="input_group">
                                <input name="userName" type="text" class="input" placeholder="사용하실 닉네임을 입력하세요"
                                    id="inputName" autocomplete="off">
                                <button type="button" value="N" class="ckeck_btn" id="ckeck2"
                                    onclick="checkName()">중복확인</button>
                            </div>
                            <button type="submit" class="btn">회원가입</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="resources/js/jquery.min.js"></script>
    <script src="resources/js/jquery.scrolly.min.js"></script>
    <script src="resources/js/jquery.scrollex.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript">
    const Toast = Swal.mixin({
        toast: true,
        position: 'center-center',
        showConfirmButton: false,
        timer: 1000,
        timerProgressBar: false
    });

    /* 아이디 중복 확인 */
    function checkId() {
        var inputId = $("#inputId").val().trim();
        var ckeck1 = document.getElementById('ckeck1');
        
        if (inputId === "") {
            Toast.fire({
                icon: 'error',
                title: '사용할 아이디를 먼저 입력하세요'
            });
            ckeck1.style.color = '#ffffff80';
            ckeck1.style.textShadow = '0 0 0px';
            ckeck1.setAttribute("data_checked", "false");
            return;  // 공백일 경우 AJAX 요청을 보내지 않습니다.
        }

        $.ajax({
            url: "checkId",
            data: { "inputId": inputId },
            type: "get",
            success: function (data) {
                if (data) {
                    Toast.fire({
                        icon: 'success',
                        title: '사용 가능한 아이디입니다!'
                    });

                    ckeck1.style.color = '#ffffff';
                    ckeck1.style.textShadow = '0 0 15px #FFFFFF';
                    ckeck1.setAttribute("data_checked", "true");
                } else {
                    Toast.fire({
                        icon: 'error',
                        title: '사용할 수 없는 아이디입니다.'
                    });

                    ckeck1.style.color = '#ffffff80';
                    ckeck1.style.textShadow = '0 0 0px';
                    ckeck1.setAttribute("data_checked", "false");
                    $("#inputId").val("").trigger("focus");
                }
            }, 
            error: function () {
                Toast.fire({
                    icon: 'error',
                    title: '잘못된 입력입니다.'
                });

                ckeck1.style.color = '#ffffff80';
                ckeck1.style.textShadow = '0 0 0px';
                ckeck1.setAttribute("data_checked", "false");
            }
        });
    }

    /* 닉네임 중복 확인 */
    function checkName() {
        var inputName = $("#inputName").val().trim();
        var ckeck2 = document.getElementById('ckeck2');
        
        if (inputName === "") {
            Toast.fire({
                icon: 'error',
                title: '사용할 닉네임을 먼저 입력하세요'
            });
            ckeck2.style.color = '#ffffff80';
            ckeck2.style.textShadow = '0 0 0px';
            ckeck2.setAttribute("data_checked", "false");
            return;  // 공백일 경우 AJAX 요청을 보내지 않습니다.
        }

        $.ajax({
            url: "checkName",
            data: { "inputName": inputName },
            type: "post",
            success: function (data) {
                if (data) {
                    Toast.fire({
                        icon: 'success',
                        title: '사용 가능한 닉네임입니다!'
                    });

                    ckeck2.style.color = '#ffffff';
                    ckeck2.style.textShadow = '0 0 15px #FFFFFF';
                    ckeck2.setAttribute("data_checked", "true");  // 중복확인 완료 상태 저장
                }
                else {
                    Toast.fire({
                        icon: 'error',
                        title: '사용할 수 없는 닉네임입니다'
                    });

                    ckeck2.style.color = '#ffffff80';
                    ckeck2.style.textShadow = '0 0 0px';
                    ckeck2.setAttribute("data_checked", "false");
                    $("#inputName").val("").trigger("focus");
                }
            }, 
            error: function () {
                Toast.fire({
                    icon: 'error',
                    title: '잘못된 입력입니다'
                });

                ckeck2.style.color = '#ffffff80';
                ckeck2.style.textShadow = '0 0 0px';
                ckeck2.setAttribute("data_checked", "false");
            }
        });
    }

    /* 회원가입 체크 */
    function checkJoin(event) {
       event.preventDefault();

        var checkId = $("#inputId").val();
        var checkName = $("#inputName").val();
        var checkPw = $("#inputPw").val();
        var ckeck1 = document.getElementById('ckeck1');
        var ckeck2 = document.getElementById('ckeck2');
        
       // 아이디와 닉네임 중복 확인 여부를 저장할 변수
        var idChecked = ckeck1.getAttribute("data_checked");
        var nameChecked = ckeck2.getAttribute("data_checked");

        // 아이디 또는 닉네임의 중복 확인이 완료되지 않은 경우
        if (idChecked !== "true") {
            Toast.fire({
                icon: 'error',
                title: '아이디 중복확인 버튼을 눌러주세요!'
            });
            ckeck1.style.color = '#ffffff80';
            return;  // 중복확인이 완료되지 않았으면 함수 종료
        }

        if (nameChecked !== "true") {
            Toast.fire({
                icon: 'error',
                title: '닉네임 중복확인 버튼을 눌러주세요!'
            });
            ckeck2.style.color = '#ffffff80';
            return;  // 중복확인이 완료되지 않았으면 함수 종료
        }
        
     // 서버로 회원가입 요청을 보내는 AJAX
        $.ajax({
            url: "checkJoin",
            data: {
                "checkId": checkId,
                "checkPw": checkPw,
                "checkName": checkName
            },
            type: "get",
            success: function (data) {
                if (data) {
                    Toast.fire({
                        icon: 'error',
                        title: '회원가입 실패'
                    });

                    ckeck1.style.color = '#ffffff80';
                    ckeck1.style.textShadow = '0 0 0px';
                    ckeck2.style.color = '#ffffff80';
                    ckeck2.style.textShadow = '0 0 0px';
                } else {
                    Toast.fire({
                        icon: 'success',
                        title: '회원가입 성공!'
                    }).then(function() {
                        // 알림이 뜬 후 일정 시간 후에 페이지 이동
                        setTimeout(function() {
                            event.target.submit(); // 폼을 수동으로 제출하여 페이지 전환
                        }, 350);
                    });
                }
            },
            error: function () {
                Toast.fire({
                    icon: 'error',
                    title: '다시 시도해주세요'
                });

                ckeck1.style.color = '#ffffff80';
                ckeck1.style.textShadow = '0 0 0px';
                ckeck2.style.color = '#ffffff80';
                ckeck2.style.textShadow = '0 0 0px';
            }
        });
    }

    /* 로그인 체크 */
    function checkLogin(event) {
       event.preventDefault();  // 폼 제출로 인한 새로고침 방지

        var checkId = $("#userId").val();
        var checkPw = $("#userPw").val();

        $.ajax({
            url: "checkLogin",
            data: {
                "checkId": checkId,
                "checkPw": checkPw
            },
            type: "get",
            success: function (data) {
                if (data) {
                    Toast.fire({
                        icon: 'error',
                        title: '로그인 정보 확인 후 다시 시도해주세요'
                    });
                } else {
                    Toast.fire({
                        icon: 'success',
                        title: '로그인 성공!'
                    }).then(function() {
                        // 알림이 뜬 후 일정 시간 후에 페이지 이동
                        setTimeout(function() {
                            event.target.submit(); // 폼을 수동으로 제출하여 페이지 전환
                        }, 350);
                    });
                }
            },
            error: function () {
                Toast.fire({
                    icon: 'error',
                    title: '로그인에 실패하였습니다'
                });
            }
        });
    }
</script>
</body>

</html>