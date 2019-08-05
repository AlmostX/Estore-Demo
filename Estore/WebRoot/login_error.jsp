<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="home/CSS/main.css">
<script type="text/javascript">

    alert("Login Error!");

window.onload=function(){
	var username=document.getElementById("username");
	username.value=window.decodeURIComponent("${cookie.remember.value}","utf-8");
};

function change() {
	document.getElementById("cimg").src = "${pageContext.request.contextPath}/checkImg?time="
			+ new Date().getTime();
};

function findProductById(id){
	location.href="http://localhost:8080/Estore/ProductFindByIdServlet?id="+id;
};
function phone(obj) {
	location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
}
function tocart() {
	location.href="http://localhost:8080/Estore/showcart.jsp";
}
</script>
</head>
<body>
<div id="preloader" >
    <div id="status"></div>
</div>
<header>
    <nav class="navbar navbar-inverse" role="navigation">
    	 <div class="logo"></div>
        <a href="#">Home</a>
        <a href="javascript:void(0)" onclick="phone('Phone')">Phone</a>
        <a href="javascript:void(0)" onclick="phone('Pad')">Pad</a>
        <a href="javascript:void(0)" onclick="phone('Laptop')">Laptop</a>
        <a href="javascript:void(0)" onclick="phone('Components')">Components</a>
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

<!--登录注册-->
<div id="log-wrapper" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
     aria-hidden="true">
    <div class="modal-content modal-dialog" id="log-move">
        <canvas id="myCanvas"></canvas>
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span></button>
        <div id="log">
            <div id="navs-slider">
                <a id="#signin" class="active">Sign In</a>
                <a id="#signup">Sign Up</a>
                <span class="navs-slider-bar"></span>
            </div>
            
            
            <form id="sign-form-1" action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <div class="group-inputs">
                    <div class="username input-wrapper">
                        <input aria-label="username/email" placeholder="username/email" required="" type="text" value=""
                               name="username" id="signup-email_adress">
                    </div>
                    <div class="input-wrapper password">
                        <input required="" type="password" id="password-1" name="password" aria-label="password"
                               placeholder="password">
                        <span id="password_message-1"></span>
                    </div>
                    <div class="captcha input-wrapper" data-type="en">
                        <input id="captcha" name="captcha" placeholder="Code" required="" data-rule-required="true"
                               data-msg-required="Please input the Verification Code">
                        <img class="captcha-img" data-toggle="tooltip" data-placement="top" title="Not clear?Change it"
                             alt="Verification Code" src="${pageContext.request.contextPath}/checkImg" id="cimg" onclick="change()">
                    </div>
                </div>
                
                <div id="check-div">
                    <div class="Checkbox">
                        <input type="checkbox" id="remember" name="remember" value="on"/>
                        <label for="remember"></label><em>Remember Me</em>
                    </div>
                    <div class="Checkbox">
                        <input type="checkbox" id="autologin" name="autologin" value="on"/>
                        <label for="autologin"></label><em>Automatic Login</em>
                    </div>
                </div>
                
                <div class="sign-btn">
                    <button class="sign-button submit" type="submit">Sign In</button>
                </div>
            </form>
            <form id="sign-form-2" action="${pageContext.request.contextPath}/RegistServlet" method="post">
                <div class="group-inputs">
                    <div class="username input-wrapper">
                        <input aria-label="username" placeholder="username" required="" type="text" value=""
                               name="username">
                        <span id="username_message"></span>
                    </div>
                    <div class="email input-wrapper">
                        <input aria-label="email" placeholder="email" required="" type="text" value=""
                               name="email" id="email_adress">
                        <span id="email_message"></span>
                    </div>
                    <div class="input-wrapper password">
                        <input required="" type="password" id="password" name="password" aria-label="password"
                               placeholder="password(not less than 6 digits)">
                        <span id="password_message"></span>
                    </div>
                    <div class="input-wrapper password">
                        <input required="" type="password" id="repassword" name="repassword" aria-label="repeat password"
                               placeholder="repeat password">
                        <span id="repassword_message"></span>
                    </div>
                    <div class="captcha input-wrapper" data-type="en">
                        <input id="captcha-1" name="captcha" placeholder="Code" required="" data-rule-required="true"
                               data-msg-required="Please input the Verification Code">
                        <img class="captcha-img" data-toggle="tooltip" data-placement="top" title="Not clear?Change it"
                             alt="Verification Code" src="${pageContext.request.contextPath}/checkImg" id="cimg" onclick="change()">
                        <span id="checkcode_message"></span>
                    </div>
                </div>
                <div class="sign-btn">
                    <button class="sign-button submit" type="submit">Sign Up</button>
                </div>
            </form>
        </div>
    </div>
</div>
</div>
<!--登录注册END-->

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="home/img/3.png" alt="..." onclick="phone('Phone')">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="home/img/iphone_square_large.jpg" alt="..." onclick="phone('Laptop')">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="home/img/holiday_hero_subhead_2a_largetall.jpg" alt="..." onclick="phone('Phone')">
            <div class="carousel-caption">
            </div>
        </div>

        <div class="item">
        <img src="home/img/macbookpro_large.jpg" alt="..." onclick="phone('Phone')">
        <div class="carousel-caption">
        </div>
        </div>

        <div class="item">
            <img src="home/img/tile_macos_large.jpg" alt="..." onclick="phone('Phone')">
            <div class="carousel-caption">
            </div>
        </div>

    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<section class="sec1">
    <a><img src="home/img/8cbbaae5979d138dbc9e9616a06ba125.png" onclick="findProductById('26')"></a>
    <a><img src="home/img/387064f7e285263ac3ef81dd09baf5e4.png" onclick="findProductById('27')"></a>
    <a><img src="home/img/dd1c6b91990dee6177ad2ef4c1fb076e.png" onclick="findProductById('1')"></a>
    <a><img src="home/img/62f38e9081afaf20535678571aaf6b3b.jpg" onclick="findProductById('5')"></a>
</section>
<section class="sec2">
    <h3>Phone</h3>
    <a href="javascript:void(0)" onclick="phone('手机')">Phone</a>
    <div>
   		<c:set var="s" value="100"></c:set>
       	<c:forEach items="${pro1}" var="p" varStatus="vs" begin="0" end="4" step="1">
       		<c:if test="${fn:substring(p.c3code,0,2)=='51' }">
				<div class="product">
					<img src="upload/${p.imgurl}" onclick="findProductById('${p.id}')">
		      			<span class="brand">${p.name}</span>
		      			<span class="title">${p.description}</span>
		      			<span class="price">${p.price}</span>
		      			<a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
				</div>
      		</c:if>
		</c:forEach>
    </div>
</section>
<section class="sec2">
    <h3>Pad</h3>
    <a href="javascript:void(0)" onclick="phone('平板')">Pad</a>
    <div>
        <c:forEach items="${pro2}" var="p" varStatus="vs" begin="0" end="4" step="1">
        	<c:if test="${fn:substring(p.c3code,0,2)=='52' }">
				<div class="product">
					<img src="upload/${p.imgurl}" onclick="findProductById('${p.id}')">
        			<span class="brand">${p.name}</span>
        			<span class="title">${p.description}</span>
        			<span class="price">${p.price}</span>
        			<a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
				</div>
        	</c:if>
		</c:forEach>
    </div>
</section>
<section class="sec2">
    <h3>Laptop</h3>
   	<a href="javascript:void(0)" onclick="phone('笔记本')">Laptop</a>
    <div>
        <c:forEach items="${pro3}" var="p" varStatus="vs" begin="0" end="4" step="1">
        	<c:if test="${fn:substring(p.c3code,0,2)=='53' }">
				<div class="product">
					<img src="upload/${p.imgurl}" onclick="findProductById('${p.id}')">
        			<span class="brand">${p.name}</span>
        			<span class="title">${p.description}</span>
        			<span class="price">${p.price}</span>
        			<a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
				</div>
        	</c:if>
		</c:forEach>
    </div>
</section>
<section class="sec3">
    <h3>Components</h3>
    <a href="javascript:void(0)" onclick="phone('配件')">Components</a>
    <div class="wrap">
        <div class="slide">
            <ul>
                <c:forEach items="${pro4}" var="p" varStatus="vs" begin="0" end="4" step="1">
        			<c:if test="${fn:substring(p.c3code,0,2)=='54' }">
        			<li>
						<div class="product">
						<img src="upload/${p.imgurl}" onclick="findProductById('${p.id}')">
        				<span class="brand">${p.name}</span>
        				<span class="title">${p.description}</span>
        				<span class="price">${p.price}</span>
        				<a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
						</div>
					</li>
        			</c:if>
				</c:forEach>
      
            </ul>
            <ul>
                <c:forEach items="${pro4}" var="p" varStatus="vs" begin="0" end="4" step="1">
        			<c:if test="${fn:substring(p.c3code,0,2)=='54' }">
        			<li>
						<div class="product">
						<img src="upload/${p.imgurl}" onclick="findProductById('${p.id}')">
        				<span class="brand">${p.name}</span>
        				<span class="title">${p.description}</span>
        				<span class="price">${p.price}</span>
        				<a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
						</div>
					</li>
        			</c:if>
				</c:forEach>
                
            </ul>

        </div>
        <span class="wrap-left"></span>
        <span class="wrap-right"></span>
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
<script type="text/javascript" src="home/JS/jquery.min.js"></script>
<script type="text/javascript" src="home/JS/jquery-ui.js"></script>
<script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="home/JS/bg-canvas.js"></script>
<script type="text/javascript" src="home/JS/main.js"></script>
</body>
</html>