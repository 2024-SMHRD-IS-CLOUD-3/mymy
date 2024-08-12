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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
<!-- 로그인창 default.css 미사용 -->


	
</head>

<body background="src=">

	<div id="bg_img">
		<img id="log_img1"
			src="resources/img/3d-glassy-flexible-user-interface-with-play-buttons.png"
			alt="3d이미지"> <img id="log_img2"
			src="resources/img/3d-glassy-sleek-flowy-glass-ribbons.png"
			alt="3d이미지">
	</div>

	<div id="wrap">
		<!-- 로그인 / 회원가입 전체 틀 -->

		<img id="logo" src="resources/img/logo.png" alt="로고">

		<div id="back">
			<a href="/boot">MAIN</a>
		</div>
		<input id="tab-1" type="radio" name="tab" class="login_btn" checked><label
			for="tab-1" class="tab">LOGIN</label> <input id="tab-2" type="radio"
			name="tab" class="join_btn"><label for="tab-2" class="tab">JOIN</label>

			<!-- 폼 div -->
		<div id="form_wrap">

				<!-- 로그인 -->
			<div id="login_form">
				<div class="login">
					<form action="login" method="post">
						<input name="userId" type="text" class="input" placeholder="아이디를 입력하세요" autocomplete="off" id="userId">
						<br>
						<input name="userPw" type="password" class="input" placeholder="비밀번호를 입력하세요" autocomplete="new-password" id="userPw">

						<button type="submit" class="btn"
							onclick="checkLogin()">로그인</button>
					</form>
				</div>
			</div>

				<!-- 회원가입 -->
			<div id="join_form">
				<div class="join">
					<form action="join" method="post">
						<input name="userId" type="text" class="input id_ckeck" placeholder="사용하실 아이디를 입력하세요" id="inputId" autocomplete="off">
						<input type="button" value="중복체크" class="ckeck_btn" onclick="checkId()"> <span id="resultId"></span>
						<!-- 사용할 수 없는 아이디입니다. -->
						<br> <br> 
						<input name="userPw" type="password" class="input" placeholder="사용하실 비밀번호를 입력하세요" autocomplete="new-password">
						<br> 
						<input name="userName" type="text" class="input" placeholder="사용하실 닉네임을 입력하세요" id="inputName" autocomplete="off">
						<input type="button" value="중복체크" class="ckeck_btn" onclick="checkName()">
						<br>
						<span id="resultName"></span>
						<br>
						<button type="submit" class="btn" onclick="checkJoin()">회원가입</button>
					</form>
				</div>
			</div>
			
		</div>
		<!-- 폼 종료 -->
		
	</div>


	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/jquery.scrolly.min.js"></script>
	<script src="resources/js/jquery.scrollex.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script src="resources/js/login.js"></script>
	<script type="text/javascript">
		function checkId() {
			var inputId = $("#inputId").val();
			$.ajax({
				url : "checkId",
				data : {
					"inputId" : inputId
				},
				type : "get",
				success : function(data) {
					if (data) {
						console.log("hi")
						$("#resultId").text('사용할 수 있는 아이디')
						$("#resultId").css("color", "rgba(2,126,251,1)")
					} else {
						console.log("bye")
						$("#resultId").text('사용할 수 없는 아이디')
						$("#resultId").css("color", "red")
						
					}
				},
				error : function() {
					alert("Fail...")
				}
			})
		}

		function checkLogin() {
			var checkId = $("#userId").val();
			var checkPw = $("#userPw").val();
			$.ajax({
				url : "checkLogin",
				data : {
					"checkId" : checkId,
					"checkPw" : checkPw
				},
				type : "get",
				success : function(data) {
					if (data) {
						alert("아이디와 비밀번호를 확인하세요")
					} else {
						console.log("로그인 성공")
					}
				},
				error : function() {
					alert("Fail...")
				}
			})
		}

		function checkJoin() {
			var checkId = $("#inputId").val();
			var checkName = $("#inputName").val();
			$.ajax({
				url : "checkJoin",
				data : {
					"checkId" : checkId,
					"checkName" : checkName
				},
				type : "get",
				success : function(data) {
					if (data) {
						alert("회원가입 실패!")
					} else {
					}
				},
				error : function() {
					alert("Fail...")
				}
			})
		}

		function checkName() {
			var inputId = $("#inputName").val();
			$.ajax({
				url : "checkName",
				data : {
					"inputName" : inputId
				},
				type : "get",
				success : function(data) {
					if (data) {
						$("#resultName").text('사용할 수 있는 닉네임')
					} else {
						$("#resultName").text('사용할 수 없는 닉네임')
					}
				},
				error : function() {
					alert("Fail...")
				}
			})
		}
	</script>
	


</body>

</html>