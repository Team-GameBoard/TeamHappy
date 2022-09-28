<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL Tag를 사용하기 위한 필수 설정 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>test</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
	<body id="page-top">
	
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <div class="container px-4">
                <a class="navbar-brand" href="game">Team Happy</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                	<ul class="navbar-nav ms-auto">
				<%--
						session.setAttribute("userId", "Juhyeon");		
				--%>

					<c:choose>
						<c:when test="${sessionScope.userId != null}">
							<li class="nav-item" style="color: white;">환영합니다. ${sessionScope.userId} 님
							&nbsp;</li><li class="nav-item" style="color: white; font-size: 15px;
							cursor: pointer;" onclick="location.href='Logout.jsp';">[ Logout ]</li>
						</c:when>

						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="NewLogin.jsp">LogIn</a></li>
							<li class="nav-item"><a class="nav-link" href="NewSignUp.jsp">SignUp</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
            </div>
        </nav>
        <!-- Header-->
        <header class="bg-primary bg-gradient text-white">
            <div class="container px-4 text-center">
                <h1 class="fw-bolder">게임 파티 모집 게시판</h1><br>
                <p class="lead">원하는 게임의 파티원을 모집하세요!</p><br><br>
                <a class="btn btn-lg btn-light" href="#about">Start matching!</a>
            </div>
        </header>
        <!-- About section-->
	<section id="about">
		<div class="container px-4">
			<div class="row gx-4 justify-content-center">
				<div class="col-lg-8 text-center">
					<h1 class="fw-bolder">Game List</h1><br><br>
					<br>
				</div>
			</div>
			<div style=
				"display: flex; flex-wrap: wrap; text-align: center; border: 1px solid black; height: 500px;
				justify-content: space-evenly; align-content: space-evenly; vertical-align: middle;">
				<c:forEach items="${requestScope.list}" var="data">
					<div class="fw-bolder" 
					style="border: 1px solid black; width: 200px; height: 200px; line-height: 200px; cursor: pointer; 
					background-image: url('img/${data.gameName}.png'); background-size: cover;" 
					onclick="location.href='board?game_num=${data.gameNum}';">${data.gameName}</div>
				
				</c:forEach>
			</div>
			
		</div>
	</section>

	<!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container px-4"><p class="m-0 text-center text-white">Team Happy  _   주현 , 재선 , 정현</p></div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>