<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<!-- using action attribute we are going to call handler method -->
<div class="container">
<c:url value='/admin/addproduct' var="url"></c:url>

<form:form action="${url }" method="post" modelAttribute="product" enctype="multipart/form-data"><!-- newly created product object -->
	<table>

		<tr>
			<td>Enter Product Name</td>
			<td>
			<form:input path="productname"/>
			<form:errors path="productname" cssStyle="color:red"></form:errors>
			</td>
		</tr>
        <tr>
			<td>Enter Product Description</td>
			<td>
			<form:input path="productdesc"/>
			<form:errors path="productdesc" cssStyle="color:red"></form:errors>
			</td>
		</tr>
        <tr>
			<td>Enter Product Price</td>
			<td>
			<form:input path="price"/>
			<form:errors path="price" cssStyle="color:red"></form:errors>
			</td>
		</tr>

		<tr>
			<td>Enter Product Quantity</td>
			<td>
			<form:input path="quantity"/>
			<form:errors path="quantity" cssStyle="color:red"></form:errors>
			</td>
		</tr>

		<tr>
		<td>Select Category</td>
		<td><form:select path="category.categoryId"><!-- product.category.id=6 -->
		<c:forEach items="${categories}" var="c"><!-- c is an Object of Type Category -->
		<form:option value="${c.categoryId }">${c.categoryName } <span style="color:black"></span></form:option>

		</c:forEach>

		</form:select>
		<form:errors path="category" cssStyle="color:red"></form:errors>
		</td>
		</tr>
		<tr>
		<td>Upload an image</td>
		<td><form:input type="file" path="image" ></form:input></td>
		</tr>
		<tr><td>
		<input type="submit" value="Add Product">  </td>
		<td></td>
		</tr>

	</table>
	</form:form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>