<%@ page language="java" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<table width="100%" class="need-border">
<thead>
	<tr>
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
	<c:forEach items="${leaves }" var="leave">
		<c:set var="hpi" value="${leave.historicProcessInstance }" />
		<tr id="${leave.id }" tid="${task.id }">
			<td>${leave.leaveType }</td>
			<td>${leave.userId }</td>
			<td>${leave.applyTime }</td>
			<td>${leave.startTime }</td>
			<td>${leave.applyTime }</td>
			<td>${leave.realityStartTime }</td>
			<td>${leave.realityEndTime }</td>
			<td>${hpi.startTime }</td>
			<td>${hpi.endTime }</td>
			<td>${hpi.deleteReason }</td>
			<td><b title='流程版本号'>V: ${leave.processDefinition.version }</b></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</html>