<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<form action="user" method="post" name="login" onsubmit="return userlogin()">
		<input type="hidden" name="command" value="userlogin">
	
		<input type="text" name="id" placeholder="ID"> <br>
		
		<script type="text/javascript">
			function userlogin() {
				if(!document.login.id.value){
					alert("id를 입력하세요!!!");
	            	return false;
				}
				if(!document.login.pw.value){
		            alert("password를 입력하세요!!!");
		            return false;
		         }
			}
		</script>
		
		<input type="password" name="pw" placeholder="PASSWORD"> <br>
		<input type="submit" value="로그인">
	</form>

</body>
</html>