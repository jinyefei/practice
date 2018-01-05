<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" border="1px solid grey">
<title>Insert title here</title>
<script>
	function addProduct(){
			location.href="${pageContext.request.contextPath}/adminShowAddProductServlet";
	}
	window.onload = function(){
		var cid = "${condition.cid}";
		var sc = document.getElementById("sc");
		var options = sc.getElementsByTagName("option");
		for(var i=0;i<options.length;i++){
			if(options[i].value==cid){
				options[i].selected = true;
			}
		}
		
		var ih = "${condition.is_hot}";
		var si = document.getElementById("si");
		var options_si = si.getElementsByTagName("option");
		for(var i=0;i<options_si.length;i++){
			if(options_si[i].value==ih){
				options_si[i].selected = true;
			}
		}
		
		var ih = "${condition.pname}";
		var st = document.getElementById("st");
		st.value=ih;
		
		
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
<body>
	<table width="100%" cellpadding="0px" cellspacing="0px" border="1px">
		<caption> <h3>商品列表</h3> </caption>
		<tr align="right">
		<form action="${pageContext.request.contextPath}/adminShowSearchProductServlet" method="post">
		<td colspan="7" width="100%" >
		商品名称&nbsp;<input type="text" name="pname" id="st" />&nbsp;&nbsp;&nbsp;&nbsp;
		是否热门&nbsp;<select name="is_hot" id="si">
				<option value="">--请选择--</option>
				<option value="1">是</option>
				<option value="0">否</option>
			  </select>&nbsp;&nbsp;&nbsp;&nbsp;
		所属分类&nbsp;<select name="cid" id="sc">
				<option value="">--请选择--</option>
				<c:forEach items="${categoryList}" var="cat">
				<option value="${cat.cid }">${cat.cname}</option>
				</c:forEach>
			  </select>&nbsp;&nbsp;&nbsp;&nbsp;
			   <input type="submit" value="查询商品"/>
		</td>
		</tr>
		</form>
		<tr align="right"><td colspan="7" width="100%">
		<button onclick="addProduct()">添加商品</button>
		<form action="${pageContext.request.contextPath}/adminDeleteAllProductServlet" method="post">
		
		<input type="submit" value="删除商品"/>
		</td></tr>
		
		<tr>
		<td align="center">序号</td>
		<td align="center">图片</td>
		<td align="center">名称</td>
		<td align="center">门店价格</td>
		<td align="center">是否热门</td>
		<td align="center">编辑</td>
		<td align="center" >
		<input type="checkBox" name="checkall" id="checkall"/>全选
		
		</td>
		</tr>
		
		<c:forEach items="${productList}" var="pro" varStatus="vs">
		<tr>
		<td align="center">${vs.count}</td>
		<td align="center">
		<img src="${pageContext.request.contextPath }/images/${pro.pimage }" width="50px" height="50px"/>
		</td>
		<td align="center">${pro.pname }</td>
	    <td align="center">${pro.shop_price }</td>
		<td align="center">${pro.is_hot==1?"是":"否" }</td>
		<td align="center">
			<a href="${pageContext.request.contextPath}/adminShowEditProductServlet?pid=${pro.pid}">编辑</a>
		</td>
		<td align="center">
			<input type="checkBox" name="checkone" value="${pro.pid }">
		</td>
		</tr>
		</c:forEach>
		</form>
	</table>
	
</body>
</html>