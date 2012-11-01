package org.activiti.web.simple.webapp.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.engine.ActivitiException;
import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.web.simple.webapp.model.Leave;
import org.activiti.web.simple.webapp.model.User;
import org.activiti.web.simple.webapp.service.LeaveService;
import org.activiti.web.simple.webapp.service.LeaveWorkFlowService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/leave")
public class LeaveController {
	
	@Resource(name="leaveServiceImpl")
	private LeaveService leaveService;
	
	@Resource(name="leaveWorkFlowServiceImpl")
	private LeaveWorkFlowService leaveWorkFlowService;
	
	@Resource(name="identityService")
	private IdentityService identityService;
	
	@SuppressWarnings("unused")
	@Resource(name="runtimeService")
	private RuntimeService runtimeService;
	
	@SuppressWarnings("unused")
	@Resource(name="historyService")
	private HistoryService historyService;
	
	@SuppressWarnings("unused")
	@Resource(name="taskService")
	private TaskService taskService;
	
	@SuppressWarnings("unused")
	@Resource(name="managementService")
	private ManagementService managementService;
	
	@SuppressWarnings("unused")
	@Resource(name="formService")
	private FormService formService;
	
	@SuppressWarnings("unused")
	@Resource(name="repositoryService")
	private RepositoryService repositoryService;
	
	
	@RequestMapping(value="/form",method={RequestMethod.GET})
	public String toleaveForm(){
		return "leave/leaveform";
	}
	
	/**
	 * 收集表单信息。启动工作流
	 * @param leave 自动绑定表单提交过来的数据
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/start",method={RequestMethod.POST})
	public String startWorkFlow(Leave leave,HttpSession session,HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttributes){
		
		Map<String, Object> variables=new HashMap<String, Object>();
		
		User user=(User) session.getAttribute("loginuser");
		if(user!=null){
			//管理用户id
			leave.setUserId(user.getId());	
			
			leave.setApplyTime(Calendar.getInstance().getTime());
			
			//先持久化请假实体
			leaveService.save(leave);
			
			//与业务绑定(将请假实例的id与流程实例绑定)
			String businessKey=leave.getId().toString();
			
			// 用来设置启动流程的人员ID，引擎会自动把用户ID保存到activiti:initiator中
			identityService.setAuthenticatedUserId(user.getId());
			
			try {
				ProcessInstance processInstance = leaveWorkFlowService.startWorkflow("leave",businessKey,variables);
				
				leave.setProcessInstance(processInstance);
				leave.setProcessInstanceId(processInstance.getId());
				
				redirectAttributes.addFlashAttribute("message", "流程已启动，流程ID：" + processInstance.getId());
			} catch (ActivitiException e) {
				if (e.getMessage().indexOf("no processes deployed with key") != -1) {
					redirectAttributes.addFlashAttribute("message", "没有部署流程");
					return "redirect:/workflow/toupload";
				} else {
					redirectAttributes.addFlashAttribute("message", "系统内部错误！");
				}
			} catch (Exception e) {
				redirectAttributes.addFlashAttribute("message", "系统内部错误！");
			}
		}else{
			return "redirect:/login";//跳转到登录界面
		}
		return "redirect:/leave/form"; //跳转到原来的页面
	}
	
	
	/**
	 * 根据用户Id查询待办任务列表
	 * @param userid
	 * @return
	 */
	@RequestMapping(value="/task/list",method={RequestMethod.GET})
	public ModelAndView findTask(HttpServletRequest request, HttpServletResponse response,HttpSession session){
		ModelAndView modelAndView=new ModelAndView("leave/tasklist");
		User user=(User) session.getAttribute("loginuser");
		List<Leave> tasklist = leaveWorkFlowService.findTask(user.getId(),"leave");
		modelAndView.addObject("tasklist", tasklist);
		return modelAndView;
	}
	
	
	/**
	 * 根据流程定义的key查询运行中的流程实例
	 * @param processDefinitionKey
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/process/running/{processDefinitionKey}/list",method={RequestMethod.GET})
	public ModelAndView findRunningProcessInstaces(@PathVariable("processDefinitionKey")String processDefinitionKey,HttpServletRequest request, HttpServletResponse response){
		ModelAndView modelAndView=new ModelAndView("leave/run-proc");
		List<Leave> runningProcessInstaces = leaveWorkFlowService.findRunningProcessInstaces(processDefinitionKey);
		modelAndView.addObject("runprocess", runningProcessInstaces);
		return modelAndView;
	}
	
	/**
	 * 查询已结束的流程实例
	 * @param processDefinitionKey
	 * @return
	 */
	@RequestMapping(value="/process/finished/{processDefinitionKey}/list",method={RequestMethod.GET})
	public ModelAndView findFinishedProcessInstaces(@PathVariable("processDefinitionKey")String processDefinitionKey,HttpServletRequest request, HttpServletResponse response){
		ModelAndView modelAndView=new ModelAndView("leave/end-proc");
		List<Leave> finishedProcessInstaces = leaveWorkFlowService.findFinishedProcessInstaces(processDefinitionKey);
		modelAndView.addObject("endprocess", finishedProcessInstaces);
		return modelAndView;
	}
	
	
	
	
	
}
