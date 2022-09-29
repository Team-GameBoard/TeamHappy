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
	href="/fontawesome-free-6.2.0-web/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/paginate.css">
<link rel="stylesheet" href="css/ligne.css">
<script type="text/javascript" src="js/paginate.js"></script>

<style>
* {
	font-family: sans-serif;
}
</style>
</head>
<body>
<%
	
%>
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
								onclick="location.href='board?command=mypage';">[ MyPage ]</li> &nbsp;&nbsp;
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
			<c:forEach items="${requestScope.game}" var="game">
				<c:choose>
					<c:when test="${game.gameNum ne requestScope.list.get(0).gameNum}">
						<div class="fw-bolder"
						style="border: 1px solid black; width: 200px; height: 200px; line-height: 200px; 
						background-image: url('img/${game.gameName}.png'); background-size: cover; cursor: pointer;"
						onclick="location.href='board?game_num=${game.gameNum}';">${game.gameName}</div>
					</c:when>
					<c:otherwise>
						<c:set var="title" value="${game.gameName}"></c:set>	
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		
		<div
			style="border: 1px solid black; width: 800px; height: 550px; margin: 10px;">
			
			<h3>${title}</h3>
			<div class="row" style="margin-left: auto; margin-right: auto;">
				
				<table class="myTable table table-striped"
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
						<c:forEach items="${requestScope.list}" var="data" varStatus="loop">
							<tr>
								<td><p align="center">${loop.count}</p></td>
								<td><p><a href="board?command=read&num=${data.boardNum}">${data.boardTitle}</a></p></td>
								<td><p align="center">${data.userId}</p></td>
								<td><p align="center">${data.boardCreatedDate}</p></td>
								<td><p align="center"> ${data.readNum}</p></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="panel" style="display: none;">
				<div class="body">
					<div class="input-group">
						<label for="searchBox">title</label>&nbsp; <input type="search"
							id="searchBox" placeholder="content...">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="position: absolute; right: 100px; bottom: 150px;">
		<button class="btn btn-lg btn-primary btn-block text-uppercase"
			onclick="location.href='NewWrite.jsp?game_num=${requestScope.list.get(0).gameNum}'">글쓰기</button>
	</div>


	<!-- Footer-->
	<footer class="py-5 bg-dark"
		style="position: absolute; bottom: 0; width: 100%;">
		<div class="container px-4">
			<p class="m-0 text-center text-white">Team Happy _ 주현 , 재선 , 정현</p>
		</div>
	</footer>
	
<script>
		let options = {
			numberPerPage : 5, //Cantidad de datos por pagina
			goBar : false, //Barra donde puedes digitar el numero de la pagina al que quiere ir
			pageCounter : false, //Contador de paginas, en cual estas, de cuantas paginas
		};

		let filterOptions = {
			el : '#searchBox' //Caja de texto para filtrar, puede ser una clase o un ID
		};

		paginate.init('.myTable', options, filterOptions);
</script>
	
</body>
</html>