<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>分类添加</title>
</head>
<body>
		<form action="${pageContext.request.contextPath}/adminAddCategoryServlet" method="post">
			<table width="100%" cellpadding="0px" cellspacing="0px" border="1px">
			<caption>添加分类</caption>
			<tr>
			<td align="center">分类名称</td>
			<td align="left"><input type="text" name="cname" size="80"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">确定</button>
				<button type="reset">重置</button>
				<button type="button" onclick="history.go(-1)">返回</button>
			</td>
		</tr>
			</table>
		</form>
</body>
</html>















