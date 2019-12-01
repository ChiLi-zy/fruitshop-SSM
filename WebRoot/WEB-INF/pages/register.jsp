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
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
	function validate(){
		if(document.getElementById("username").value()==""){
			alert("用户名不能为空!");
			document.getElementById("username").focus();
			return false;
		}
		if(document.getElementById("password").value()==""){
			alert("密码不能为空！");
			document.getElementById("password").focus();
			return false;
		}
		if(document.getElementById("name").valueOf()==""){
			alert("姓名不能为空！");
			document.getElementById("name").focus();
			return false;
		}
		if( document.getElementById("telephone").valueOf==""||!(/^1[34578]\d{9}$/.test(document.getElementById("telephone").value))){
			alert("手机号格式有误！请重新输入！");
			document.getElementById("telephone").focus();
			return false;
		}
		return true;
	}
	</script>
  </head>
  
  <body>
    <div id="content">
    <div>
    <h1>用户注册</h1><br/>
    <form action="user/register.action" method="post" id="myform">
    	用户名<input type="text" name="userName" id="username"/></br>
    	密码<input type="password" id="password" name="password"/></br>
    	姓名<input type="text" name="name" id="name"/></br>
    	手机号<input type="text" name="telephone" id="telephone"/><br/>
    	<input type="submit" value="注册"/>
    	<a href="user/toLogin.action">返回登录</a>
    </form>
    <!-- 显示错误信息 -->
    <c:if test="${errorMsg!=null}">
    	<font color="red">${errorMsg}</font>
    </c:if>
    </div>
    </div>
  </body>
</html>
