<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function(){
		var cid = "${product.cid}";
		var sc = document.getElementById("sc");
		var options = sc.getElementsByTagName("option");
		for(var i=0;i<options.length;i++){
			if(options[i].value==cid){
				options[i].selected = true;
			}
		}
		
		var ih = "${product.is_hot}";
		var si = document.getElementById("si");
		var options_si = si.getElementsByTagName("option");
		for(var i=0;i<options_si.length;i++){
			if(options_si[i].value==ih){
				options_si[i].selected = true;
			}
		}
	}
	function editRet(){
		location.href="${pageContext.request.contextPath}/adminShowEditProductServlet?pid=${product.pid}";
}

</script>
</head>
<body>
<form action="${pageContext.request.contextPath}/adminUpdateProductServlet?pid=${product.pid}">
	<table width="100%" cellpadding="0px" cellspacing="0px" border="1px">
		<tr>
			<td align="center">商品名称</td>
			<td align="left"><input type="text" name="pname"  readonly="readonly" value="${product.pname }" size="50"/></td>
		</tr>
		<tr>
			<td align="center">商场价格</td>
			<td align="left"><input type="text" name="market_price" value="${product.market_price }" size="50"/></td>
		</tr>
		<tr>
			<td align="center">门店价格</td>
			<td align="left"><input type="text" name="shop_price" value="${product.shop_price }" size="50"/></td>
		</tr>
		<tr>
			<td align="center">商品描述</td>
			<td align="left">
				<textarea rows="10" cols="30" name="pdesc">${product.pdesc }</textarea>
			
			</td>
		</tr>
		<tr>
			<td align="center">是否热门</td>
			<td align="left">
				<select name="is_hot" id="si">
					<option value="1">是</option>
					<option value="0">否</option>
				</select>
			
			</td>
		</tr>
		<input type="hidden" name="pid" value="${product.pid }" />
		<tr>
			<td colspan="2" align="center">
				<button type="submit">确定</button>
				<button type="reset" onclick="editRet()">重置</button>
				<button type="button" onclick="history.go(-1)">返回</button>
			</td>
		</tr>
	</table>
  </form>
</body>
</html>