<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spring Activiti App</title>
<link href="${ctx }/style/style.css" type="text/css" rel="stylesheet">
</head>
<body>
<a href="${ctx }/userwork/" target="main">用户管理</a><br/><br/>
<a href="${ctx }/groupwork/" target="main">组管理</a><br/><br/>
<a href="${ctx }/workflow/toupload/" target="main">上传流程定义</a><br/><br/>
<a href="${ctx }/workflow/processlist/" target="main">查看流程定义</a><br/><br/>
<a href="${ctx }/leave/form/" target="main">填写请假单</a><br/><br/>
<a href="${ctx }/leave/task/list/${loginuser.id}" target="main">待办任务列表</a><br/><br/>
<a href="${ctx }/leave/process/running/leave/list" target="main">运行中的流程实例</a><br/><br/>
<a href="${ctx }/leave/process/finished/leave/list" target="main">已经结束的流程实例</a><br/>
</body>
</html>