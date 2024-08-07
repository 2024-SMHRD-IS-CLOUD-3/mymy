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
						<label class="label">아이디</label> 
						<input name="userId" type="text" class="input" placeholder="아이디를 입력하세요" id="checkId"> <br>
						<label class="label">비밀번호</label>
						<input name="userPw" type="password" class="input" placeholder="비밀번호를 입력하세요" id="checkPw"> 
						<button type="submit" value="로그인" class="button" onclick="checkLogin()">로그인</button>
					</form>
				</div>
			</div>
			
			<div id="join_form">
				<!-- 회원가입 -->
				<div class="join">
					<form action="join" method="post">
						<label class="label">아이디</label> 
						<input name="userId" type="text" class="input" placeholder="사용하실 아이디를 입력하세요 " id="inputId"> <br>
						<input type="button" value="중복체크" onclick="checkId()">	<span id="resultId"></span> <br> 
						<label class="label">비밀번호</label> 
						<input name="userPw" type="password" class="input" placeholder="사용하실 비밀번호를 입력하세요"> <br> 
						<label class="label">닉네임</label> 
						<input name="userName" type="text" class="input" placeholder="사용하실 닉네임을 입력하세요" id = "inputName"> 
						<input type="button" value="중복체크" onclick="checkName()">	<span id="resultName"></span> <br>
						
						<input type="submit" value="회원가입" class="button">
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