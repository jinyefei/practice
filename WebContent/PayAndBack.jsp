<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.qianfeng.domain.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<meta http-equiv="refresh" content="3;URL=${pageContext.request.contextPath }/showAllProductServlet"> 
		<font color="green" size="4"> 
		您已下单成功！！!<br><br>
		三秒后将跳转到商城首页 <br> <br> 
		如果没有跳转,请按 <a  style="text-decoration:none" href="${pageContext.request.contextPath }/showAllProductServlet">这里</a>!!!
		<br> </font>
</body>
</html>