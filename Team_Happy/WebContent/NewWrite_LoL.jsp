<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL Tag를 사용하기 위한 필수 설정 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
<link href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/fontawesome-free-6.2.0-web/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <div class="container px-4">
                <a class="navbar-brand" href="test.jsp">Team Happy</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                	<ul class="navbar-nav ms-auto">
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

	<div class="container" role="main" style="margin-top: 5rem;">
		<h2>글 쓰기</h2><br>
		<form name="form" id="form" role="form" method="post"
			action="${pageContext.request.contextPath}/board/saveBoard">
			<div class="mb-3">
				<label for="title">제목</label> <input type="text"
					class="form-control" name="title" id="title"
					placeholder="제목을 입력해 주세요">
			</div>
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" name="content" id="content"
					placeholder="내용을 입력해 주세요"></textarea>
			</div>
			<div class="mb-3">
				<label for="tag">티어</label><br>
				<select name="tier">
					<option value="bronze">bronze</option>
					<option value="silver">silver</option>
					<option value="gold">gold</option>
					<option value="platinum">platinum</option>
				</select>
			</div>
		</form>
		<div>
			<button type="button" class="btn btn-sm btn-primary" id="btnSave">저장</button>
			<button type="button" class="btn btn-sm btn-primary" id="btnList" onclick="location.href='board?game_num=20'">목록</button>
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