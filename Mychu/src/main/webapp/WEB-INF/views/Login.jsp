<%@page import="java.util.ArrayList"%>
<%@page import="com.mychu.entity.Users"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인, 회원가입 페이지</title>
    <link rel="stylesheet" href="resources/css/font.css">
    <link rel="stylesheet" href="resources/css/login.css">
    <link rel="stylesheet" href="resources/js/login.js">
    <!-- 로그인창 default.css 미사용 -->

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        // function checkId() {
        //     var id = $('#userId').val();

        //     $.ajax({
        //         url: '${contextPath}/member/incheck', // 수정 필요
        //         type: 'post',
        //         data: {id:id},
        //         success : function(cnt) {
        //             if(cnt != 1 && id.length > 0){
        //                 $('.id_o').css("display", "inline-block")
        //             } else if(cnt == 1 && id.length > 0){
        //                 $('.id_n').css("display", "inline-block")
        //             }
        //         },
        //         error : function() {
        //             alert("에러입니다")
        //         }
        //     })
        // }
    </script>
</head>

<body>
    <div id="wrap"> <!-- 로그인 / 회원가입 -->
        <div id="back"><a href="/boot">메인으로 이동</a></div>

        <img id="logo" src="resources/img/logo.gif" alt="로고">

        <input id="tab-1" type="radio" name="tab" class="login_btn" checked><label for="tab-1" class="tab">로그인</label>
        <input id="tab-2" type="radio" name="tab" class="join_btn"><label for="tab-2" class="tab">회원가입</label>

        <div id="form_wrap"> <!-- 폼 div -->

            <div id="login_form"> <!-- 로그인 -->
                <div class="login">
                    <form action="login" method="post">
                        <label class="label">아이디</label>
                        <input name="userId" type="text" class="input" id="userId" placeholder="아이디를 입력하세요">
                        <br>
                        <!-- <span class="id_ck id_o">zz</span>
                        <span class="id_ck id_n"></span> -->
                        <label class="label">비밀번호</label>
                        <input name="pw" type="password" class="input" placeholder="비밀번호를 입력하세요">

                        <button type="submit" value="로그인" class="btn" onclick="checkLogin()">로그인</button>
                    </form>
                </div>
            </div>

            <div id="join_form"> <!-- 회원가입 -->
                <div class="join">
                    <form action="join" method="post">
                        <label class="label">아이디</label>
                        <input name="userId" type="text" class="input id_ckeck" id="inputId" placeholder="사용하실 아이디를 입력하세요 ">
                        <input type="button" value="중복체크" class="ckeck_btn" onclick="checkId()">
                        <br>
                        <span id="resultId"></span>
                        <br>
                        <br>
                        <label class="label">비밀번호</label>
                        <input name="pw" type="password" class="input" placeholder="사용하실 비밀번호를 입력하세요">
                        <br>
                        <label class="label">닉네임</label>
                        <input name="name" type="text" class="input" placeholder="사용하실 닉네임을 입력하세요">

                        <button type="button" class="btn modal_btn" onclick="showModal()">회원가입</button>

                        <div id="genre_modal">
                            <div class="genre_box">
                                <label class="label_title">선호하는 장르 3가지 선택</label>
                                <!-- input id값 = label for값 연결 -->
                                <input id="genre_1" type="checkbox" name="genre_1" class="check" value="코미디">
                                <label for="genre_1"><span>코미디</span></label>
                                <input id="genre_2" type="checkbox" name="genre_2" class="check" value="로맨스">
                                <label for="genre_2"><span>로맨스</span></label>
                                <input id="genre_3" type="checkbox" name="genre_3" class="check" value="드라마">
                                <label for="genre_3"><span>드라마</span></label>
                                <input id="genre_4" type="checkbox" name="genre_4" class="check" value="가족">
                                <label for="genre_4"><span>가족</span></label>
                                <input id="genre_5" type="checkbox" name="genre_5" class="check" value="애니메이션">
                                <label for="genre_5"><span>애니메이션</span></label>
                                <input id="genre_6" type="checkbox" name="genre_6" class="check" value="호러">
                                <label for="genre_6"><span>호러</span></label>
                                <input id="genre_7" type="checkbox" name="genre_7" class="check" value="스릴러">
                                <label for="genre_7"><span>스릴러</span></label>
                                <input id="genre_8" type="checkbox" name="genre_8" class="check" value="미스터리">
                                <label for="genre_8"><span>미스터리</span></label>
                                <input id="genre_9" type="checkbox" name="genre_9" class="check" value="판타지">
                                <label for="genre_9"><span>판타지</span></label>
                                <input id="genre_10" type="checkbox" name="genre_10" class="check" value="SF">
                                <label for="genre_10"><span>SF</span></label>
                                <input id="genre_11" type="checkbox" name="genre_11" class="check" value="액션">
                                <label for="genre_11"><span>액션</span></label>
                                <input id="genre_12" type="checkbox" name="genre_12" class="check" value="범죄">
                                <label for="genre_12"><span>범죄</span></label>
                                <input id="genre_13" type="checkbox" name="genre_13" class="check" value="역사">
                                <label for="genre_13"><span>역사</span></label>
                                <input id="genre_14" type="checkbox" name="genre_14" class="check" value="전쟁">
                                <label for="genre_14"><span>전쟁</span></label>
                                <input id="genre_15" type="checkbox" name="genre_15" class="check" value="음악">
                                <label for="genre_15"><span>음악</span></label>
                                <input id="genre_16" type="checkbox" name="genre_16" class="check" value="서양">
                                <label for="genre_16"><span>서양</span></label>
                                <input id="genre_17" type="checkbox" name="genre_17" class="check" value="모험">
                                <label for="genre_17"><span>모험</span></label>
                                <input id="genre_18" type="checkbox" name="genre_18" class="check" value="다큐멘터리">
                                <label for="genre_18"><span>다큐멘터리</span></label>
                            </div>
                            
                            <input type="submit" value="선택 완료" class="submit_btn">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>


    <script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery.scrolly.min.js"></script>
	<script src="resources/js/jquery.scrollex.min.js"></script>
	 <script type="text/javascript">
    	function checkId(){
    		var inputId=$("#inputId").val();
    		$.ajax({
    			url : "checkId",
    			data : {"inputId":inputId},
    			type : "get",
    			success : function(data){
    				if(data){
    					console.log("hi")
    					$("#resultId").text('사용할 수 있는 아이디')
    				} else {
    					console.log("bye")
    					$("#resultId").text('사용할 수 없는 아이디')
    				}
    			}, error : function() {
    				alert("Fail...")
    			}
    		})
    	}
    	
    	function checkLogin(){
    		var checkId=$("#checkId").val();
    		var checkPw=$("#checkPw").val();
    		$.ajax({
    			url : "checkLogin",
    			data : {"checkId":checkId, "checkPw":checkPw},
    			type : "get",
    			success : function(data){
    				if(data === "1"){
    					alert("아이디와 비밀번호를 확인하세요")
    				} else {
    					console.log("로그인 성공")
    				}
    			}, error : function() {
    				alert("Fail...")
    			}
    		})
    	}
    	
    	function checkName(){
    		var inputId=$("#inputName").val();
    		$.ajax({
    			url : "checkName",
    			data : {"inputName":inputId},
    			type : "get",
    			success : function(data){
    				if(data){
    					$("#resultName").text('사용할 수 있는 닉네임')
    				} else {
    					$("#resultName").text('사용할 수 없는 닉네임')
    				}
    			}, error : function() {
    				alert("Fail...")
    			}
    		})
    	}
    </script>

</body>

</html>