<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>流程图跟踪</title>
        <script type="text/javascript" src="${ctx }/js/common/jquery-1.7.1.js"></script>
        <script type="text/javascript">
        	var url='${ctx }/workflow/process/${executionId}/trace/${processInstanceId}';
        	$.post(url,function(data){
				var dt=eval(data);
				var viv="<img alt='跟踪工作流' src='${ctx }/workflow/view/${processInstanceId}' style='position:absolute; left:0px; top:0px;'><div style='position: absolute;border: 2px solid red;left: "+(dt.x-1)+"px;top: "+(dt.y-1)+"px;width: "+(dt.width-2)+"px;height: "+(dt.height-2)+"px;'></div>";
				$('body').append(viv);
        	});
        </script>
    </head>
    <body>
    </body>
</html>