<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
</head>
<body>
	<form action="user" method="post">
		<input type="text" name="user_id" placeholder="ID"> <br>
		<input type="password" name="user_pw" placeholder="PASSWORD"> <br>
		<input type="password" name="user_pw2" placeholder="PASSWORD 확인"> <br>
		<input type="number" name="user_age" placeholder="AGE"> <br>
		<input type="submit" value="회원가입">
	</form>

</body>
</html>