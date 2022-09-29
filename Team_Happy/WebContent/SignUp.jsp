<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- JSTL Tag를 사용하기 위한 필수 설정 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<link href="${pageContext.request.contextPath}/bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/fontawesome-free-6.2.0-web/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
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
					<li class="nav-item"><a class="nav-link" href="Login.jsp">LogIn</a></li>
					<li class="nav-item"><a class="nav-link" href="#">SignUp</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container" style="margin-top: 6rem; margin-bottom: 8rem;">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h2 class="card-title text-center fw-bolder">Sign Up</h2>
						<br>
						<form class="form-signin" method="post" action="user" onsubmit="check()">
						<input type="hidden" name="command" value="signUp">
							<div class="form-label-group" style="margin-bottom: 10px;">
								<input type="text" id="userId" name="user_id" class="form-control"
									placeholder="ID" required autofocus>
							</div>
							
							<div style="text-align: center;">
								<input class="btn btn-lg btn-primary btn-block text-uppercase" type="button"
									style="width: 100px; margin: 0 auto; font-size: 15px" onClick="overlap()" value="중복확인">
							</div><br>
							
							<div class="form-label-group" style="margin-bottom: 10px;">
								<input type="password" id="pwd" name="user_password" class="form-control"
									placeholder="Password" required>
							</div>


							<div class="form-label-group" style="margin-bottom: 10px;">
								<input type="password" id="pwd" name="user_password2" class="form-control"
									placeholder="Password Confirm" required>
							</div>
							
							<div class="form-label-group" style="margin-bottom: 10px;">
								<input type="text" id="age" name="user_age" class="form-control"
									placeholder="age" required>
							</div>

							<hr>

							<div class="form-label-group">
								<c:if test="${check == 1}">
									<label>${message}</label>
								</c:if>
							</div>
								<div style="text-align: center;">
								<button class="btn btn-lg btn-primary btn-block text-uppercase" style="width: 330px; margin: 0 auto;" type="submit">Sign up</button>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		async function overlap() {
			const userId = document.getElementById("userId").value;
			const result = await axios.get("http://localhost:8080/TeamHappy/user?command=idCheck&user_id="+userId)
				.then(res => res.headers.result);
			
			if(result === "true") {
				alert("아이디 생성 불가능");
				/* document.getElementById("resultMsg").value="아이디 생성 불가능"; */
			}else {
				alert("아이디 생성 가능");
				/* document.getElementById("resultMsg").value="아이디 생성 가능"; */
			}
		}
		
		
		
		function check() {
	        if(!document.user.user_id.value){
	            alert("id값을 입력하세요!!!");
	            return false;
	         }
	         if(!document.user.user_password.value){
	            alert("password값을 입력하세요!!!");
	            return false;
	         }
	         if(document.user.user_password.value != document.userc.user_password2.value){
	            alert("password 값이 서로 다릅니다.")
	            return false;
	         }
	         if(!document.user.user_age.value){
		            alert("나이를 입력하세요!!!");
		            return false;
		     }
		}
		
		</script>


	<!-- Footer-->
	<footer class="py-5 bg-dark" style="position: absolute; bottom: 0; width: 100%;">
		<div class="container px-4">
			<p class="m-0 text-center text-white">Team Happy _ 주현 , 재선 , 정현</p>
		</div>
	</footer>
</body>
</html>