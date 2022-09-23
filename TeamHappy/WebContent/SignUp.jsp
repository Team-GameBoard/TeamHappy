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
		<input type="text" name="id" placeholder="ID"> <br>
		<input type="password" name="pw" placeholder="PASSWORD"> <br>
		<input type="password" name="pw2" placeholder="PASSWORD 확인"> <br>
		<input type="number" name="age" placeholder="AGE"> <br>
		<input type="submit" value="회원가입">
	</form>

</body>
</html>