package org.activiti.web.simple.webapp.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.persistence.entity.TaskEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;

public interface ActivitiWorkFlowService {

	/** 
	 * 驳回流程 
	 *  
	 * @param taskId 
	 *            当前任务ID 
	 * @param activityId 
	 *            驳回节点ID 
	 * @param variables 
	 *            流程存储参数 
	 * @throws Exception 
	 */
	public abstract void backProcess(String taskId, String activityId,
			Map<String, Object> variables) throws Exception;

	/** 
	 * 取回流程 
	 *  
	 * @param taskId 
	 *            当前任务ID 
	 * @param activityId 
	 *            取回节点ID 
	 * @throws Exception 
	 */
	public abstract void callBackProcess(String taskId, String activityId)
			throws Exception;

	/** 
	 * 中止流程(特权人直接审批通过等) 
	 *  
	 * @param taskId 
	 */
	public abstract void endProcess(String taskId) throws Exception;

	/** 
	 * 根据当前任务ID，查询可以驳回的任务节点 
	 *  
	 * @param taskId 
	 *            当前任务ID 
	 */
	public abstract List<ActivityImpl> findBackAvtivity(String taskId)
			throws Exception;

	/** 
	 * 查询指定任务节点的最新记录 
	 *  
	 * @param processInstance 
	 *            流程实例 
	 * @param activityId 
	 * @return 
	 */
	public abstract HistoricActivityInstance findHistoricUserTask(
			ProcessInstance processInstance, String activityId);

	/** 
	 * 根据当前节点，查询输出流向是否为并行终点，如果为并行终点，则拼装对应的并行起点ID 
	 *  
	 * @param activityImpl 
	 *            当前节点 
	 * @return 
	 */
	public abstract String findParallelGatewayId(ActivityImpl activityImpl);

	/** 
	 * 根据任务ID获取流程定义 
	 *  
	 * @param taskId 
	 *            任务ID 
	 * @return 
	 * @throws Exception 
	 */
	public abstract ProcessDefinitionEntity findProcessDefinitionEntityByTaskId(
			String taskId) throws Exception;

	/** 
	 * 根据任务ID获取对应的流程实例 
	 *  
	 * @param taskId 
	 *            任务ID 
	 * @return 
	 * @throws Exception 
	 */
	public abstract ProcessInstance findProcessInstanceByTaskId(String taskId)
			throws Exception;

	/** 
	 * 根据任务ID获得任务实例 
	 *  
	 * @param taskId 
	 *            任务ID 
	 * @return 
	 * @throws Exception 
	 */
	public abstract TaskEntity findTaskById(String taskId) throws Exception;

	/** 
	 * 根据流程实例ID和任务key值查询所有同级任务集合 
	 *  
	 * @param processInstanceId 
	 * @param key 
	 * @return 
	 */
	public abstract List<Task> findTaskListByKey(String processInstanceId,
			String key);

	/** 
	 * 迭代循环流程树结构，查询当前节点可驳回的任务节点 
	 *  
	 * @param taskId 
	 *            当前任务ID 
	 * @param currActivity 
	 *            当前活动节点 
	 * @param rtnList 
	 *            存储回退节点集合 
	 * @param tempList 
	 *            临时存储节点集合（存储一次迭代过程中的同级userTask节点） 
	 * @return 回退节点集合 
	 */
	public abstract List<ActivityImpl> iteratorBackActivity(String taskId,
			ActivityImpl currActivity, List<ActivityImpl> rtnList,
			List<ActivityImpl> tempList) throws Exception;

	/** 
	 * 还原指定活动节点流向 
	 *  
	 * @param activityImpl 
	 *            活动节点 
	 * @param oriPvmTransitionList 
	 *            原有节点流向集合 
	 */
	public abstract void restoreTransition(ActivityImpl activityImpl,
			List<PvmTransition> oriPvmTransitionList);

	/** 
	 * 反向排序list集合，便于驳回节点按顺序显示 
	 *  
	 * @param list 
	 * @return 
	 */
	public abstract List<ActivityImpl> reverList(List<ActivityImpl> list);

	/** 
	 * 转办流程 
	 *  
	 * @param taskId 
	 *            当前任务节点ID 
	 * @param userCode 
	 *            被转办人Code 
	 */
	public abstract void transferAssignee(String taskId, String userCode);

	/** 
	 * 流程转向操作 
	 *  
	 * @param taskId 
	 *            当前任务ID 
	 * @param activityId 
	 *            目标节点任务ID 
	 * @param variables 
	 *            流程变量 
	 * @throws Exception 
	 */
	public abstract void turnTransition(String taskId, String activityId,
			Map<String, Object> variables) throws Exception;

	
	public abstract InputStream getImageStream(String taskId) throws Exception;
	
	
	/**
	 * 登录
	 * @param userid
	 * @param password
	 * @return
	 * @throws Exception
	 */
	public abstract boolean login(String userid,String password) throws Exception;
	
	/**
	 * 获取用户详细信息
	 * @param userid
	 * @return
	 */
	public abstract User getUserInfo(String userid);
	
	
	
	/**
	 * 获取组详细信息
	 * @param groupid
	 * @return
	 */
	public abstract Group getGroupInfo(String groupid);
	
	
	/**
	 * 列出用户所属的组
	 * @param userid
	 * @return
	 */
	public abstract List<Group> getUserOfGroup(String userid);
	
	
	/**
	 * 根据groupId查询组内的用户
	 * @param groupId
	 * @return
	 */
	public abstract List<User> memberOfGroup(String groupId);
	
}