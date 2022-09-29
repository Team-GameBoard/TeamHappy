<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="util.DBUtil" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>connectionTest</title>
</head>
<body>

	<%-- DB 연결 테스트 --%>
	<%
		out.println(DBUtil.getConnection());	
	%>
	
</body>
</html>