<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.qianfeng.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#page{width:902px;margin: auto;border: 1px solid #e8e6e6;}
	a{text-decoration: none;}
	a:link{color:black}
	a:visited{color:black}
	a:hover{color:darkgray}
	a:active{color:red}
	body{margin:0px;padding:0px}
	#proleft img{padding-top:50px;width:200px;height:200px}
	
	#logoleft{float: left;}
	#logoright{float:right;padding-right: 30px;padding-top: 30px;}
	#logoright a{margin: 0 5px;}
	#line{border-bottom:1px solid #e8e6e6}
	
	
	#dec{padding:0px 4px;background:#ffdfdf;border:1.5px solid  #ff1752;font-size:14px;color:#ff1752}
	#inc{padding:0px 7px;background:#ff1752;border:1.5px solid  #ff1752;font-size:14px;color:white}
	
	
	#buy{padding:5px 26px;background:#ffdfdf;border:1.5px solid  #ff1752;}
	#add{padding:7px 22px 4px;background:#ff1752;border:1.5px solid  #ff1752;}
	#buy{line-height:22px;color:#ff1752}
	#add{line-height:22px;color:white}
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
					<a href="${pageContext.request.contextPath}/addShoppingCarServlet?uid=${user.uid }">购物车</a>
			</div>
			<div class="clear"></div>
   
   		<div id="line"></div>
   
   
		<div id="part1">
		<div id="proleft" style="float:left;width:350px;text-align:center">
		<img src="${pageContext.request.contextPath}/images/${product.pimage }"/>
		</div>
		
		
		<div id="proright" style="float:left;width:550px;border-left:1px solid #e8e6e6;">
		
		<p style="font-size:30px;text-align:center;color: #ccccff;"><b>欢迎光临本店！ 你的满意，我的安心</b></p>
		
		
		<table width="100%" cellpadding="0px" cellspacing="0px" style="height:400px;padding:0px 10px ;border-top:1px solid #e8e6e6;" >
		<tr>
			<td align="left" width="20%">商品名称:</td>
			<td align="left"><p>${product.pname }</p></td>
		</tr>
		<tr >
			<td align="left" width="20%">商场价格:</td>
			<td align="left"><p><del>￥${product.market_price }</del></p></td>
		</tr>
		<tr>
			<td align="left" width="20%">门店价格:</td>
			<td align="left"><p>￥${product.shop_price }</p></td>
		</tr>
		<tr>
			<td align="left" width="20%">商品描述:</td>
			<td align="left">
				<p>${product.pdesc }</p>
			</td>
		</tr>
		<form  name="form1" action="" method="post">
		<tr>
			<td align="left" width="20%">购买数量:</td>
			<td align="left">
				<div id="dec_inc">
				<input type="button" id="inc" value="-" onClick="if(this.form.amount.value>1) this.form.amount.value--">	
				<input type="text"   name="amount" value="1" onKeyUp="this.value=this.value.replace(/^\D{1}$/g, '')" size="1">
				<input type="button" id="dec" value="+" onClick="if(10>this.form.amount.value) this.form.amount.value++">
				</div>
				<div class="clear"></div></td>
		</tr>
		<!-- /\D/g -->
		<tr>
			<td colspan="2" align="center">
				<div id="buy_add">
				<input id="buy" type="submit" value="立即下单" onclick="javascript:form1.action='${pageContext.request.contextPath}/aloneBuyServlet?pid=${product.pid}&uid=${user.uid}'"/>
						&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" id="add" value="加入购物车" onclick="javascript:form1.action='${pageContext.request.contextPath}/addShoppingCarServlet?pid=${product.pid}&uid=${user.uid }'"/>	
				</div>
				<div class="clear"></div>
			</td>
		</tr>
		</form>
		</table>
		</div>
		</div>
		
		<div id="part2" style="float:left;border-top:1px dashed #e8e6e6;width:900px">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;不免费送货享受不免费送货上门服务。进一步了解爱来不来零售店</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;到FeiDaYe Store 零售店亲身体验各种Fake-Apple 产品，我们不会为你解答各种问题。前往零售店必须超额付款</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;符合条件的信用卡可选择灵活的分期付款方式，不要来买。进一步了解没有购买帮助</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;符合条件的信用卡用户可选择灵活的分期付款方式，不要来买。进一步了解没有购买帮助</p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;有问题吗？不要致电 Specialist 专家或进行在线交流。致电 400-666-8800也没人理你</p>
		</div>
		<div class="clear"></div>
	</div>	
</body>
</html>