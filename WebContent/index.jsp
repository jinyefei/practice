<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.qianfeng.domain.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>主页</title>
		<style>
			div{margin:0px;padding: 0px;}
			a{text-decoration: none;}
			a:link{color:black}
			a:visited{color:black}
			a:hover{color:darkgray}
			a:active{color:red}
			#shouye{width:900px;margin: auto;border: 1px solid ;}
			#logoleft{float: left;}
			#logoright{float:right;padding-right: 30px;padding-top: 30px;}
			#logoright a{margin: 0 5px;}
			.clear{clear:both}
			ul li{float: left;list-style:none ;margin:8px 10px;}
			.pageUl,li{float: right;}
			ul a:hover{color:cyan}
			#laws{text-align: center;border-top: 1px  darkgrey solid;}
			#laws a{margin:10px 5px;font: 16px 黑体 ;}
			#last{text-align: center;font: 16px 黑体 ;}
		</style>
	</head>
		<body>
		<div id="shouye">
		<!--logo-->
		<div>
			<div id="adblock" style="width: 900px;height:80px;display:none;">
				<img src="images/img/111.jpg" width="100%" height="100%"/>
			</div>
			<div id="logoleft">
				<img  src="images/img/mylogo.png"/>
			</div>
			<div id="logoright">
			<a href="${pageContext.request.contextPath }/showAllProductServlet" style="color:green;font-size:30px" >飞大爷连锁超市</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;		
			<a href="${pageContext.request.contextPath }/showAllProductServlet">商城首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/admin/index.jsp">后台管理</a>
						
			
			</div>
			<div class="clear"></div>
		</div >
		
		<!--banner-->
		<div id="banner">
			<img id="changeimg" src="images/img/b1.jpg" width="100%" height="100%"/>
		</div>
		
		<!--七天退货-->
		<div>
			<img src="images/img/bottom.png" width="100%"/>
		</div>
		<!--法律-->
		<div id="laws">       
			<a href="#">关于我们</a>
			<a href="#">联系我们</a>
			<a href="#">招贤纳士</a>
			<a href="#">法律声明</a>
			<a href="#">友情链接</a>
			<a href="#">支付方式</a>
			<a href="#">配送方式</a>
			<a href="#">广告声明</a>
		</div>
		<!--版权-->
		<div id="last">
			Copyright&nbsp;&nbsp;&copy;2010-2017 &nbsp;千锋商城 &nbsp;版权所有	
		</div>
	</div>
	</body>
</html>
