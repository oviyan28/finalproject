<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="header.jsp" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


</head>
<body>
<div class="container">
<img src="<c:url value='/resources/images/${productAttr.id }.png'></c:url>" height="250px" width="250px"><br>
<b>Product Name</b>:  ${productAttr.productname }  <br>
<b>Category  </b>: ${ productAttr.category.categoryName}<br>
<b>Product Description: </b>${productAttr.productdesc }     <br>
<b>Product Price:</b> ${productAttr.price }   <br>
<b>In Stock : </b> ${productAttr.quantity }  <br>
<c:if test="${productAttr.quantity > 0 }">
<security:authorize access="hasRole('ROLE_USER')">
<form action="<c:url value='/cart/addtocart/${productAttr.id }'></c:url>">
Enter Quantity <input type="number" name="requestedQuantity" min="1" max="${productAttr.quantity }">
<button class="btn btn-lg btn-info">Add To Cart</button><br>
</form>
</security:authorize>
</c:if>
<c:if test="${productAttr.quantity==0 }">
<button class="btn btn-lg btn-info" disabled>OUT OF STOCK</button>
</c:if>
<br>
<a href="<c:url value='/all/getallproducts'></c:url>" > Back to Previous page</a>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>


