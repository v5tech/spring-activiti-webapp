<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Spring MVC 文件上传</title>
    </head>
    <body>
        <h1>上传工作流程定义文件</h1>
        <span style="color: red;font-weight: bold;">${message }</span>
        <form action="${ctx }/workflow/deploy/" method="post" enctype="multipart/form-data" target="main">
        	<table>
				<tr>
					<td>上传者:</td>
					<td><input type="text" name="username" value="${loginuser.id }"/></td>
				</tr>
				<tr>
					<td>文件:</td>
					<td><input type="file" name="file"/></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td><input type="submit" value="提交"/></td>
				</tr>
			</table>
		</form>
    </body>
</html>
