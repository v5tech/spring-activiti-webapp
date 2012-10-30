<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>用户登录</title>
    </head>
    <body>
    	<h1>用户登录</h1>
        <fieldset>
        	<legend>用户登录</legend>
        	<form action="${ctx }/account/loginin/" method="post">
        		用户名:<input name="username" type="text"/><br/>
        		密&nbsp;&nbsp;码:<input name="password" type="password"/><br/>
        		<input name="submit" type="submit" value="登录"/>
        	</form>
        </fieldset>
    </body>
</html>
