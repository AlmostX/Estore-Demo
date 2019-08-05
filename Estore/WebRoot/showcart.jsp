<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Cart</title>
	 <link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
   	 <link rel="stylesheet" type="text/css" href="home/CSS/main.css">

</head>
<body>

<script type="text/javascript">

/*1. 点击商品名称实现全选，全不选 		START */
function selectCk(main) {
	var flag = main.checked;

	var delCks = document.getElementsByName("delCk");

	for ( var i = 0; i < delCks.length; i++) {

		delCks[i].checked = flag;
	}
}
/* 1.点击商品名称实现全选，全不选 		END */


//*2.************点击+ —  实现对商品数量的操作id是商品的id，count,是要改变的数量.数量有赠有减，重点对数据的边界进行操作,此处应该来个666	START*****************
function changeCount(id, count, pnum) {

		//需要将count转换成数字
		count = parseInt(count);
		//控制边界
		if (count <= 0) {
			//删除
			var flag = window.confirm("Sure to delete the product?");
			if (flag) {
				count = 0;
			} else {
				count = 1;

			}
		} else if (count >= pnum) {
			alert("Maximum number of purchases" + pnum);
			count = pnum;
		}

		location.href = "${pageContext.request.contextPath}/ChangeCountServlet?id="
				+ id + "&count=" + count;
	};
	
	//*2.************点击+ —  实现对商品数量的操作id是商品的id，count,是要改变的数量.数量有赠有减，重点对数据的边界进行操作,此处应该来个666	START*****************	
	
	
	
	
	
  //3.键盘直接输入商品数量		START.......................

	function numberText(e) {
		var keyCode;
		if (e && e.preventDefault) {
			//判断是firefox浏览器
			keyCode = e.which;
		} else {
			//ie浏览器
			keyCode = window.event.keyCode;
		}
		//alert(keyCode);
		//0-9之间的键码值是48-57
		if (!(keyCode >= 48 && keyCode <= 57 || keyCode == 8)) {
			//阻止事件的默认行为
			if (e && e.preventDefault) {
				// e对象存在，preventDefault方法存在 ---- 火狐浏览器
				e.preventDefault();
			} else {
				// 不支持e对象，或者没有preventDefault方法 ---- IE
				window.event.returnValue = false;
			}

		}
	};
  //3.键盘直接输入商品数量		END.......................

	
	
	//4.删除商品---------
	function removeProduct(id) {
		var flag = window.confirm("Sure to delete the product?");

		if (flag) {
			//要删除
			location.href = "${pageContext.request.contextPath}/RemoveProductFromCartServlet?id="
					+ id;
		}
	}


	
	
	//5.批量删除START
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
	//5.批量删除END
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
	
	//点击购物车图片跳转到订单页面生成订单
	function createOrder(){
		location.href="order.jsp";
	}
	function tocart() {
		location.href="http://localhost:8080/Estore/showcart.jsp";
	}
	function phone(obj) {
		location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
	}



</script>

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
                    <input type="checkbox" id="remember" name="remember" value="on"/>
                    <label for="remember"></label><em>Remember Me</em>
                    <input type="checkbox" id="autologin" name="autologin" value="on"/>
                    <label for="autologin"></label> <em>Automatic Login</em>
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
<!--登录注册END-->



<c:if test="${ empty cart }">
No such product.
<div class="product-details" style="position:absolute">
	<div class="action">
		<a class="back" href="#" onclick="javascript:history.back(-1)">Back</a>
	</div>
</div>

</c:if>
 <!-- 购物车里有数据时的操作			START -->
<c:if test="${not empty cart}">
<section class="Carts">
    <div class="head">Products</div>
    <div class="title">
        <ul>
            <li>Select</li>
            <li>Message</li>
            <li>Parameter</li>
            <li>Unit Price</li>
            <li>Number</li>
            <li>Total Price</li>
            <li>Operate</li>
        </ul>
    </div>
    <ul class="carts-content">
    
	<c:set var="totalMoney" value="0" />
	<c:set var="totalCount" value="0" />
			
	<c:forEach items="${cart}" var="c">
      <%int num=(int)(Math.random()*10000);%>
        <ul>
            <li>
                <div class="Checkbox">
                    <input type="checkbox" id="<%=num %>"  name="delCk" value="${c.key.id}"	/>
                    <label for="<%=num %>"></label>
                    
                </div>
            </li>
            <li>
                <img src="upload/${c.key.imgurl}">
                <div class="carts-details">${c.key.description}</div>
            </li>
            <li>
                <ul class="carts-type">
                    <li><span>Color</span><a>${c.key.color}</a></li>
                    <li><span>Memory</span><a>64G</a></li>
                    <li><span>Version</span><a>联通4G/移动4G/电信4G</a></li>
                    <li><span>Regions</span><a>China</a></li>
                </ul>
            </li>
            <li><span class="price">${c.key.price }</span></li>
            <li>
            
                <div class="count-box">
                	<!-- 减少商品数量	START -->
                    <input class="min" name="" type="button" value="-"	onclick="changeCount('${c.key.id}','${c.value-1}')"/>
                	<!-- 减少商品数量	END -->
                	
                    <!-- 显示商品数量		START -->
                    <input class="text-box" name="" type="text" value="${c.value}"	onblur="changeCount('${c.key.id}',this.value,'${c.key.pnum}')"
						onkeydown="numberText(event)"/>
					<!-- 显示商品数量		END -->
                    <!-- 增加 商品数量	START-->
                    <input class="add" name="" type="button" value="+" onclick="changeCount('${c.key.id}','${c.value+1}','${c.key.pnum}')" />
                </div>
				
            </li>
            <li><span class="price">${c.key.price*c.value}</span></li>
            
            <li><a	href="javascript:void(0)" onclick="removeProduct('${c.key.id}')">Delete</a></li>
        </ul>
        
	      	<c:set var="totalMoney" value="${totalMoney+c.key.price*c.value}" />
	      	<c:set var="totalCount" value="${totalCount+c.value}"/>

		</c:forEach>  
      
 
        
    </ul>
    <div class="carts-foot">
        <ul>
            <li>
                <div class="Checkbox">
                    <input type="checkbox" id="all-select-1" value="on"	 href="javascript:void(0)" onclick="selectCk(this)"	/>
                    <label for="all-select-1"></label>
                </div>
                All
            </li>
            <li><a  onclick="delP();">Delete</a></li>
            <li>&nbsp;</li>
            <li>Number:<span class="count">${totalCount}</span></li>
            <li>Sum:<span class="price">${totalMoney}</span></li>
            <li><a class="sum"	onclick="createOrder()">Settlement</a></li>
        </ul>
    </div>
</section>
 </c:if>
 <!-- 购物车里有数据时的操作			END -->


<script type="text/javascript" src="home/JS/jquery.min.js"></script>
<script type="text/javascript" src="home/JS/jquery-ui.js"></script>
<script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="home/JS/bg-canvas.js"></script>
<script type="text/javascript" src="home/JS/main.js"></script>
</body>
</html>