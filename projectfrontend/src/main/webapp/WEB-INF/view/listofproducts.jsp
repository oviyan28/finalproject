<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ include file="header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
body {
   background-image: url(https://images.pexels.com/photos/277431/pexels-photo-277431.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500);
  
   height:100%;
   width:100%;
}
</style>
</head>
<body>
	<div class="container">
	<table class="table table-striped" border="1">
		<thead style="color:white;">
			<tr>
				<th>Product Image</th>
				<th>Id</th>
				<th>Product Name</th>
                <th>Price</th>
				<th>Quantity</th>
				<td>Categoryname</td>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${products}" var="p">
				<tr>

					<td><img src="<c:url value='/resources/images/${p.id }.png'></c:url>" height="30px" width="40px"></td>
					<td>${p.id }</td>  <!-- p.getId() -->
					<td>${p.productname }</td> <!-- p.getProductname() -->

					<td>${p.price }</td> <!-- p.getPrice() -->
					<td>${p.quantity }</td>
					<td>${p.category.categoryName }</td>
					<td>
					<a href="<c:url value='/all/getproduct?id=${p.id }'></c:url>"><span class="glyphicon glyphicon-info-sign"></span></a>
					<!-- call the handler method getProduct(@RequestParam int id)
					in the ProductController -->
					<a href="<c:url value='/admin/deleteproduct?id=${p.id }'></c:url>"><span class="glyphicon glyphicon-trash"></span></a>
					<a href="<c:url value='/admin/getupdateproductform?id=${p.id }'></c:url>"><span class="glyphicon glyphicon-pencil"></span></a>
					</td>
				<tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>

