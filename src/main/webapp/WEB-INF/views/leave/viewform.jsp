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
<title>请假办理</title>
<link href="${ctx }/style/style.css" type="text/css" rel="stylesheet">
<link href="${ctx }/js/common/plugins/jui/extends/timepicker/jquery-ui-timepicker-addon.css" type="text/css" rel="stylesheet" />
<script src="${ctx }/js/common/jquery-1.7.1.js" type="text/javascript"></script>
<script src="${ctx }/js/common/plugins/jui/jquery-ui.min.js" type="text/javascript"></script>
<script src="${ctx }/js/common/plugins/jui/extends/timepicker/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
<script src="${ctx }/js/common/plugins/jui/extends/i18n/jquery-ui-date_time-picker-zh-CN.js" type="text/javascript"></script>
<script type="text/javascript">
$(function() {
	$('#startTime,#endTime').datetimepicker({
        stepMinute: 5
    });
	
	
	//显示当前节点对应的表单信息
	$('#${activityId }').css("display","inline");
	
});



/**
 * 完成任务
 * @param {Object} taskId
 */
function complete(taskId, variables) {
	// 转换JSON为字符串
    var keys = "", values = "", types = "";
	if (variables) {
		$.each(variables, function() {
			if (keys != "") {
				keys += ",";
				values += ",";
				types += ",";
			}
			keys += this.key;
			values += this.value;
			types += this.type;
		});
	}
	
	var url="${ctx}/leave/task/"+taskId+"/complete";
	// 发送任务完成请求
    $.post(url,{
        keys: keys,
        values: values,
        types: types
    });
}

function deptLeaderAudit(){
	var deptLeaderPass=$('#deptLeaderPass').val();
	var deptauditreason=$('#deptauditreason').val();
	complete('${taskId}',[
		{
			key: 'deptLeaderPass',
			value: deptLeaderPass,
			type: 'B'
		},
		{
			key: 'deptauditreason',
			value: deptauditreason,
			type: 'S'
		}
	]);
}



function hrAudit(){
	var hrauditreason=$('#hrauditreason').val();
	var hrPass=$('#hrPass').val();
	complete('${taskId}',[
		{
			key: 'hrPass',
			value: hrPass,
			type: 'B'
		},
		{
			key: 'hrauditreason',
			value: hrauditreason,
			type: 'S'
		}
	]);
}



</script>
</head>
<body>
<h1>流程办理</h1>
${message }
<div id="deptLeaderAudit" style="display: none;">
<form:form id="leaveform" method="post" onsubmit="javascript:return false;">
	<fieldset>
		<legend><small>请假办理</small></legend>
		<table width="50%">
		<tr>
			<td align="right">请假类型：</td>
			<td>
				${leave.leaveType }
			</td>
		</tr>
		<tr>
			<td align="right">开始时间：</td>
			<td>
				<fmt:formatDate value="${leave.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td align="right">结束时间：</td>
			<td>
				<fmt:formatDate value="${leave.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td align="right">请假原因：</td>
			<td>
				${leave.reason }
			</td>
		</tr>
		<tr>
			<td align="right">部门领导审批意见：</td>
			<td>
				<textarea name="deptauditreason" id="deptauditreason"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<select id="deptLeaderPass" name="deptLeaderPass">
					<option value="true">同意</option>
					<option value="false">驳回</option>
				</select>
				<button onclick="deptLeaderAudit();">提交</button>
			</td>
		</tr>
	</table>
	</fieldset>
</form:form>
</div>



<div id="modifyApply" style="display: none;">
<form:form id="leaveform"  method="post" >
	<fieldset>
		<legend><small>请假办理</small></legend>
		<table width="50%">
		<tr>
			<td align="right">请假类型：</td>
			<td>
				${leave.leaveType }
			</td>
		</tr>
		<tr>
			<td align="right">开始时间：</td>
			<td>
				<fmt:formatDate value="${leave.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td align="right">结束时间：</td>
			<td>
				<fmt:formatDate value="${leave.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td align="right">请假原因：</td>
			<td>
				${leave.reason }
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<button onclick="doclick();">提交</button>
			</td>
		</tr>
	</table>
	</fieldset>
</form:form>
</div>







<div id="hrAudit" style="display: none;">
<form:form id="leaveform"  method="post" onsubmit="javascript:return false;">
	<fieldset>
		<legend><small>请假办理</small></legend>
		<table width="50%">
		<tr>
			<td align="right">请假类型：</td>
			<td>
				${leave.leaveType }
			</td>
		</tr>
		<tr>
			<td align="right">开始时间：</td>
			<td>
				<fmt:formatDate value="${leave.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td align="right">结束时间：</td>
			<td>
				<fmt:formatDate value="${leave.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td align="right">请假原因：</td>
			<td>
				${leave.reason }
			</td>
		</tr>
		<tr>
			<td align="right">部门领导审批意见：</td>
			<td>
				${leave.variables.deptauditreason }
			</td>
		</tr>
		<tr>
			<td align="right">人事审批意见：</td>
			<td>
				<textarea name="hrauditreason" id="hrauditreason"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<select id="hrPass" name="hrPass">
					<option value="true">同意</option>
					<option value="false">驳回</option>
				</select>
				<button onclick="hrAudit();">提交</button>
			</td>
		</tr>
	</table>
	</fieldset>
</form:form>
</div>









<div id="reportBack" style="display: none;">
<form:form id="leaveform"  method="post" >
	<fieldset>
		<legend><small>请假办理</small></legend>
		<table width="50%">
		<tr>
			<td align="right">请假类型：</td>
			<td>
				${leave.leaveType }
			</td>
		</tr>
		<tr>
			<td align="right">开始时间：</td>
			<td>
				<fmt:formatDate value="${leave.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td align="right">结束时间：</td>
			<td>
				<fmt:formatDate value="${leave.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
		<tr>
			<td align="right">请假原因：</td>
			<td>
				${leave.reason }
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<button onclick="doclick();">提交</button>
			</td>
		</tr>
	</table>
	</fieldset>
</form:form>
</div>



































</html>