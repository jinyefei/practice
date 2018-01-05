<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" border="1px solid grey">
<title>Insert title here</title>
<script>
	function addCategory(){
			location.href="${pageContext.request.contextPath}/admin/addCategory.jsp";
	}
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
<body>
	<table width="100%" cellpadding="0px" cellspacing="0px" border="1px">
		
		<caption> <h3>分类列表</h3> </caption>
		<tr align="right"><td colspan="4" width="100%">
		<button onclick="addCategory()">添加分类</button>
		<form action="${pageContext.request.contextPath}/adminDeleteAllCategoryServlet" method="post">
		<input type="submit" value="删除分类"/>
		</td></tr>
		<tr>
		<td align="center">序号</td>
		<td align="center">分类名称</td>
		<td align="center" >
		<input type="checkBox" name="checkall" id="checkall"/>全选
		</td>
		</tr>
		
		<c:forEach items="${categoryList}" var="category" varStatus="vs">
		<tr>
		<td align="center">${vs.count}</td>
		<td align="center">${category.cname }</td>
		<td align="center">
		<input type="checkBox" name="checkone" value="${category.cid }">
		</td>
		</tr>
		</c:forEach>
		
		</form>
	</table>
	
</body>
</html>