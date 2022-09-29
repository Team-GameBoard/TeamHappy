<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL Tag를 사용하기 위한 필수 설정 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPageUpdate</title>
<link href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/fontawesome-free-6.2.0-web/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<div class="container px-4">
			<a class="navbar-brand" href="game">Team Happy</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<c:choose>
						<c:when test="${sessionScope.userId != null && sessionScope.userId != 'admin'}">
							<li class="nav-item" style="color: white;">환영합니다.
								${sessionScope.userId} 님 &nbsp;</li>
							<li class="nav-item"
								style="color: white; font-size: 15px; cursor: pointer;"
								onclick="location.href='board?command=mypage';">[ MyPage ]</li> &nbsp;
							<li class="nav-item"
								style="color: white; font-size: 15px; cursor: pointer;"
								onclick="location.href='Logout.jsp';">[ Logout ]</li>
						</c:when>

						<c:when test="${sessionScope.userId == 'admin'}">
							<li class="nav-item" style="color: white;">관리자 계정
								${sessionScope.userId} &nbsp;</li>
							<li class="nav-item"
								style="color: white; font-size: 15px; cursor: pointer;"
								onclick="location.href='Logout.jsp';">[ Logout ]</li>
						</c:when>

						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="Login.jsp">LogIn</a></li>
							<li class="nav-item"><a class="nav-link"
								href="NewSignUp.jsp">SignUp</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</nav>
	<form action="board" method="post">
	<div style="border: 1px solid black; width: 30vw; min-width: 1040px; height: 70vh; margin: 0 auto; margin-top: 5rem; ">
		<div style="border: 1px solid black; height: 10%; width: 115px; margin-top: 2rem; margin-left: 13rem;">
			<h3 style="">My Page</h3>
		</div>
		<div style="border: 1px solid black; width: 60%; height: 60%; margin: 0 auto; margin-top: 1rem; display: flex; align-items: center;">
			<div style="width: 500px; height: 300px; margin: 0 auto; display: flex;">
				<div style="width: 40%; height: 100%; text-align: right;">
					<h3 style="margin: 1.5rem 0.5rem 1.5rem 0">아이디 :</h2>
					<h3 style="margin: 1.5rem 0.5rem 1.5rem 0">패스워드 :</h2>
					<h3 style="margin: 1.5rem 0.5rem 1.5rem 0">패스워드 :</h2>
					<h3 style="margin: 1.5rem 0.5rem 1.5rem 0">나이 :</h2>
					<h3 style="margin: 1.5rem 0.5rem 1.5rem 0">게시판 등급 :</h2>
				</div>
				<input type="hidden" name="command" value="mypageUpdate">
				<div style="width: 60%; height: 100%; text-align: center;">
					<h3 style="margin: 1.4rem 0">${requestScope.userInfo.userId}</h3>
					<h3 style="margin: 1.1rem 0"><input name="Pw" type="password" style="width: 100%;" placeholder="기존 패스워드"></h3>
					<h3 style="margin: 1.1rem 0"><input name="newPw" type="password" style="width: 100%;" placeholder="신규 패스워드"></h3>
					<h3 style="margin: 1.1rem 0"><input name="newAge" style="width: 100%;" value="${requestScope.userInfo.userAge}"></h3>
					<h3 style="margin: 1.4rem 0">${requestScope.userInfo.userGrade}</h3>
				</div>
			</div>
			
		</div>
		<div style="height: 10%; width: 150px; margin-top: 1rem; margin-right: 13rem; float: right;">
				<button class="btn btn-lg btn-primary btn-block text-uppercase"
					style="float: right;" type="submit">저장하기</button>
			</form>
		</div>
	</div>



	<!-- Footer-->
	<footer class="py-5 bg-dark" style="position: absolute; bottom: 0; width: 100%;">
		<div class="container px-4">
			<p class="m-0 text-center text-white">Team Happy _ 주현 , 재선 , 정현</p>
		</div>
	</footer>
	
</body>
</html>