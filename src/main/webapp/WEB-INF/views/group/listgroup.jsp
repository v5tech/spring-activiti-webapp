<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>组管理</title>
<link href="${ctx }/style/style.css" type="text/css" rel="stylesheet">
</head>
<body>
<table border="1" style="border-collapse: collapse;border-style:solid;" width="100%">
	<thead>
		<tr>
			<th>组编号</th>
			<th>组名</th>
			<th>组类别</th>
			<th>操作</th>
		</tr>
	</thead>
	<c:forEach var="group" items="${listgroup }">
		<tr align="center">
			<td>${group.id }</td>
			<td>${group.name }</td>
			<td>${group.type }</td>
			<td>
				<a href="" target="main">修改</a>
				<a href="" target="main">删除</a>
				<a href="${ctx }/memberofgroup/${group.id }" target="main">查看该组的用户</a>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>