<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>list.jsp</title>
</head>
<body>
<table align="center" border="0" cellpadding="5" cellspacing="2" width="70%" bordercolordark="white" bordercolorlight="black">
	
	<p>게시글 많은 순위 </p>
	<c:forEach items="${requestScope.board}" var="data" varStatus="loop">
			<tr>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            	 ${loop.count} 등
						 ${data.userId}
					</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		         개수:    ${data.count}</span></p>
		        </td>
		    </tr>
	</c:forEach>
	</table>
	
	<table align="center" border="0" cellpadding="5" cellspacing="2" width="70%" bordercolordark="white" bordercolorlight="black">
	<p>댓글 많은 순위 </p>
	<c:forEach items="${requestScope.comment}" var="data" varStatus="loop">
			<tr>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            	 ${loop.count} 등
						 ${data.userId}
					</span></p>
		        </td>
		        <td bgcolor="">
		            <p align="center"><span style="font-size:9pt;">
		            개수: ${data.count}</span></p>
		        </td>
		    </tr>
	</c:forEach>

	</table>
<hr>
</body>
</html>
