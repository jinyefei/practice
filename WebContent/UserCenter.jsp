<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.qianfeng.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<style>
	#page{width:900px;margin: auto;border: 1px solid #e8e6e6;}
	a{text-decoration: none;}
	a:link{color:black}
	a:visited{color:black}
	a:hover{color:darkgray}
	a:active{color:red}
	body{margin:0px;padding:0px}
	
	#logoleft{float: left;}
	#logoright{float:right;padding-right: 30px;padding-top: 30px;}
	#logoright a{margin: 0 5px;}
	#line{border-bottom:1px solid #e8e6e6}
	
	td{height:50px;line-height:50px;border-bottom:1px solid  #e8e6e6;text-align:center;font-size:12px}
	.clear{clear:both}
</style>

<script>
window.onload = function(){
	//====全选和全不选的实现===
	var checkall=document.getElementById("checkall");
	var checkones = document.getElementsByName("checkone");
	checkall.onchange = function(){
		if(checkall.checked==true){
			for(var i=0;i<checkones.length;i++){
				checkones[i].checked = true;
			}
		}else{
			for(var i=0;i<checkones.length;i++){
				checkones[i].checked = false;
			}
		}
	}
	
	for(var i=0;i<checkones.length;i++){
		checkones[i].onchange = function(){
			var flag = true;
			//当checkone发生状态变化时校验所有的checkone是否是全选中或全不选中，然后改变checkall的选中状态。
			for(var j=0;j<checkones.length;j++){
				if(checkones[j].checked!=true){
					flag = false;
				}
				if(flag){
					checkall.checked = true;
				}else{
					checkall.checked = false;
				}
			}
			
		}
	}
}
</script>
</head>
<body >
	
   <div id="page">
   
   	<div id="logoleft">
				<img src="images/img/mylogo.png" />
			</div>
			<div id="logoright">
				<c:if test="${!empty user}">
					欢迎您，${user.username }！
					<a href="${pageContext.request.contextPath }/quitLoginServlet">注销</a>
				</c:if>
				<c:if test="${empty user}">
					<a href="${pageContext.request.contextPath }/login.jsp">登录</a>
					<a href="${pageContext.request.contextPath }/newregister.jsp">注册</a>
				</c:if>
					<a href="${pageContext.request.contextPath }/showAllProductServlet">首页</a>
					<a href="${pageContext.request.contextPath}/addShoppingCarServlet?pid=${product.pid}&uid=${user.uid }">购物车</a>
			</div>
			<div class="clear"></div>
   
   		<div id="line"></div>
		<p style="font-size:30px;text-align:center;color: #ccccff;"><b>欢迎光临本店！ 你的满意，我的安心</b></p>
		<form  name="form1" action="" method="post">
		<table width="100%" cellpadding="0px" cellspacing="0px" style="padding:0px;border-top:1px solid #e8e6e6;" >
		
		<tr><td >订单号</td><td >下单时间</td><td>收货人</td><td>收件地址</td><td>联系方式</td><td>订单状态</td><td>查看订单</td><td>全选<input type="checkBox" name="checkall" id="checkall"/></td></tr>
		
 		<c:forEach items="${orderdetailsList}" var="Orderdetails">
			<tr>
			<td >${Orderdetails.oid}</td>
			<td>${Orderdetails.ordertime}</td>
			<td>${Orderdetails.buyername}</td>
			<td>${Orderdetails.addr}</td>
			<td>${Orderdetails.telephone}</td>
			<td>${Orderdetails.state}</td>
			<td><a href="${pageContext.request.contextPath}/manyProductByOidServlet?oid=${Orderdetails.oid}">查看订单</a></td>
			<td><input type="checkBox" name="checkone" value="${Orderdetails.oid}"></td></tr> 
		</c:forEach>
 		<tr><td colspan="6"> </td>
 		<td ><input type="submit" value="删除订单"  onclick="javascript:form1.action='${pageContext.request.contextPath}/deleteOrderServlet?username=${user.username }'"/></td>
 		 <td><input type="submit" value="立即支付"  onclick="javascript:form1.action='${pageContext.request.contextPath}/PayMonoeyServlet'"/></td>
 		
 		</tr>
 		
		
		</table>
		</form>
		</div>
</body>
</html>