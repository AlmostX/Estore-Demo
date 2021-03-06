<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>product</title>
<link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="home/CSS/main.css">
<script type="text/javascript">
function phone(obj) {
	location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
}
function change() {
	document.getElementById("cimg").src = "${pageContext.request.contextPath}/checkImg?time="
			+ new Date().getTime();
}
function findProductById(id){
	location.href="http://localhost:8080/Estore/ProductFindByIdServlet?id="+id;
}
function showck(obj) {
	location.href="http://localhost:8080/Estore/ProductFindByPageCodeServlet?code="+obj;
}
function tocart() {
	location.href="http://localhost:8080/Estore/showcart.jsp";
}
</script>
</head>
<body>
<div id="preloader" >
    <div id="status" ></div>
</div>
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

<section class="page">
    <aside id="aside" class="panel-group aside-menu">
        <h3 class="type">${c1name }</h3>
        <c:forEach items="${c2name}" var="p" varStatus="vs">
        	<dl class="panel panel-default">
            <dt data-toggle="collapse" data-target=".${vs.index}" aria-expanded="true" data-parent="#aside" onclick="selsct(${p.code},${vs.index})">
                <i></i><span class="collapse-btn">${p.name }</span>
            </dt>
            <div class="${vs.index} collapse" id="${vs.index}">
               
            </div>
        	</dl>
        </c:forEach>
    </aside>

    <div class="content">
        <c:forEach items="${pb1.pro}" var="p" varStatus="vs">
				<div class="product">
					<img src="upload/${p.imgurl}" onclick="findProductById('${p.id}')">
        			<span class="brand">${p.name}</span>
        			<span class="title">${p.description}</span>
        			<span class="price">${p.price}</span>
        			<a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
				</div>
		</c:forEach>
    </div>
    <ul class="pagination">
        <li><a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=1&currentPage=${pb1.currentPage}">First</a></li>
		<li><c:if test="${pb1.pageNum==1}"><a>Prev</a></c:if></li>
		<li><c:if test="${pb1.pageNum!=1}"><a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=${pb1.pageNum-1}&currentPage=${pb1.currentPage}">Prev</a></c:if></li>
		<c:if test="${pb1.pageNum==pb1.totalPage}"><li><a>Next</a></li><li><a>Last</a></li></c:if>
		<li><c:if test="${pb1.pageNum!=pb1.totalPage}">
			<a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=${pb1.pageNum+1 }&currentPage=${pb1.currentPage}">Next</a>
			<a href="${pageContext.request.contextPath}/ProductFindByPageCodeServlet?pageNum=${pb1.totalPage }&currentPage=${pb1.currentPage}">Last</a>
		</c:if></li>
    </ul>
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
<script type="text/javascript" src="CategoryJS/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="CategoryJS/onloada.js"></script>
</body>
</html>