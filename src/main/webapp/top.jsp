<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0Strict//EN""http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Spring Activiti App</title>
<link href="${ctx }/style/style.css" type="text/css" rel="stylesheet">
</head>
<body>
<img alt="activiti" src="${ctx }/images/activiti_logo.png"><font size="6" style="font-weight: bold;">Activiti整合Spring工作流(请假流程示例)</font>
${loginuser.id }(<c:forEach items="${listGroup }" var="group">
	<c:out value="${group.name }"></c:out>
</c:forEach>),<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime()) %>
<c:if test="${empty loginuser.id}" var="islogin">
<a href="${ctx }/login" target="_top">登录</a>
</c:if>
<c:if test="${!islogin}">
<a href="${ctx }/loginout" target="_top">退出</a>
</c:if>
</body>
</html>