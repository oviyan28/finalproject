<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>HOME</title>
<style>
body {
background-color: white;
}
</style>

</head>

<body>
<div class="container-fluid">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img  src="resources/images/carousel1.jpeg" alt="first slide" style="width:1300px;height:600px;margin: 0 auto;">
                </div>
                <div class="item">
                    <img src="resources/images/carousel2.jpeg" alt="Second slide" style="width:1300px;height:600px;margin: 0 auto;">
      
                </div>
                <div class="item">
                    <img class="img-bordered" src="resources/images/carousel3.jpeg" alt="Third slide" style="width:1000px;height:600px;margin: 0 auto;">
                   
                </div>
                 <div class="item">
                    <img class="img-thumbnail" src="resources/images/carousel4.jpg" alt="forth slide" style="width:1000px;height:600px;margin: 0 auto;">
                    </div>
           
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" ></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        </div>
        </div>
<%@ include file="footer.jsp"%>

</body>
</html>