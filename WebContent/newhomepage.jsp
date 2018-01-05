<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.qianfeng.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>商城页面</title>
<link rel="stylesheet" type="text/css" href="css/newhomepage.css" />

<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	function searchfn(obj){
		$.post(
			"${pageContext.request.contextPath}/searchServlet",
			{"word":obj.value},
			function(data){
				var content="";
				if(data!=null){
					for(var i=0;i<data.length;i++){
						content+=
							"<div onmouseover='overfn(this)' style='font-size:14px' onclick='clickfn(this)' onmouseout='outfn(this)'>"
							+data[i].pname+"</div>";
					}
					//设置div的开始和结束标签之间的html内容
					$("#searchContentDiv").html(content);
					$("#searchContentDiv").css("display","block");
				}
				
			},
			"json"
		);
	}
	function clickfn(obj){
		$("#searchInput").val($(obj).html());
		
		
	}
	function overfn(obj){
		$(obj).css("background-color","#999");
	}
	function outfn(obj){
		$(obj).css("background-color","#fff");
	}


</script>

</head>
<body>
	<div id="shouye">
		<!--logo-->
		<div>
			<div id="adblock" style="width: 900px; height: 80px; display: none;">
				<img src="images/img/111.jpg" width="100%" height="100%" />
			</div>
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
				<c:if test="${!empty user}">
					<a href="${pageContext.request.contextPath}/addShoppingCarServlet?pid=${product.pid}&uid=${user.uid }" >购物车</a>
				</c:if>
					<c:if test="${empty user}">
					<a href="${pageContext.request.contextPath}/addShoppingCarServlet?uid=${user.uid }" >购物车</a>
					</c:if>
			</div>
			<div class="clear"></div>
		</div>
		<!--nag-->
		<div id="nag">
			<ul>
				<a href="${pageContext.request.contextPath }/showAllProductServlet"><li>首页</li></a>
				<a href="#"><li>手机数码</li></a>
				<a href="#"><li>家用电器</li></a>
				<a href="#"><li>鞋帽箱包</li></a>
			</ul>
			

			<div align="center" style="float: right;">
		<div style="height:50px;position:relative;">
			<input style="position:absolute;top:15px;right:90px;height:21px" id="searchInput" type="text" size="30px" onkeyup="searchfn(this)" />
			<button style="position:absolute;top:14px;right:37px;height:30px;width:55px;font-size:16px" type="button" >搜索</button><br>
		</div>
		<div style="position:relative;width:100px">
			<div id="searchContentDiv" style="background-color:white;position:absolute;top:-8px;right:90px;border:1px solid #999999;width:202px;height:76px;display:none;z-index:1">	
			</div>
		</div>
			</div>
			
			
			
			
			
			
			
			
			
			
			
			
		</div>
		<!--banner-->
		<div id="banner">
			<img id="changeimg" src="images/img/b1.jpg" width="100%" height="100%" />
		</div>
		<!--商品爆款-->
		<div id="baokuan">
			<img src="images/img/tittle1.png" width="100%" height="100%" />
		</div>
		<!--商品列表-->
		<div id="list">
			<div class="list_left">
				<img src="images/img/banner_left.jpg" width="100%" height="50%" />
				<img src="images/img/banner_left2.jpg" width="100%" height="50%" />
			</div>
			<div class="list_right" style="border-bottom: 1px darkgrey solid;">
				<div class="proimg">
					<c:forEach items="${pageBean.pageData }" var="pro">
						<div class='pro'>
						<a href="${pageContext.request.contextPath}/productDetailsServlet?pid=${pro.pid}">
							<img width='100px' height='100px'
								src='${pageContext.request.contextPath}/images/${pro.pimage }' />
							<p>${pro.pname }<br />￥${pro.shop_price }
							</p>
							</a>
						</div>
					</c:forEach>
				</div>
				<div style="text-align: center; width: 100%; float: right">
					<ul class="pageUl" style="margin:0px;padding:0px">
					<c:if test="${pageBean.currentPage!=1}">
						<li><a href="${pageContext.request.contextPath }/showAllProductServlet?currentPage=${pageBean.currentPage-1}">上一页</a></li>
						</c:if>
						<c:if test="${pageBean.currentPage==1}">
						<li><a>上一页</a></li>
						</c:if>
							<c:forEach begin="1" end="${pageBean.totalPage }" var="page">
								<c:if test="${page!=pageBean.currentPage }">
									<li><a href="${pageContext.request.contextPath }/showAllProductServlet?currentPage=${page }">${page }</a></li>
								</c:if>
								<c:if test="${page==pageBean.currentPage }">
									<li>${page }</li>
								</c:if>
							</c:forEach><c:if test="${pageBean.currentPage!=pageBean.totalPage}">
						<li><a href="${pageContext.request.contextPath }/showAllProductServlet?currentPage=${pageBean.currentPage+1}">下一页</a></li>
						</c:if>
						<c:if test="${pageBean.currentPage==pageBean.totalPage}">
						<li><a>下一页</a></li>
						</c:if>
					</ul>
				</div> 
				
			</div>
		</div>
		<!--七天退货-->
		<div>
			<img src="images/img/bottom.png" width="100%" />
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
		<div id="last">Copyright&nbsp;&nbsp;&copy;2010-2017 &nbsp;千锋商城&nbsp;版权所有
		</div>
	</div>
	<script>
		var i = 2;
		var timer;
		var lunbotu = document.getElementById("changeimg");
		var adblock = document.getElementById("adblock");
		window.onload = function() {
			timer = setTimeout(show, 3000);
			setInterval(change, 2000);
		}
		function change() {
			lunbotu.src = "images/img/b" + i + ".jpg";
			i++;
			if (i == 3) {
				i = 1;
			}
		}
		function show() {
			adblock.style.display = "block";
			clearTimeout(timer);
			timer = setTimeout(hidden, 5000);
		}
		function hidden() {
			adblock.style.display = "none";
			clearTimeout(timer);
		}
	</script>
</body>
</html>
