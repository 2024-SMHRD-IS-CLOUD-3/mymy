<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인, 회원가입 페이지</title>
<link rel="stylesheet" href="resources/css/login.css">
<link rel="stylesheet" href="resources/css/basic.css">
</head>

<body>
	<div id="wrap">
		<!-- 로그인 / 회원가입 -->
		<div id="back">
			<a href="/boot">메인으로 이동</a>
		</div>

		<img id="logo" src="resources/img/logo.gif" alt="로고"> <input
			id="tab-1" type="radio" name="tab" class="login_bt" checked><label
			for="tab-1" class="tab">로그인</label> <input id="tab-2" type="radio"
			name="tab" class="join_bt"><label for="tab-2" class="tab">회원가입</label>

		<div id="form_wrap">
			<!-- 폼 div -->

			<div id="login_form">
				<!-- 로그인 -->
				<div class="login">
					<form action="login" method="post">
						<label class="label">아이디</label> <input name="userId" type="text"
							class="input" placeholder="아이디를 입력하세요"> <br> <label
							class="label">비밀번호</label> <input name="pw" type="password"
							class="input" placeholder="비밀번호를 입력하세요"> <input
							type="submit" value="로그인" class="button">
					</form>
				</div>
			</div>

			<div id="join_form">
				<!-- 회원가입 -->
				<div class="join">
					<form action="join" method="post">
						<label class="label">아이디</label> <input name="userId" type="text"
							class="input" placeholder="사용하실 아이디를 입력하세요 "> <br> <label
							class="label">비밀번호</label> <input name="pw" type="password"
							class="input" placeholder="사용하실 비밀번호를 입력하세요"> <br> <label
							class="label">닉네임</label> <input name="name" type="text"
							class="input" placeholder="사용하실 닉네임을 입력하세요"> <input
							type="submit" value="회원가입" class="button">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>