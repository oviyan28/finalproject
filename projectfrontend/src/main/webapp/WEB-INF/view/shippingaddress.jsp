<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>



</head>
<body>
<div class="container">
<c:url value='/cart/createorder' var="url"></c:url>
<form:form modelAttribute="shippingaddress" method="post"  action="${url }" >
<table>
 <tr>
	   <td></td>
	   <td><form:hidden path="shippingId"></form:hidden></td>
	   </tr>
	  
		<tr>
			<td>Enter Apartment number</td>
			<td>
			<form:input path="apartmentnumber"/>
			<form:errors path="apartmentnumber" cssStyle="color:red"></form:errors>

			</td>
		</tr>
        <tr>
			<td>Enter street name</td>
			<td>
			<form:input path="streetname"/>
			<form:errors path="streetname" cssStyle="color:red"></form:errors>
			</td>
		</tr>
        <tr>
			<td>Enter City</td>
			<td>
			<form:input path="city"/>
			<form:errors path="city" cssStyle="color:red"></form:errors>
			</td>
		</tr>
		
		<tr>
			<td>Enter State</td>
			<td>
			<form:input path="state"/>
			<form:errors path="state" cssStyle="color:red"></form:errors>
			</td>
		</tr>
		
		<tr>
			<td>Enter country</td>
			<td>
			<form:input path="country"/>
			<form:errors path="country" cssStyle="color:red"></form:errors>
			</td>
		</tr>
		
		<tr>
			<td>Enter Zipcode</td>
			<td>
			<form:input path="zipcode"/>
			<form:errors path="zipcode" cssStyle="color:red"></form:errors>
			</td>
		</tr>
	
		<tr><td>
		<input type="submit" value="Submit">  </td>
		<td></td>
		</tr>
		
		
	</table>



</form:form>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>
    