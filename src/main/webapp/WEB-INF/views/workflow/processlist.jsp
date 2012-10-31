<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>流程定义管理</title>
<link href="${ctx }/style/style.css" type="text/css" rel="stylesheet">
</head>
<body>
<table border="1" style="border-collapse: collapse;border-style:solid;" width="100%">
<thead>
	<tr>
		<th>ProcessDefinitionId</th>
		<th>DeploymentId</th>
		<th>名称</th>
		<th>KEY</th>
		<th>版本号</th>
		<th>XML</th>
		<th>图片</th>
		<th>部署时间</th>
		<th>操作</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${objects }" var="object">
		<c:set var="process" value="${object[0] }" />
		<c:set var="deployment" value="${object[1] }" />
		<tr>
			<td>${process.id }</td>
			<td>${process.deploymentId }</td>
			<td>${process.name }</td>
			<td>${process.key }</td>
			<td>${process.version }</td>
			<td><a target="_blank" href='${ctx }/workflow/resource/deployment?deploymentId=${process.deploymentId}&resourceName=${process.resourceName }'>${process.resourceName }</a></td>
			<td><a target="_blank" href='${ctx }/workflow/resource/deployment?deploymentId=${process.deploymentId}&resourceName=${process.diagramResourceName }'>${process.diagramResourceName }</a></td>
			<td>${deployment.deploymentTime }</td>
			<td><a href='${ctx }/workflow/process/delete?deploymentId=${process.deploymentId}'>删除</a></td>
		</tr>
	</c:forEach>
</tbody>
</table>
</body>
</html>