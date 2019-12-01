<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	function validate(){
		if(document.getElementById("username").value==""){
		alert("用户户名不能为空！");
		document.getElementsById("username").focus();
		return false;
		}
		if(document.getElementById("password").value==""){
		alert("密码不能为空！");
		document.getElementById("password").focus();
		return false;
		}
		return true;
	}
	</script>
  </head>
  
  <body>
    <div id=content>
    <div id="form">
    <h1>用户登录</h1></br>
    <form action="user/login.action" method="post" id="myform" onsubmit="validate()">
    用户名：<input type="text"  id="username" name="userName" /><br/>
    密码：<input type="text" name="password" id="password" />
    <input type="submit" value="登录" />
    <a href="user/registerPage.action">注册</a>
    </form>
    <!-- 提示错误信息 -->
    <c:if test="${errorMsg!=null}"><font color="red">${errorMsg}</font></c:if>
    <!-- 提示信息 -->
    <c:if test="${noticeMsg!=null}"><font color="green">${noitceMsg}</font></c:if>
    </div>
    </div>
  </body>
</html>
