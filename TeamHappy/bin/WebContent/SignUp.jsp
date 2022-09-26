<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
</head>
<body>
	<form action="user" method="post" name="userc" onsubmit="return check()">
		<input type="hidden" name="command" value="usercr">
		
		<input type="text" name="user_id" placeholder="ID">
	
		<script type="text/javascript">
		function check() {
	        if(!document.userc.user_id.value){
	            alert("id값을 입력하세요!!!");
	            return false;
	         }
	         if(!document.userc.user_password.value){
	            alert("password값을 입력하세요!!!");
	            return false;
	         }
	         if(document.userc.user_password.value != document.userc.user_password2.value){
	            alert("password 값이 서로 다릅니다.")
	            return false;
	         }
	         if(!document.userc.user_age.value){
		            alert("나이를 입력하세요!!!");
		            return false;
		     }
		}
		</script>
		
		 <br>
		 
		<input type="password" name="user_password" placeholder="PASSWORD"> <br>
		<input type="password" name="user_password2" placeholder="PASSWORD 확인"> <br>
		<input type="number" name="user_age" placeholder="AGE"> <br>
		<input type="submit" value="회원가입">
		
	</form>

</body>
</html>