<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
 <title>My JSP 'index.jsp' starting page</title>
 <script type="text/javascript">
 function cancel() {
	window.location="index.jsp";
}
function modify() {
	document.getElementById("modif").submit();
}
 </script>
 </head>
  <body>
	<form action="${pageContext.request.contextPath}/UserUpdateServlet" method="post" encType="multipart/form-data" id="modif">
		<input type="hidden" name="id" value="${user.id}">
		
		Name:<input type="text" name="username" value="${user.username}"><br>
		Password:<input type="password" name="password" value="${user.password}"><br>
		Email:<input type="text" name="email" value="${user.email}"><br>
		<input type="button" value="修改" onclick="modify()">
		<input type="button" value="取消" onclick="cancel()">
	</form>
<script type="text/javascript" src="CategoryJS/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="CategoryJS/onloada.js"></script>
	
</body>
</html>
