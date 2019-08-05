<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Single Product Details</title>
<link rel="stylesheet" type="text/css" href="home/CSS/main.css">
<script type="text/javascript">
	function addProductToCart(id){
		
		location.href="${pageContext.request.contextPath}/AddProductToCartServlet?id="+id;
	}
</script>
</head>
<body>

<section class="w">
<div class="product-img">
    <div class="handle">
        <div class="thumb">
            <ul>
                <li class="n-hover">
                    <img src="upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="upload/${pro.imgurl }">
                </li>
                <li class="">
                    <img src="upload/${pro.imgurl }">
                </li>
            </ul>
        </div>
        <a class="arrow up i-icon"></a>
        <a class="arrow down i-icon"></a>
    </div>
    <div class="view">
        <img src="upload/${pro.imgurl }">
    </div>
</div>
<div class="product-details">
    <h1>${pro.description}</h1>
    <p class="re"><span>Product Number：</span><span>RE201612101843132</span></p>
    <p class="price" data-price="3649">
        <span>Price</span>
        <span class="price">${pro.price }</span>
    </p>
    <ul class="details">
        <li><span>Color</span><a class="u-check n-check">${pro.color }</a></li>
        <li><span>Memory</span><a class="u-check n-check">64G</a></li>
        <li><span>Version</span><a class="u-check n-check">联通4G/移动4G/电信4G</a></li>
        <li><span>Regions</span><a class="u-check n-check">China</a></li>
        <li><span>Number</span>
            <div class="count-box">
                    <input class="min" name="" type="button" value="-"/>
                    <input class="text-box" name="pnum" type="text" value="1"/>
                    <input class="add" name="" type="button" value="+"/>
                </div>
        </li>
    </ul>
    <div class="action">
        <a class="buy"	href="fastbuy.jsp">Fastbuy</a>    
       <a class="addCar" onclick="addProductToCart('${pro.id}')"><i></i>Add to cart</a>
       <a class="back" href="#" onclick="javascript:history.back(-1)">Back</a>
    </div>
</div>
</section>


<script type="text/javascript" src="home/JS/jquery.min.js"></script>
<script type="text/javascript" src="home/JS/jquery-ui.js"></script>
<script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="home/JS/bg-canvas.js"></script>
<script type="text/javascript" src="home/JS/main.js"></script>

</body>
</html>
