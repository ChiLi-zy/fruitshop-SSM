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
    
    <title>My JSP 'retailerHome.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
*{
	margin:0;padding:0;
}
#menuContent a{
	text-decoration:none;
	color:#ffffff;
	}
</style>
<script type="text/javascript">
function changeStatus(){
	var status=document.getElementById("indexStatus").valueOf();
	document.getElementById("status").value=status;
}
function init(){
	var countNumber=document.getElementById("countNumber").value;
	var sumPage=document.getElementById("sumPageNumber").value;
	var currentPage=document.getElementById("currentPage").value;
	var info="一共<font color='blue'>"+countNumber+"</font>条数据，"+"共<font color='blue'>"+sumPage+"</font>页，"+
	"当前第<font color='blue'>"+currentPage+"</font>页，";
	document.getElementById("pageInfo").innerHTML=info;
}
function toPrePage(){
	var currentPageObject=document.getElementById("currentPage");
	var currentPage=parseInt(currentPageObject.value);
	if(currentPage==1){
		alert("数据已经到顶！");
	}else{
		currentPageObject.value=currentPage-1;
		var PageSize=parseInt(document.getElementById("pageSize").value);
		var startPageObject=document.getElementById("startPage");
		startPageObject.value=parseInt(startPageObject.value)-PageSize;
		document.getElementById("listForm").submit();
	}
}
function toNextPage(){
	var currentPageObject=document.getElementById("currentPage");
	var currentPage=parseInt(currentPageObject.value);
	var sumPage=parseInt(document.getElementById("sumPageNumber").value);
	if(currentPage>=sumPage){
		alert("数据已经到底！");
	}else{
		currentPageObject.value=currentPage+1;
		var pageSize=parseInt(document.getElementById("pageSize").value);
		var startPageObject=document.getElementById("startPage");
		startPageObject.value=parseInt(startPageObject.value)+pageSize;
		document.getElementById("listForm").submit();
	}
}

function toLocationPage(){
	var pageNumber=document.getElementById("pageNumber").value;
	var currentPageObject=document.getElementById("currentPage");
	var currentPage=currentPageObject.value;
	if(pageNumber==null||pageNumber==""){
		alert("请输入需要跳转得页数！");
	}else{
		pageNumber=parseInt(pageNumber);
		var sumPage=parseInt(document.getElementById("sumPageNumber").value);
		if(pageNumber<1){
			alert("数据已经到顶！");
		}else if(pageNumber>sumPage){
			alert("数据已经到底！");
		}else{
			currentPageObject.value=pageNumber;
			var pageSize=parseInt(document.getElementById("pageSize").value);
			var startPageObject=document.getElementById("startPage");
			if(pageNumber>currentPage){
				startPageObject.value=parseInt(startPageObject.value)+pageSize;
			}else if(pageNumber<currentPage){
				startPageObject.value=parseInt(startPageObject.value)-pageSize;
			}
			document.getElementById("listForm").submit();
		}
	}
}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.4.4.min.js"></script>  
<script type="text/javascript">
function editRetailer(id){
	var message="{'id':'"+id+"'}";
	alert("点我干啥？"+message);
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/retailer/editRetailer.action',
		contentType:'application/json;charset=utf-8',
		data:message,//数据格式为json
		success:function(data){
		$("#editName").val(data["name"]);
		$("#editTelphone").val(data["telphone"]);
		$("#editAddress").val(data["address"]);
		$("#retailerId").val(data["retailerId"]);
		$("#editStatus").val(data["status"]);
		$("#eStatus").val(data["status"]);
		//显示一个弹出框
		$(".mask").css("display","block");
		$(".content").css("display","none");
		//引入分页信息到form表单
		$("#eStartPage").val($("#startPage").val());
		$("#eCurrentPage"),val($("#currentPage").val());
		$("#ePageSize").val($("#pageSize").val());
		}
	});
}
function cancelEdit(){
	$(".mask").css("display","none");
	$(".content").css("display","block");
}
function changeEditStatus(){
	var status=document.getElementById("editStatus").value;
	document.getElementById("eStatus").vallue=status;
}
</script>
<!-- 删除 -->
<script type="text/javascript">
function deleteRetailer(id){
  if(window.confirm("你确定要删除用户"+name+"吗？")){
	$("#dRetailerId").val(id);//向form表单中引入id
	$("#dStartPage").val($("#startPage").val());
	$("#dCurrentPage").val($("#currentPage").val());
	$("#dPageSize").val($("#pageSize").val());
	$("#deleteForm").submit();//提交表单
  }
}
</script>
<!-- 添加 -->
<script type="text/javascript">
function showAddMask(flag){
alert("你看看---"+flag);
	if(flag=="true"){
	$(".content").css("display","none");
	$(".addMask").css("display","block");
	}else{
	$(".content").css("display","block");
	$(".addMask").css("display","none");
	}
}

function checkAddRetailer(){
	if($("#addName").val()==null||$("#addName").val()==""){
		alert("用户名不能为空！");
		return false;
	}
	if($("#addTelphone").val()==null||$("#addTelphone").val()==""){
		alert("手机号不能为空！");
		return false;
	}
	 var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
	 if(!myreg.test($("#addTelphone").val())){
	 	alert("请输入正确的手机号码！");
	 	return false;
	 }
	if($("#addAddress").val()==null||$("#addAddress").val()==""){
		alert("请输入地址");
		return false;
	}
}
</script>

<style type="text/css">
.c{
	border-style:solid;width:250px;height:150px;
	margin:4 23 0 23;border-radius:5;display:block;
	background:#fff;margin:10% auto;
}
.mask{
	width:100%;height:100%;position:"absolute";background:rgba(0,0,0,.3);
	display:none;
}
.addMask{
	width:100%;height:100%;position:"absolute";background:rgba(0,0,0,.3);
	display:none;
}
</style>
  </head>
 <body onload="init()">
  <%@ include file="../menu.jsp" %><br/>
 <!-- 添加弹出框 -->
<div class="addMask">
<div class="c">
<div style="background-color:#173e65;height:20px;color:#fff;font-size:12px;paddnig-left:7px;">
添加信息
<font style="float:right;padding-right:10px;" onclick="showAddMask('false')">x</font>
</div>
<form action="retailer/add.action" method="post" id="addForm" onsubmit="return checkAddRetailer()">
姓名：<input type="text" id="addName" name="name" style="width:120px"/><br/>
手机：<input type="text" id="addTelphone" name="telphone" style="width:120px"/><br/>
地址：<input type="text" id="addAddress" name="address" style="width:120px"/><br/>
<input type="hidden" name="status" value="1"/>
<input type="submit" value="添加" style="background-color:#173e65;color:#ffffff;width:70px;"/>
</form>
</div>
</div>

<!--编辑弹出框 -->        
<div class="mask">
<div class="c">
<div style="background-color:#173e65;height:20px;color:#fff;font-size:12px;padding-left:7px;">
   修改信息<font style="float:right;padding-right:10px;" onclick="cancelEdit()">x</font></div>
 <form id="editForm" action="retailer/edit.action" method="post">
 姓名：<input type="text" id="editName" name="name" style="width:120px"/><br/>
 手机：<input type="text" id="editTelphone" name="telphone" style="width:120xp"/><br/>
 地址：<input type="text" id="editAddress" name="address" style="width:120px"/><br/>
 状态：<select id="eStatus" name="status" onchange="changeEditStatus()">
 <option value="1">启用</option>
 <option value="0">停用</option>
 </select><br/>
 <input type="hidden" name="retailerId" id="retailerId"/>
 <input type="hidden" name="status" id="editStatus"/>
 <input type="hidden" name="startPage" id="eStartPage"/>
 <input type="hidden" name="currentPage"id="eCurrentPage"/>
 <input type="hidden" name="pageSize"id="ePageSize"/>
 <input type="submit" value="提交" style="background-color:#173e65;color:#ffffff;width:70px;"/>
   </form>
 </div>
</div>      

<!--删除弹出框  --> 
<form action="retailer/delete.action" id="deleteForm" method="post">
	<input type="hidden" name="retailerId" id="dRetailerId"/>
	<input type="hidden" name="startPage" id="dStartPage"/>
	<input type="hidden" name="currentPage" id="dCurrentPage"/>
	<input type="hidden" name="pageSize" id="dPageSize"/>
</form>

<!-- 内容 显示-->
  <!-- 搜索 -->
  <div class="content">
    <form id="listForm"action="retailer/list.action"method="post">
  姓名：<input type="text" name="name" style="width:120px"/>
    电话：<input type="text" name="telphone" style="width:120px"/>
      地址：<input type="text" name="address" style="width:120px"/><br/><br/>
        状态：<select id="indexStatus" name="status" onchange="changeStatus()">
        <option value="-1" selected="selected">全部</option>
        <option value="1">启用</option>
        <option value="0">停用</option>
        </select>
        <!-- <input type="hidden" name="status" id="status" value="-1"/> -->
          创建日期：<input type="datetime-local" name="startTime" value="${startTime}"/>-<input type="datetime-local" name="endTime" value="${endTime}"/>
          <input type="submit" value="搜索" style="background-color:#173e65;color:#ffffff;width:70px;"/>
       
        
          <!-- 显示错误信息 -->
          <c:if test="${errorMsg}">
          	<font color="red">${errorMsg}</font><br/>
          </c:if>
          
          <input type="hidden" name="startPage" id="startPage" value="${startPage}"/>
          <input type="hidden" name="currentPage" id="currentPage" value="${currentPage}"/>
          <input type="hidden" name="pageSize" id="pageSize" value="${pageSize}"/>
          <input type="hidden" name="sumPageNumber" id="sumPageNumber" value="${sumPageNumber}"/>
          <input type="hidden" name="countNumber" id="countNumber" value="${countNumber}"/>  
</form>
  <hr style="margin-top:10px"/>
  <button onclick="showAddMask('true')"style="background-color:#173e65;color:#ffffff;width:70px;">添加</button>   
  <!-- 内容显示 -->
  <c:if test="${list!=null}">
  <table style="margin-top:10px;width:700px;text-align:center;" border=1>
  <tr>
  <td>序号</td>
  <td>姓名</td>
  <td>手机号</td>
  <td>地址</td>
  <td>状态</td>
  <td>创建日期</td>
  <td>操作</td>
  </tr>
  <c:forEach items="${list}" var="item" varStatus="status">
  <tr>
  <td>${status.index+1}</td>
  <td>${item.name}</td>
  <td>${item.telphone}</td>
  <td>${item.address}</td>
  <td>
  <c:if test="${item.status==1}">
  <font color="blue">启用</font>
  </c:if>
  <c:if test="${item.status==0}">
  <font color="red">停用</font>
  </c:if>
  </td>
  <td>${item.createTime}</td>
  <td><a style="cursor:pointer" onclick="editRetailer('${item.retailerId}')">编辑</a>|<a style="cursor:pointer" onclick="deleteRetailer('${item.retailerId}','${item.name}')">删除</a></td>
  </tr>
  </c:forEach>
  </table>
  </c:if>
  <c:if test="${list==null}">
   <b>搜索结果为空！</b>
   </c:if>
  
  <div style="margin-top:10px">
  <a style="cursor:pointer"onclick="toPrePage()">上一页</a> &nbsp&nbsp&nbsp<a style="cursor:pointer"onclick="toNextPage()">下一页</a>
  <input type="text" id="pageNumber" style="width:50px"/><button onclick="toLocationPage()">go</button>
  <dir id="pageInfo"></dir>
  </div>
  </div>
  </body>
</html>
