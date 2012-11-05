package org.activiti.web.simple.webapp.service;

import java.util.Date;

import javax.annotation.Resource;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.web.simple.webapp.model.Leave;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("reportBackEndProcessor")
@Transactional
public class ReportBackEndProcessor implements TaskListener {
	
	@Resource(name="leaveServiceImpl")
	private LeaveService leaveService;
	
	@Autowired
	RuntimeService runtimeService;
	
	public void notify(DelegateTask delegateTask) {
		String processInstanceId = delegateTask.getProcessInstanceId();
		ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
		Leave leave = leaveService.findById(processInstance.getBusinessKey());
		
		Object realityStartTime = delegateTask.getVariable("realityStartTime");
		leave.setRealityStartTime((Date) realityStartTime);
		
		Object realityEndTime = delegateTask.getVariable("realityEndTime");
		leave.setRealityEndTime((Date) realityEndTime);
		
		leaveService.save(leave);
	}

}
