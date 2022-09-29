<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogIn</title>
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
					<li class="nav-item"><a class="nav-link" href="NewLogin.jsp">LogIn</a></li>
					<li class="nav-item"><a class="nav-link" href="NewSignUp.jsp">SignUp</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container" style="margin-top: 6rem; margin-bottom: 8rem;">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h2 class="card-title text-center fw-bolder">Log In</h2>
						<br>
						<form class="form-signin" method="post" action="user">
						<input type="hidden" name="command" value="login">
							<div class="form-label-group">
								<input type="text" id="id" name="id" class="form-control"
									placeholder="ID" required autofocus>
							</div>
							<br>

							<div class="form-label-group">
								<input type="password" id="pwd" name="pw" class="form-control"
									placeholder="Password" required>
							</div>

							<br>
							<hr>

							<div class="form-label-group">
								<c:if test="${check == 1 }">
									<label>${message}</label>
								</c:if>
							</div>
								<div style="text-align: center;">
								<button class="btn btn-lg btn-primary btn-block text-uppercase" style="width: 330px; margin: 0 auto;" type="submit">Sign in</button>
								</div>
									<hr class="my-4">
									<div class="text-center" style="font-size: 14px;">
										계정이 없으신가요? <a href="NewSignUp.jsp">회원가입</a>
									</div>
						</form>
					</div>
				</div>
			</div>
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