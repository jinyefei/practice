<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.qianfeng.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
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
	
	td{height:50px;line-height:50px;border-bottom:1px solid  #e8e6e6;text-align:center}
	
	#buy{padding:5px 26px;background:#ffdfdf;border:1.5px solid  #ff1752;}
	#add{padding:5px 18px;background:#ff1752;border:1.5px solid  #ff1752;}
	#buy{line-height:20px;color:#ff1752;font-size:16px}
	#add font{line-height:35px;color:white}
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
					<a href="${pageContext.request.contextPath}/manyOrderByUserServlet?username=${user.username}" >订单中心</a>
				</c:if>
				<c:if test="${empty user}">
					<a href="${pageContext.request.contextPath }/login.jsp">登录</a>
					<a href="${pageContext.request.contextPath }/newregister.jsp">注册</a>
				</c:if>
					<a href="${pageContext.request.contextPath }/showAllProductServlet">首页</a>
					
			</div>
			<div class="clear"></div>
   
   		<div id="line"></div>
		<p style="font-size:30px;text-align:center;color: #ccccff;"><b>欢迎光临本店！ 你的满意，我的安心</b></p>
		<form  name="form1" action="" method="post">
		<table width="100%" cellpadding="0px" cellspacing="0px" style="padding:0px;border-top:1px solid #e8e6e6;" >
		
		<tr><td >商品图</td><td>商品名称</td><td>商场价格</td><td>门店价格:</td><td>购买数量:</td><td>订单价格:</td><td>&nbsp;&nbsp;&nbsp;&nbsp;全选<input type="checkBox" name="checkall" id="checkall"/></td></tr>
		
		<% Map<Product,Integer> map=(Map)session.getAttribute("map");
  		if(map==null){
   			  out.println("温馨提示：您购物车为空!!!");
    	 return ;
 		 }
 		 Set<Product> key=map.keySet(); %>
  		
 		<c:forEach items="${map.keySet()}" var="product">
			<tr>
			<td ><img style="width:50px;height:50px;text-align:center" src="${pageContext.request.contextPath}/images/${product.pimage }"/></td>
			<td>${product.pname }</td><td>${product.market_price }</td><td>${product.shop_price }</td><td>${map.get(product)}</td><td>${product.shop_price }</td>
			<td><input type="checkBox" name="checkone" value="${product.pid}"></td></tr> 
		</c:forEach>
        <% 
  	//  计算总金额 sums
  	  	double sums=0;
  		 for(Product product:key){
  		sums=sums+product.getShop_price()*map.get(product);
        }
  		session.setAttribute("sums",sums);   
 			%>
 		<tr><td colspan="6" style="text-align:right;padding-right:15px">总价：<%=sums %>元</td>
 		<td ><input type="submit" value="删除"  onclick="javascript:form1.action='${pageContext.request.contextPath}/deleteAllCarProductServlet?uid=${user.uid }'"/></td>
 		</tr>
 		
		<tr>
		<td ></td>
		
		<td colspan="5" style="text-align:right">
				<div id="buy_add">
				<a id="add" href="${pageContext.request.contextPath}/showAllProductServlet" >
					<font >我再逛逛</font></a>
						&nbsp;&nbsp;&nbsp;&nbsp;
			 
					<input id="buy" type="submit" value="立即下单" onclick="javascript:form1.action='${pageContext.request.contextPath}/createOrderServlet?uid=${user.uid}'"/>
 					
					
				</div>
				<div class="clear"></div>
		</td>
		<td ></td>
		</tr>
		</table>
		</form>
		</div>
</body>
</html>