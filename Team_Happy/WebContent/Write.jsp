<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write</title>
</head>
<body>
	<form action="board" method="post">
		<select name="tier">
		    <option value="bronze">bronze</option>
		    <option value="silver">silver</option>
		    <option value="gold">gold</option>
		    <option value="platinum">platinum</option>
		</select> &nbsp;&nbsp;&nbsp;
		
		제목 : <input type="text" name="title" placeholder="제목을 입력해주세요."><br>
		
		<input type="text" name="content" placeholder="재밌는 내용."> <br>
		
		<input type="submit" value="저장">
	</form>

</body>
</html>