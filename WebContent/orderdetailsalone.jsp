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
	#can{padding:5px 18px;background:#ff1752;border:1.5px solid  #ff1752;}
	#buy{line-height:20px;color:#ff1752;font-size:16px}
	#can font{line-height:35px;color:white}
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
<script>
			function check(){
			var r1=checkName('name','收货人不能为空');
			var r2=checkAddr('addr','收货地址不能为空');
			var r3=checkPhone('phone','联系电话不能为空');
			if(r1&&r2&&r3){
				return true;
			}else{
				return false;
			}
			}
			function checkName(id,info){
				var span=document.getElementById(id+"_span");
				span.innerHTML="";
				var ele=document.getElementById(id);
				if(ele.value==""){
					span.innerHTML="<font style='color:red;font-size:12px;'>"+info+"</font>";
					return false;
				}
				return true;
			}
			function checkAddr(id,info){
				var span=document.getElementById(id+"_span");
				span.innerHTML="";
				var ele=document.getElementById(id);
				if(ele.value==""){
					span.innerHTML="<font style='color:red;font-size:12px;'>"+info+"</font>";
					return false;
				}
				return true;
			}
			function checkPhone(id,info){
				var span=document.getElementById(id+"_span");
				span.innerHTML="";
				var ele=document.getElementById(id);
				if(ele.value==""){
					span.innerHTML="<font style='color:red;font-size:12px;'>"+info+"</font>";
					return false;
				}
				return true;
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
					<a href="${pageContext.request.contextPath}/addShoppingCarServlet?uid=${user.uid }">购物车</a>
			</div>
			<div class="clear"></div>
   
   		<div id="line"></div>
		<p style="font-size:20px;text-align:left;padding-left:10px;color: black;"><b>确认订单:</b></p>
		<form action="${pageContext.request.contextPath}/payAndCreateOrderDetailsServlet?map=mapalone&uno=${user.username }&uid=${user.uid}" method="post">
		<table width="100%" cellpadding="0px" cellspacing="0px" style="padding:0px;border-top:1px solid #e8e6e6;" >
		
		<tr><td >商品图</td><td>商品名称</td><td>商场价格</td><td>门店价格:</td><td>购买数量:</td><td>订单价格:</td></tr>
		
		<% Map<Product,Integer> mapalone=(Map)session.getAttribute("mapalone");
  		if(mapalone==null){
   			  out.println("温馨提示：您购物车为空!!!");
    	 return ;
 		 }
 		 Set<Product> key=mapalone.keySet(); %>
  		
 		<c:forEach items="${mapalone.keySet()}" var="product">
			<tr>
			<td ><img style="width:50px;height:50px;text-align:center" src="${pageContext.request.contextPath}/images/${product.pimage }"/></td>
			<td>${product.pname }</td><td>${product.market_price }</td><td>${product.shop_price }</td><td>${mapalone.get(product)}</td><td>${product.shop_price }</td>
			</tr> 
		</c:forEach>
        <% 
  	//  计算总金额 sums
  	  	double sums=0;
  		 for(Product product:key){
  		sums=sums+product.getShop_price()*mapalone.get(product);
        }
  		session.setAttribute("sums",sums);   
 			%>
 		<tr><td colspan="6" style="text-align:right;padding-right:15px">总价：<%=sums %>元</td>
 		</tr>
 		
 			<tr><td style="text-align:left;padding-left:20px">收货人：</td>
 		<td colspan="5" style="text-align:left;"><input  id="name" type="text" size="50px"  name="buyername" /><span id="name_span" ></span></td></tr>
 		<tr><td style="text-align:left;padding-left:20px">收货地址：</td>
 		<td colspan="5" style="text-align:left;"><input id="addr" type="text" size="50px" name="addr" /><span id="addr_span" ></span></td></tr>
 		<tr><td style="text-align:left;padding-left:20px">联系电话: </td>
 		<td colspan="5" style="text-align:left;"><input id="phone" type="text" size="50px" name="telephone" /><span id="phone_span" ></span></td></tr>
 		<input type="hidden" name="uno" value="${user.uid }" />
 		
		<tr>
		<td colspan="2"></td>
		
		<td colspan="4" style="text-align:right;padding-right:15px">
				<div id="buy_can">
				<a id="can" href="${pageContext.request.contextPath}/canceOrderServlet?map=mapalone" >
					<font >取消订单</font></a>
						&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" id="buy" value="立即下单" onclick="return check()" />
					
				
				</div>
				<div class="clear"></div>
		</td>
		</tr>
		</table>
		</form>
		</div>
</body>
</html>