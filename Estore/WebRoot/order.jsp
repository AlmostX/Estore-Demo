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
    <script type="text/javascript">
	function phone(obj) {
		location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
	}
	function removeProduct(id) {
		var flag = window.confirm("Sure to delete the product?");

		if (flag) { 
			//要删除
			location.href = "${pageContext.request.contextPath}/RemoveProductFromCartServlet?id="
					+ id;
		}
	}
	function delP() {
		var param=""; //它是用于拼接参数.
		var delCks = document.getElementsByName("delCk");
		for ( var i = 0; i < delCks.length; i++) {
			if (delCks[i].checked == true) {
				param+="id="+delCks[i].value+"&";				
			}
		}
		
		if(param!=""){
			param=param.substring(0,param.length-1);
			location.href="${pageContext.request.contextPath}/RemoveSelectProductFromCartServlet?"+param;
			
		}
	};
	</script>
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
        <div class="head">Order</div>
        <div class="title">
            <ul>
                <li>Name</li>
                <li>Unit Price</li>
                <li>Number</li>
                <li>Total Price</li>
            </ul>
        </div>
        
	  	<c:set value="0" var="money"></c:set>
		<ul class="order-content">		
			<c:forEach items="${cart}" var="c">
	            <ul>
		            <li><img src="upload/${c.key.imgurl}"></li>
		            <li><span class="order-details">${c.key.description}</span></li>
		            <li><span class="price">${c.key.price }</span></li>
		            <li><span class="order-count">${c.value}</span></li>
		        </ul>
		      	<c:set value="${money+c.key.price*c.value}" var="money"></c:set>
			</c:forEach>
	        <div class="order-sum">${money}</div>
            <input aria-label="money" name="money" placeholder="money" type="hidden" value="${money}">
        </ul>
        <div class="order-foot">
            <ul>
                <li>
	                <div class="order-adress">
	                    <input aria-label="Address" name="receiverinfo" placeholder="Address" type="text">
	                </div>
                </li>
                <li>
                	<div class="order-pay">
                		The way to pay:
                		<label><input name="pay" type="radio" checked="checked">Alipay</label>
                		<label><input name="pay" type="radio">Visa</label>
                		<label><input name="pay" type="radio">ApplePay</label>
                	</div>
                </li>
              	<li>
              		<button class="sum-btn" type="submit" onclick="delP()">Generate</button>
              	</li>  
            
            </ul>
        </div>
    </form>
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
	
    <script type="text/javascript" src="home/JS/jquery.min.js"></script>
    <script type="text/javascript" src="home/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="home/JS/bg-canvas.js"></script>
    <script type="text/javascript" src="home/JS/main.js"></script>
</body>
</html>