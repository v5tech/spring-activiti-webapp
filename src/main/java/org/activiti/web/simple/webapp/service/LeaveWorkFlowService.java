package org.activiti.web.simple.webapp.service;

import java.util.List;
import java.util.Map;

import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.web.simple.webapp.model.Leave;

public interface LeaveWorkFlowService {

	/**
	 * 启动工作流
	 * @param key
	 * @param businessKey
	 * @param variables
	 * @return
	 */
	public ProcessInstance startWorkflow(String key,String businessKey,Map<String, Object> variables);
	
	/**
	 * 根据用户Id查询待办任务列表
	 * @param userid 用户id
	 * @param processDefinitionKey 流程定义的key
	 * @return
	 */
	public List<Leave> findTask(String userid,String processDefinitionKey);
	

	/**
	 * 查询运行中的流程实例
	 * @param processDefinitionKey 流程定义的key
	 * @return
	 */
	public List<Leave> findRunningProcessInstaces(String processDefinitionKey);
	
	
	/**
	 * 查询已结束的流程实例
	 * @param processDefinitionKey
	 * @return
	 */
	public List<Leave> findFinishedProcessInstaces(String processDefinitionKey);
	
	
	/**
	 * 根据流程定义Id查询流程定义
	 * @param processDefinitionId
	 * @return
	 */
	public ProcessDefinition getProcessDefinition(String processDefinitionId);
	
	
	
	
	public TaskEntity findTaskById(String taskId) throws Exception;
	
	
}
