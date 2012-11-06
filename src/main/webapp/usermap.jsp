<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户管理</title>
</head>
<body>
<form:form action="${ctx }/usermap"  method="post">
	<table>  
      <thead>  
         <tr>  
            <th>First Name</th>  
            <th>Last Name</th>  
            <th>Birthday</th>  
         </tr>  
      </thead>  
      <tfoot>  
         <tr>  
            <td colspan="2"><input type="submit" value="Save" /></td>  
         </tr>  
      </tfoot>  
      <tbody>  
         <tr>  
            <td><input name="users['x'].firstName" value="aaa" /></td>  
            <td><input name="users['x'].lastName" value="bbb" /></td>  
            <td><input name="users['x'].birthday" value="2012-11-02 12:30" /></td>  
         </tr>  
         <tr>  
            <td><input name="users['y'].firstName" value="ccc" /></td>  
            <td><input name="users['y'].lastName" value="ddd" /></td>
            <td><input name="users['y'].birthday" value="2011-10-02 22:30" /></td>    
         </tr>  
         <tr>  
            <td><input name="users['z'].firstName" value="eee" /></td>  
            <td><input name="users['z'].lastName" value="fff" /></td>  
            <td><input name="users['z'].birthday" value="2002-11-22 16:30" /></td>  
         </tr>  
      </tbody>  
   </table>  
</form:form>
</body>
</html>