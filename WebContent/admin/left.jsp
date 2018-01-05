<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/html" href="${pageContext.request.contextPath}/css/dtree.css">
</head>
<body>
	<table width="100%" height="100%" cellpadding="0" cellspacing="0" >
		<tr>
			<td>
				<div class="dTree" style="font-size:14px;font-color:black">
					<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
					<script type="text/javascript" src="${pageContext.request.contextPath }/js/dtree.js"></script>
					<script type="text/javascript">
						d = new dTree('d');
						d.add('01',-1,'超市后台管理');//01表示本级的编号
						d.add('0101','01','分类管理模块');//第二个属性表示所属的父级的编号
						d.add('010101','0101','分类管理','${pageContext.request.contextPath}/adminCategoryListServlet','','right');//第四个属性，是该标签被敌机后请求资源的地址
						d.add('0102','01','商品管理模块');
						d.add('010201','0102','商品管理','${pageContext.request.contextPath}/adminProductListServlet','','right');//right指的是请求的资源显示在的目标frame的name。
						document.write(d);
					</script>
				</div>
			</td>
		</tr>
	</table>
</body>
</html>