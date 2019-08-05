<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="home/CSS/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="home/CSS/main.css">
<script type="text/javascript">
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
function del(id) {

	var flag = window.confirm("Sure to delete?");

	if (flag) {
		//确认删除
		location.href = "${pageContext.request.contextPath}/ProductDelByIdServlet?id="
				+ id;
	}
};

function change() {
	//1.得到id为main的这个checkbox
	var main = document.getElementById("main");

	var flag = main.checked;

	//2.得到所有name=ck的checkbox
	var cks = document.getElementsByName("ck");

	//3.将cks中所有的checkbox的checked值设置为flag
	for ( var i = 0; i < cks.length; i++) {
		cks[i].checked = flag;
	}
};

function sendDel(){
	var flag = window.confirm("Sure to delete?");

	if (flag) {
		//确认删除
		document.getElementById("f").submit();//表单提交
	}
	
	var cks = document.getElementsByName("ck");
	
};

function sel() {
	var msg = document.getElementById("msg").value;
	if(msg==null||msg=="")
		alert("Input the message you want to search！！！");
	document.getElementById("s").submit();
	
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

<div  align=center>


	<c:if test="${empty pro}">
		No product message.<br>
		<a href="${pageContext.request.contextPath}/CategoryServlet">Add</a>
	</c:if>
	
	<c:if test="${not empty pro}">
			<form display="block" class="form-horizontal" action="${pageContext.request.contextPath}/ProductSimpleServlet" method="post" id="s">
			<select name="field" width="200px">
				<option disabled="disabled">Please select a condition</option>
				<option value="name">Query by product name</option>
				<option value="description">Query by product description</option>
			</select>
			<br>
			<input width=100px type="text" name="msg" id="msg">
			<input width="200px" type="button" value="search" onclick="sel()">
			</form>
		<br>
		<form action="${pageContext.request.contextPath}/ProductDelSelectServlet" method="post" id="f">
			<table border="1" align="center" width="85%" style="text-align:center">
				<tr>
					<td><input type="checkbox" id="main" onclick="change();">
					</td>
					<td>ID</td>
					<td>Name</td>
					<td>Price</td>
					<td>Number</td>
					<td>Category</td>
					<td>Color</td>
					<td>Picture</td>
					<td>Description</td>
					<td>Operate</td>
				</tr>

				<c:forEach items="${pro}" var="p">
					<tr>
						<td><input type="checkbox" value="${p.id}" name="ck"></td>
						<td>${p.id }</td>
						<td>${p.name}</td>
						<td>${p.price }</td>
						<td>${p.pnum }</td>
						<td>${p.c3code }</td>
						<td>${p.color }</td>
						<td height="260" width="300"><img alt="The picture is not exist or has already been deleted." src="upload/${p.imgurl}" width="300" height="260"></td>
						<td>${p.description }</td>
						<td><a
							href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}">Edit</a>

							&nbsp;<a href="javascript:void(0)" onclick="del('${p.id}')">Del</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="9"><a href="javascript:void(0)" onclick="sendDel();">Delete the choose one</a></td>
					<td><a href="${pageContext.request.contextPath}/CategoryServlet">Add</a>
					</td>
				</tr>
			</table>
		</form>
	</c:if>
</div>	
	
	

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