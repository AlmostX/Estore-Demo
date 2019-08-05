<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/main.css">
</head>
<body>

<header>
    <nav class="navbar navbar-inverse" role="navigation">
     <div class="logo"></div>
        <a href="ProductFindAllServlet">Home</a>
        <a href="javascript:void(0)" onclick="phone('Phone')">Phone</a>
        <a href="javascript:void(0)" onclick="phone('Pad')">Pad</a>
        <a href="javascript:void(0)" onclick="phone('Laptop')">Laptop</a>
        <a href="javascript:void(0)" onclick="phone('Components')">Components</a>
        <span class="slider-bar"></span>
        <i class="carts" onclick="tocart()"></i>
        <span><c:if test="${not empty user }">
        			 <h4 class="user"><a href="edit.jsp?id=${user.id}">${user.username}</a></h4>
					 <a class="logout" href="${pageContext.request.contextPath}/LoginOutServlet">Exit</a>
			</c:if>
			<c:if test="${ empty user }">
        		<h4 class="signin" data-toggle="modal" data-target="#log-wrapper">Sign In</h4>
            	<h4 class="signup" data-toggle="modal" data-target="#log-wrapper">Sign Up</h4>
            </c:if>
		</span>
    </nav>
</header>

 <section class="order">
 	<form action="${pageContext.request.contextPath}/AddOrderServlet" method="post"> 
        <div class="head">
        	Order
        	<a href="index.jsp" style="float:right">Back</a>
        </div>
        <div class="title">
            <ul>
                <li>Name</li>
                <li>Unit Price</li>
                <li>Number</li>
                <li>Total Price</li>
            </ul>
        </div>
      
 
		<ul class="order-content">		
	
        <ul>
            <li>
                <img src="upload/${sessionScope.pro.imgurl}">
            </li>
            <li><span class="order-details">${sessionScope.pro.description}</span></li>
            <li><span class="price">${sessionScope.pro.price}</span></li>
            <li><span class="order-count">1</span></li>
        </ul>
      	<c:set value="${sessionScope.pro.price}" var="money"></c:set>

            <div class="order-sum">${sessionScope.pro.price}</div>
            <input aria-label="money" name="money" placeholder="money" type="hidden" value="${sessionScope.pro.price}">
            
        </ul>
        <div class="order-foot">
            <ul>
                <li><div class="order-adress">
                    <input aria-label="Address" name="receiverinfo" placeholder="Address" type="text">
                </div></li>
              <li><button class="sum-btn" type="submit">Generate</button></li>  
            </ul>
        </div>
    </section>
<footer>
	<div>
		<ul>
        	<li class="copyright">©2019 www.hdu.edu.cn All Rights Reserved<br>Email:x546216768@gamil.com</li>
		</ul>
        <ul>
        	<li class="copyright"><a href="#">About us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">HELP</a>&nbsp;&nbsp;&nbsp;<br><a href="#">Join us</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">Copyright</a></li>  
        </ul>  
        <ul>
        	<li>TEL:0571-86915114<br>Address:HangZhou</li>  
        </ul>  
     </div>
</footer>

	<script type="text/javascript">
	function phone(obj) {
		location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
	}
	</script>
    <script type="text/javascript" src="home/JS/jquery.min.js"></script>
    <script type="text/javascript" src="home/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="home/JS/bg-canvas.js"></script>
    <script type="text/javascript" src="home/JS/main.js"></script>




</body>
</html>