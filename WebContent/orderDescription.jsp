<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.qianfeng.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单详情</title>
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
	
	#back{padding:5px 18px;background:#ff1752;border:1.5px solid  #ff1752;}
	#back font{line-height:35px;color:white}
	.clear{clear:both}
</style>

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
					<a href="${pageContext.request.contextPath}/addShoppingCarServlet?pid=${product.pid}&uid=${user.uid }">购物车</a>
			</div>
			<div class="clear"></div>
   
   		<div id="line"></div>
		<p style="font-size:30px;text-align:center;color: #ccccff;"><b>欢迎光临本店！ 你的满意，我的安心</b></p>
		<form  name="form1" action="" method="post">
		<table width="100%" cellpadding="0px" cellspacing="0px" style="padding:0px;border-top:1px solid #e8e6e6;" >
		
		<tr><td >商品图</td><td>商品名称</td><td>商场价格</td><td>门店价格:</td><td>购买数量:</td></tr>
		
		<% Map<Product,Integer> mapDescription=(Map)session.getAttribute("mapDescription");
  		if(mapDescription==null){
   			  out.println("温馨提示：您购物车为空!!!");
    	 return ;
 		 }
 		 Set<Product> key=mapDescription.keySet(); %>
  		
 		<c:forEach items="${mapDescription.keySet()}" var="product">
			<tr>
			<td ><img style="width:50px;height:50px;text-align:center" src="${pageContext.request.contextPath}/images/${product.pimage }"/></td>
			<td>${product.pname }</td><td>${product.market_price }</td><td>${product.shop_price }</td><td>${mapDescription.get(product)}</td>
			</tr> 
		</c:forEach>
        <% 
  	//  计算总金额 sums
  	  	double sums=0;
  		 for(Product product:key){
  		sums=sums+product.getShop_price()*mapDescription.get(product);
        }
  		session.setAttribute("sums",sums);   
 			%>		
		<tr>
		<td style="text-align:right;padding-right:15px">订单总价：<%=sums %>元</td>
		
		<td colspan="5" style="text-align:right">
				<div id="buy_add">
				<a id="back" href="${pageContext.request.contextPath}/manyOrderByUserServlet?username=${user.username}" >
				<font >&nbsp;&nbsp;&nbsp;&nbsp;返回&nbsp;&nbsp;&nbsp;&nbsp;</font></a>
						&nbsp;&nbsp;&nbsp;&nbsp;

					
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