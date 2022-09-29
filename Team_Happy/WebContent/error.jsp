<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>error.jsp</title>
</head>
<body>
	
	죄송합니다. 문제가 발생하였습니다.<br>
	
	<br><hr><br>
	${requestScope.error}  
	<br>
	
	<a href="game"> 리스트로 돌아가기</a>
	
</body>
</html>