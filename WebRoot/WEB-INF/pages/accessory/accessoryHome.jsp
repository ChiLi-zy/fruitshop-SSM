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
    
    <title>My JSP 'accessoryHome.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"></script>  
<script type="text/javascript">
	function showAddAccessory(flag){
	alert(flag);
		if(flag=="true"){
		$(".content").css("display","none");
		$(".addAccessoryMask").css("display","block");
		}else{
		$(".addAccessoryMask").css("display","none");
		}
	}
	
	function checkAll(obj){
		var isCheck=obj.checked;
		var checkList=document.getElementsByName("arrays");//获取所有check选项
		for(var i=0;i<checkList.length;i++){
		checkList[i].checked=isCheck;
		}
	}
	
	function deleteAccessory(){
		var myArray=new Array();
		var len=0;
		var fruitId=document.getElementById("aFruitId").value;
		var arrays=document.getElementsByName("arrays");//获取所有check选项
		for(var i=0;i<arrays.length;i++){
			if(arrays[i].checked){
				myArray[len++]=arrays[i].value;
			}
		}
		$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/accessory/deleteList.action',
		data:{"arrays":myArray,"fruitId":fruitId},//数据为id数组
		traditional:true,
		success:function(data){
			//成功后刷新界面
			alert("删除成功！");
			location.reload();
			}
		});
	}
</script>
  </head>
  
  <body>
      <div class="content">
    <button onclick="showAddAccessory('true')"style="background-color:#173e65;color:#ffffff;width:70px"> 
    添加
    </button>
    
     <button onclick="deleteAccessory()"
    style="background-color:#173e65;color:#ffffff;width:70px"
    >
    删除
    </button>

    <c:if test="${list!=null}">
    <table style="margin-top:10px;width:400px;text-align:center" border="1px">
    
    <tr>
    <td><input type="checkbox" onclick="checkAll(this)"/></td>
    <td>名称</td><td>价格</td>
    <td>创建日期</td>
    </tr>
    <c:forEach items="${list}" var="item" varStatus="status" >
    <tr>
    <td><input type="checkbox" name="arrays" value="${item.accessoryId}"/></td>
    <td>${item.name }</td><td>${item.price }</td>
    <td>${item.createTime}</td>
    </tr>
    </c:forEach>
    </table>
    </c:if>
    <c:if test="${list==null}">
    <b>结果为空！</b>
    </c:if>
    </div>
    
   
     <div class="addAccessoryMask" style="display:none">
    <div class="c">
    <div style="background-color:#173e65;height:20px;color:#fff;font-size:12px;padding-left:7px;">
    添加附属品
    <font style="float:right;padding-right:10px;" onclick="showAddAccessory('false')">x</font>
    </div>
    <form id="addAccessoryForm" action="accessory/add.action" method="post" onsubmit="checkAddAccessory()">
		名称：<input type="text" id="addAccessoryName" name="name" style="width:120px"/>    <br/>
		价格：<input type="text" id="addAccessoryPrice" name="price"style="width:120px"><br/>
		<input type="hidden" id="aFruitId" name="fruitId" value="${fruitId}"/>
		<input type="submit" value="添加" style="background-color:#173e65;color:#ffffff;width:70px;"/>
		
    </form>
    </div>
    </div>
    
  </body>
</html>
