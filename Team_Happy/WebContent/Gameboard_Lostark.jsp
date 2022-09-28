<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- JSTL Tag를 사용하기 위한 필수 설정 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gameboard</title>
<link
	href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link
	href="${pageContext.request.contextPath}/fontawesome-free-6.2.0-web/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
<%
	
%>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<div class="container px-4">
			<a class="navbar-brand" href="test.jsp">Team Happy</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<c:choose>
						<c:when test="${sessionScope.userId != null}">
							<li class="nav-item" style="color: white;">환영합니다.
								${sessionScope.userId} 님 &nbsp;</li>
							<li class="nav-item"
								style="color: white; font-size: 15px; cursor: pointer;"
								onclick="location.href='Logout.jsp';">[ Logout ]</li>
						</c:when>

						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="NewLogin.jsp">LogIn</a></li>
							<li class="nav-item"><a class="nav-link"
								href="NewSignUp.jsp">SignUp</a></li>
						</c:otherwise>
					</c:choose>

				</ul>
			</div>
		</div>
	</nav>

	<div
		style="border: 1px solid black; width: 90vw; min-width: 1040px; height: 70vh; margin: 0 auto; margin-top: 5rem; display: flex; justify-content: space-evenly; align-content: space-evenly; vertical-align: middle;">
		<div
			style="border: 1px solid black; width: 230px; height: 550px; margin: 10px; text-align: center; display: flex; justify-content: space-evenly; align-content: space-evenly; vertical-align: middle; flex-wrap: wrap;">
			<h5 class="fw-bolder">다른 게임</h5>
			<div class="fw-bolder"
				style="border: 1px solid black; width: 200px; height: 200px; line-height: 200px; 
				background-image: url('img/LoL.png'); background-size: cover; cursor: pointer;"
				onclick="location.href='board?game_num=20';">LoL</div>
			<div class="fw-bolder"
				style="border: 1px solid black; width: 200px; height: 200px; line-height: 200px; 
				background-image: url('img/Overwatch.png'); background-size: cover; cursor: pointer;"
				onclick="location.href='board?game_num=30';">Overwatch2</div>
		</div>
		<div
			style="border: 1px solid black; width: 800px; height: 550px; margin: 10px;">
			<h3>Lostark</h3>
			<div class="row" style="margin-left: auto; margin-right: auto;">
				
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd; width: 800px; margin-left: auto; margin-right: auto;">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
							<th style="background-color: #eeeeee; text-align: center;">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.list}" var="data">
							<tr>
								<td><p align="center">${data.board_num}</p></td>
								<td>
									<p>
											<a href="board?command=read&num=${data.board_num}">${data.board_title}</a>
									</p>
								</td>
								<td><p align="center">${data.user_id}</p></td>
								<td><p align="center">${data.board_created_date}</p></td>
								<td><p align="center"> ${data.read_num}</p></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div style="position: absolute; right: 100px; bottom: 150px;">
		<button class="btn btn-lg btn-primary btn-block text-uppercase"
			onclick="location.href='NewWrite_Lostark.jsp'">글쓰기</button>
	</div>


	<!-- Footer-->
	<footer class="py-5 bg-dark"
		style="position: absolute; bottom: 0; width: 100%;">
		<div class="container px-4">
			<p class="m-0 text-center text-white">Team Happy _ 주현 , 재선 , 정현</p>
		</div>
	</footer>
</body>
</html>