<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
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
   <form action="user/findUser.action" method="post">
               用户姓名：<input type="text" name="name" /></br>
        <input type="submit" value="查询">
    </form>
    <table width="300px;" border=1>  
    <tr>  
      <td>序号</td>
      <td>姓名</td>  
      <td>账号</td>    
      <td>电话</td> 
   </tr>  
   <c:forEach items="${userList}" var="fruit" varStatus="status">  
     <tr>  
       <td>${status.index+1}</td>  
       <td>${fruit.name }</td>  
       <td>${fruit.username }</td>    
       <td>${fruit.telphone}</td>  
     </tr>  
    </c:forEach>  
   </table>
  </body>
</html>
