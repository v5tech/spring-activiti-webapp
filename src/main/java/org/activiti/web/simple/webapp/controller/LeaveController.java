package org.activiti.web.simple.webapp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.web.simple.webapp.model.Leave;
import org.activiti.web.simple.webapp.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/leave")
public class LeaveController {
	
	@Resource(name="identityService")
	private IdentityService identityService;
	
	@Resource(name="runtimeService")
	private RuntimeService runtimeService;
	
	@Resource(name="historyService")
	private HistoryService historyService;
	
	@Resource(name="taskService")
	private TaskService taskService;
	
	@Resource(name="managementService")
	private ManagementService managementService;
	
	@Resource(name="formService")
	private FormService formService;
	
	@Resource(name="repositoryService")
	private RepositoryService repositoryService;
	
	
	@RequestMapping(value="/form",method={RequestMethod.GET})
	public String toleaveForm(){
		return "leave/leaveform";
	}
	
	/**
	 * 收集表单信息。启动工作流
	 * @param leave
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/start",method={RequestMethod.POST})
	public String startWorkFlow(Leave leave,HttpSession session,HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttributes){
		
		Map<String, Object> variables=new HashMap<String, Object>();
		String businessKey=leave.getId().toString();
		
		User user=(User) session.getAttribute("loginuser");
		if(user!=null){
			leave.setUserId(user.getId());	
			runtimeService.startProcessInstanceByKey("", businessKey, variables);
		}else{
			return "redirect:/login";//跳转到登录界面
		}
		
		
		
		
		return "";
	}
	
	
	
}
