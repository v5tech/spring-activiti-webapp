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
	
	$('#realityStartTime,#realityEndTime').datetimepicker({
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
    },function(data){
    	alert(data=="success"?"执行成功!":"执行失败!");
    	var a = document.createElement('a');
    	a.href='${ctx }/leave/task/list';
    	a.target = 'main';
    	document.body.appendChild(a);
    	a.click();
    });
    
}

//部门经理审核
function deptLeaderAudit(){
	var deptLeaderPass=$('#deptLeaderAudit :radio[name=deptLeaderPass]:checked').val();
	var deptauditreason=$('#deptLeaderAudit #deptauditreason').val();
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


//人事审批
function hrAudit(){
	var hrauditreason=$('#hrAudit #hrauditreason').val();
	var hrPass=$('#hrAudit :radio[name=hrPass]:checked').val();
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

//调整申请
function modifyApply(){
	complete('${taskId}', [{
		key: 'reApply',
		value: $('#modifyApply :radio[name=reApply]:checked').val(),
		type: 'B'
	}, {
		key: 'leaveType',
		value: $('#modifyApply #leaveType').val(),
		type: 'S'
	}, {
		key: 'startTime',
		value: $('#modifyApply #startTime').val(),
		type: 'D'
	}, {
		key: 'endTime',
		value: $('#modifyApply #endTime').val(),
		type: 'D'
	}, {
		key: 'reason',
		value: $('#modifyApply #reason').val(),
		type: 'S'
	}, {
		key: 'notify',
		value: $('#modifyApply :radio[name=notify]:checked').val(),
		type: 'B'
	}]);
}

//销假
function reportBack(){
	var realityStartTime = $('#reportBack #realityStartTime').val();
	var realityEndTime = $('#reportBack #realityEndTime').val();
	var notify = $('#reportBack :radio[name=notify]:checked').val();
	complete('${taskId}', [{
		key: 'realityStartTime',
		value: realityStartTime,
		type: 'D'
	}, {
		key: 'realityEndTime',
		value: realityEndTime,
		type: 'D'
	}, {
		key: 'notify',
		value: notify,
		type: 'B'
	}]);
}

</script>
</head>
<body>
<h1>流程办理</h1>
<font color="red">${message }</font>
<!-- 部门经理审批 -->
<div id="deptLeaderAudit" style="display: none;">
<form id="leaveform" method="post" onsubmit="javascript:return false;">
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
				<input type="radio" name="deptLeaderPass" value="true" checked="checked">同意
				<input type="radio" name="deptLeaderPass" value="false" >驳回
				<button onclick="deptLeaderAudit();" >提交</button>
			</td>
		</tr>
	</table>
	</fieldset>
</form>
</div>
<!-- 调整申请 -->
<div id="modifyApply" style="display: none;">
<form:form id="leaveform"  method="post" onsubmit="javascript:return false;">
	<fieldset>
		<legend><small>请假办理</small></legend>
		<table width="50%">
		<tr>
			<td align="right">请假类型：</td>
			<td>${leave.leaveType }
				<select id="leaveType" name="leaveType">
					<option>公休</option>
					<option>病假</option>
					<option>调休</option>
					<option>事假</option>
					<option>婚假</option>
				</select>
			</td>
		</tr>
		<tr>
			<td align="right">开始时间：</td>
			<td>
				<input type="text" id="startTime" name="startTime" value="<fmt:formatDate value="${leave.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
			</td>
		</tr>
		<tr>
			<td align="right">结束时间：</td>
			<td>
				<input type="text" id="endTime" name="endTime" value="<fmt:formatDate value="${leave.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/>"/>
			</td>
		</tr>
		<tr>
			<td align="right">请假原因：</td>
			<td>
				<textarea name="reason" id="reason">${leave.reason }</textarea>
			</td>
		</tr>
		<tr>
			<td align="right">部门领导审批意见：</td>
			<td>
				${leave.variables.deptauditreason }
			</td>
		</tr>
		<c:if test="${!empty leave.variables.hrauditreason }">
			<tr>
				<td align="right">人事审批意见：</td>
				<td>
					${leave.variables.hrauditreason }
				</td>
			</tr>
		</c:if>
		<tr>
			<td align="right">是否邮件通知：</td>
			<td>
				<input type="radio" name="notify" value="true" checked="checked">是
				<input type="radio" name="notify" value="false">否
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<input type="radio" name="reApply" value="true" checked="checked">重新申请
				<input type="radio" name="reApply" value="false">结束流程
				<button onclick="modifyApply();">提交</button>
			</td>
		</tr>
	</table>
	</fieldset>
</form:form>
</div>
<!-- 人事审批 -->
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
				<input type="radio" name="hrPass" value="true" checked="checked">同意
				<input type="radio" name="hrPass" value="false">驳回
				<button onclick="hrAudit();">提交</button>
			</td>
		</tr>
	</table>
	</fieldset>
</form:form>
</div>
<!-- 销假 -->
<div id="reportBack" style="display: none;">
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
		<c:if test="${!empty leave.variables.hrauditreason }">
			<tr>
				<td align="right">人事审批意见：</td>
				<td>
					${leave.variables.hrauditreason }
				</td>
			</tr>
		</c:if>
		<tr>
			<td align="right">实际开始时间：</td>
			<td>
				<input type="text" id="realityStartTime" name="realityStartTime"/>
			</td>
		</tr>
		<tr>
			<td align="right">实际结束时间：</td>
			<td>
				<input type="text" id="realityEndTime" name="realityEndTime"/>
			</td>
		</tr>
		<tr>
			<td align="right">是否邮件通知：</td>
			<td>
				<input type="radio" name="notify" value="true" checked="checked">是
				<input type="radio" name="notify" value="false">否
			</td>
		</tr>
		<tr>
			<td>
				&nbsp;
			</td>
			<td>
				<button onclick="reportBack();">提交</button>
			</td>
		</tr>
	</table>
	</fieldset>
</form:form>
</div>
</html>