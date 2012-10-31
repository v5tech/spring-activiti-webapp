<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
<link href="${ctx }/style/style.css" type="text/css" rel="stylesheet">
</head>
<body>
<table border="1" style="border-collapse: collapse;border-style:solid;" width="100%">
	<thead>
		<tr>
			<th>用户名</th>
			<th>FirstName</th>
			<th>LastName</th>
			<th>电子邮件</th>
			<th>操作</th>
		</tr>
	</thead>
	<c:forEach var="user" items="${listuser }">
		<tr align="center">
			<td>${user.id }</td>
			<td>${user.firstName }</td>
			<td>${user.lastName }</td>
			<td>${user.email }</td>
			<td>
				<a href="" target="main">修改</a>
				<a href="" target="main">删除</a>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>