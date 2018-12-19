<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value='/resources/css/registrationform.css'></c:url>">
<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<script type="text/javascript">

function fillShippingAddress(form){
	if(form.shippingaddressform.checked==true){
		form["shippingaddress.apartmentnumber"].value=form["billingaddress.apartmentnumber"].value;
		form["shippingaddress.streetname"].value=form["billingaddress.streetname"].value;
		form["shippingaddress.city"].value=form["billingaddress.city"].value;
		form["shippingaddress.state"].value=form["billingaddress.state"].value;
		form["shippingaddress.country"].value=form["billingaddress.country"].value;
		form["shippingaddress.zipcode"].value=form["billingaddress.zipcode"].value;
	}
	if(form.shippingaddressform.checked==false){
		form["shippingaddress.apartmentnumber"].value=""
		form["shippingaddress.streetname"].value=""
		form["shippingaddress.city"].value=""
		form["shippingaddress.state"].value=""
		form["shippingaddress.country"].value=""
		form["shippingaddress.zipcode"].value=""
	}
}




$(document).ready(function(){
	$('#form').validate({
		rules:{
			firstname:{required:true},
			lastname:{required:true},
			phonenumber:{required:true,number:true,minlength:10,maxlength:10},
			"user.email":{required:true,email:true},
			"user.password":{required:true,minlength:5,maxlength:10},
			"billingaddress.apartmentnumber":{required:true},
			"billingaddress.streetname":{required:true},
			"billingaddress.state":{required:true},
			"billingaddress.city":{required:true},
			"billingaddress.country":{required:true},
			"billingaddress.zipcode":{required:true,number:true}
		},
		messages:{
			firstname:{required:"Firstname is mandatory"},
			phonenumber:{required:"Phonenumber is required"},
			"user.email":{required:"Email is required",email:"Please enter valid email address"}
		}
	})
})

</script>


</head>
<body>
<h4 class="heading">REGISTRATION PAGE</h4>
<div class="container">
	<c:url value="/all/registercustomer" var="url"></c:url>
	<form:form modelAttribute="customer" action="${url }" id="form">

	<form:hidden path="customerId"/>

	<form:label path="firstname" class="lastname">Enter Firstname</form:label>
	<form:input path="firstname" id="firstname" class="text"/><br>


	<form:label path="lastname" class="lastname">Enter Lastname</form:label>
	<form:input path="lastname" id="lastname" class="text"/><br>


	<form:label path="phonenumber" class="lastname">Enter Phonenumber</form:label>
	<form:input path="phonenumber" id="phonenumber" class="text"/><br>

	<hr>
	<b class="heading">Login Credentials</b><br>
	<form:label path="user.email" class="email">Enter Email</form:label>
	<form:input path="user.email" id="user.email" type="email" class="text"/>
	<br>
	<span style="color:red">${errorMessage }</span>
	<form:label path="user.password" class="password">Enter password</form:label>
	<form:input path="user.password" id="user.password" type="password" class="text" />
	<br>
	<form:hidden path="user.enabled" value="true"/>
	<form:hidden path="user.authorities.role" value="ROLE_USER"/>

	<hr>
	<b  class="heading">Billing Address</b><br>

	<form:label path="billingaddress.apartmentnumber" class="lastname">Enter Apartmentnumber</form:label>
	<form:input path="billingaddress.apartmentnumber" id="billingaddress.apartmentnumber" class="text"/><br>

	<form:label path="billingaddress.streetname" class="lastname">Enter streetname</form:label>
	<form:input path="billingaddress.streetname" id="billingaddress.streetname" class="text"/><br>

	<form:label path="billingaddress.city" class="lastname">Enter city</form:label><br>
	<form:input path="billingaddress.city" id="billingaddress.city" class="text"/><br>

	<form:label path="billingaddress.state" class="lastname">Enter state</form:label><br>
	<form:input path="billingaddress.state" id="billingaddress.state" class="text"/><br>

	<form:label path="billingaddress.country" class="lastname">Enter country</form:label>
	<form:input path="billingaddress.country" id="billingaddress.country" class="text"/><br>

	<form:label path="billingaddress.zipcode" class="lastname">Enter Zipcode</form:label>
	<form:input path="billingaddress.zipcode" id="billingaddress.zipcode" class="text"/><br>
	<hr>
	<b class="heading">Shipping address</b><br>
<span class="lastname">Check this if shipping address is same as billing address</span>
<input type="checkbox" onclick="fillShippingAddress(this.form)" id="shippingaddressform" >

	<form:label path="shippingaddress.apartmentnumber" class="lastname">Enter Apartmentnumber</form:label>
	<form:input path="shippingaddress.apartmentnumber" id="shippingaddress.apartmentnumber" class="text"/><br>

	<form:label path="shippingaddress.streetname" class="lastname">Enter streetname</form:label>
	<form:input path="shippingaddress.streetname" id="shippingaddress.streetname" class="text"/><br>

	<form:label path="shippingaddress.city" class="lastname">Enter city</form:label><br>
	<form:input path="shippingaddress.city" id="shippingaddress.city" class="text"/><br>

	<form:label path="shippingaddress.state" class="lastname">Enter state</form:label><br>
	<form:input path="shippingaddress.state" id="shippingaddress.state" class="text"/><br>

	<form:label path="shippingaddress.country" class="lastname">Enter country</form:label>
	<form:input path="shippingaddress.country" id="shippingaddress.country" class="text"/><br>

	<form:label path="shippingaddress.zipcode" class="lastname">Enter zipcode</form:label>
	<form:input path="shippingaddress.zipcode" id="shippingaddress.zipcode" class="text"/>
	<br>
	<input type="submit" value="Register">

	</form:form>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>