<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册成功3秒后跳转</title>
<meta http-equiv="refresh" content="3;url=http://localhost:8080/Estore">
</head>
<body>
<h1>
		Registration success.Jump into <a href='http://localhost:8080/Estore'>Home</a> after <span id="s">3</span> seconds
</h1>
<script type="text/javascript">
	var interval;
	window.onload = function() {
		interval = window.setInterval("fun()", 1000); //设置1秒调用一次fun函数
	};

	function fun() {
		var time = document.getElementById("s").innerHTML;

		//判断如果等于0了，不在进行调用fun函数，
		if (time == 0) {
			window.clearInterval(interval);
			return;
		}

		document.getElementById("s").innerHTML = (time - 1);
	}
</script>

</body>
</html>