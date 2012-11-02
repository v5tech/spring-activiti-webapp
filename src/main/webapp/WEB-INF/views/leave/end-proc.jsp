<%@ page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="/common/global.jsp"%>
<%@ include file="/common/meta.jsp" %>
<%@ include file="/common/include-base-styles.jsp" %>
<%@ include file="/common/include-jquery-ui-theme.jsp" %>
<title>已经结束的流程实例</title>
</head>
<body>
<h1>已经结束的流程实例</h1>
<table width="100%" border="1" style="border-collapse: collapse;border-style: solid;border-color: maroon;">
<thead>
	<tr align="center">
		<th>假种</th>
		<th>申请人</th>
		<th>申请时间</th>
		<th>开始时间</th>
		<th>结束时间</th>
		<th><b>实际</b>开<br/>始时间</th>
		<th><b>实际</b>结<br/>束时间</th>
		<th>流程启动时间</th>
		<th>流程结束时间</th>
		<th>流程结束原因</th>
		<th>流程版本</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${endprocess }" var="leave">
		<c:set var="hpi" value="${leave.historicProcessInstance }" />
		<tr id="${leave.id }" align="center">
			<td>${leave.leaveType }</td>
			<td>${leave.userId }</td>
			<td><fmt:formatDate value="${leave.applyTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${leave.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${leave.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${leave.realityStartTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${leave.realityEndTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${hpi.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td><fmt:formatDate value="${hpi.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${hpi.deleteReason }</td>
			<td><b title='流程版本号'>V: ${leave.processDefinition.version }</b></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</html>