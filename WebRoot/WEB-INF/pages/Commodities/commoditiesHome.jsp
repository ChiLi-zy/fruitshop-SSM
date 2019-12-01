<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'commoditiesHome.jsp' starting page</title>
    
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
function editCommodities(id){
	var message="{'id':'"+id+"'}";
	alert("点我干啥？"+message);
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/commodities/editCommodities.action',
		contentType:'application/json;charset=utf-8',
		data:message,//数据格式为json
		success:function(data){
		$("#editName").val(data["name"]);
		$("#editPrice").val(data["price"]);
		$("#editlocality").val(data["locality"]);
		$("#fruitId").val(data["fruitId"]);
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
function deleteCommodities(id){
  if(window.confirm("你确定要删除用户"+name+"吗？")){
	$("#dFruitId").val(id);//向form表单中引入id
	$("#dName").val(name);
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

function checkAddCommodities(){
	if($("#addName").val()==null||$("#addName").val()==""){
		alert("水果名不能为空！");
		return false;
	}
	if($("#addPrice").val()==null||$("#addPrice").val()==""){
		alert("价格不能为空！");
		return false;
	}
	if($("#addLocality").val()==null||$("#addLocality").val()==""){
		alert("请输入产地！");
		return false;
	}
}

function openwin(id){
/* alert('${pageContext.request.contextPath}'); */

	var url="${pageContext.request.contextPath}/accessory/list.action?fruitId="+id;
	window.open(url,"附属品","height=400,width=700,scrollbars=yes");/* scrollbars=yes表示滚动条 */
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
${Msg}
<%@ include file="../menu.jsp" %><br/>
    
     <!-- 添加弹出框 -->
<div class="addMask">
<div class="c">
<div style="background-color:#173e65;height:20px;color:#fff;font-size:12px;paddnig-left:7px;">
添加信息
<font style="float:right;padding-right:10px;" onclick="showAddMask('false')">x</font>
</div>
<form action="commodities/add.action" method="post" id="addForm" onsubmit="return checkAddCommodities()">
名称：<input type="text" id="addName" name="name" style="width:120px"/><br/>
价格：<input type="number" name="price" id="addPrice"min="0.0" step="0.1" style="width:120px"/><br/>
产地：<input type="text" id="addLocality" name="locality" style="width:120px"/><br/>
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
 <form id="editForm" action="commodities/edit.action" method="post">
 名称：<input type="text" id="editName" name="name" style="width:120px"/><br/>
 价格：<input type="text" id="editPrice" name="price" style="width:120xp"/><br/>
 产地：<input type="text" id="editlocality" name="locality" style="width:120px"/><br/>
 
 <input type="hidden" name="fruitId" id="fruitId"/>
 <input type="hidden" name="status" id="editStatus"/>
 <input type="hidden" name="startPage" id="eStartPage"/>
 <input type="hidden" name="currentPage"id="eCurrentPage"/>
 <input type="hidden" name="pageSize"id="ePageSize"/>
 <input type="submit" value="提交" style="background-color:#173e65;color:#ffffff;width:70px;"/>
   </form>
 </div>
</div>      
    
 <div class="content">
<form id="listForm" action="commodities/list.action" method="post">
   名称：<input type="text" name="name" style="width:120px" value="${commodities.name}"/>
   产地：<input type="text" name="locality" style="width:120px" value="${commodities.locality}"/>
   价格：<input type="number" name="startPrice" id="price1"min="0.0" step="0.1" value="${startPrice}"/>-<input type="number" id="price2" min="0.0" step="0.1" name="endPrice"/><br/><br/>
   创建日期：<input type="datetime-local" name="startTime" value="${startTime}"/>-<input type="datetime-local" name="endTime" value="${endTime}"/>
<input type="submit" value="搜索" style="background-color:#173e65;color:#ffffff;width:70px;"/><br/>
<!-- 显示错误信息 -->
<c:if test="${errorMsg}">
<font color="red">${errorMsg}</font><br/>
</c:if>
<input type="hidden" name="startPage" id="startPage" value="${startPage}"/>
<input type="hidden" name="currentPage" id="currentPage" value="${currentPage }"/>
<input type="hidden" name="pageSize" id="pageSize" value="${pageSize}"/>
<input type="hidden" name="sumPageNumber" id="sumPageNumber" value="${sumPageNumber}"/>
<input type="hidden" name="countNumber" value="${countNumber}" id="countNumber"/>   
   </form>
    <hr style="margin-top:10px"/>
  <button onclick="showAddMask('true')"style="background-color:#173e65;color:#ffffff;width:70px;">添加</button>   
   <!-- 内容显示 -->
   <c:if test="${list!=null }">
   <table style="margin-top:10px;width="700px;text-align:center;" border=1>
   <tr>
   <td>序号</td>
   <td>姓名</td>
   <td>价格</td>
   <td>产地</td>
   <td>创建日期</td>
   <td>操作</td>
   </tr>
   <c:forEach items="${list}" var="item" varStatus="status" >
   <tr>
   <td>${status.index+1}</td>
   <td>${item.name}</td>
   <td>${item.price}</td>
   <td>${item.locality }</td>
   <td>${item.createTime}</td>
   <td><a onclick="editCommodities('${item.fruitId}')">编辑</a>|<a onclick="deleteCommodities('${item.fruitId}','${item.name }')">删除</a>|<a onclick="openwin('${item.fruitId}')">附属品</a>
   <form id="deleteForm" action="commodities/delete.action" method="post">
   <input type="hidden" name="fruitId" id="dFruitId"/>
   <input type="hidden" name="name" id="dName"/>
   <input type="hidden" name="startPage" id="dStartPage"/>
   <input type="hidden" name="currentPage"id="dCurrentPage"/>
   <input type="hidden" name="pageSize" id="dPageSize"/>
   </form>
   
   </td>
   </tr>
   </c:forEach>
   </table>
   </c:if>
   <c:if test="${list==null}">
   <b>搜索结果为空！</b>
   </c:if>
   <div style="margin-top:10px;">
   <a onclick="toPrePage()">上一页</a>  &nbsp&nbsp&nbsp<a onclick="toNextPage()">下一页</a>
   <input type="text" id="pageNumber" style="width:50px"/>
   <button onclick="toLocationPage()">go</button>
   <div id="pageInfo"></div>
   </div>
   </div>
  </body>
</html>
