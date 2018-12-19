<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value='/resources/css/registrationform.css'></c:url>">
<title>Online Shopping</title>
</head>
<body>
	<c:url value='/j_spring_security_check' var="log"></c:url>
<div class="container" align="center">

	<h1 style="font-size:25px;color:white;" class="heading">LOGIN</h1>

	<hr>
	
	<form action="${log}" method="post">
		<table>
			<tr>
				<td class="email">Enter Username</td>
				<td><input type="text" required="true" name="j_username" class="text"></td>
			</tr>
			<tr>
				<td class="password">Enter Password</td>
				<td><input type="password" required="true" id="j_password" name="j_password" class="text"></td>
			</tr>
		
			<tr>
				<td><input type="submit" value="Login"></td>
			</tr>
			
		</table>
	</form>
	<span style="color: red">${error}</span>

	</div>
	
	<%@ include file="footer.jsp"%>
</body>

</html>