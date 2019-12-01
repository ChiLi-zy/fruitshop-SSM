<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
       
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	</head>
  
  <body>
<div id="menuContent" style="background-color:#173e65;color:#ffffff;height:100px;">
   <h1 style="margin-left: 10px;margin-top:10px;">
           水果网络销售平台</h1><br/>
     <div style="margin-left: 10px;">
     <a href="${pageContext.request.contextPath}/commodities/list.action">货物管理</a>|
     <a href="${pageContext.request.contextPath}/retailer/list.action?status=-1">零售商管理</a>|
     <a href="${pageContext.request.contextPath}/contract/list.action?type=-1">购销合同</a>|
     <a>用户设置</a></div>
</div>
<div style="background-color:#cccccc">
     <span style="margin-left: 10px;">欢迎您，${sessionScope.user[0].name}</span>
</div>
  </body>
</html>