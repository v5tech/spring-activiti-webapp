package org.activiti.web.simple.webapp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value="/workflow")
public class WorkFlowController {
	
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
	
	@RequestMapping("/toupload")
	public String toupload(){
		return "workflow/upload";
	}
	
	
	
	
	/**
	 * Spring MVC文件上传
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/deploy",method=RequestMethod.POST)
	public String deploy(@RequestParam("username")String username,@RequestParam("file")MultipartFile file,HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttributes) throws Exception{
		System.out.println(username);
		if(!file.isEmpty()){
			byte[] bytes= file.getBytes();
			String realPath = request.getSession().getServletContext().getRealPath("/upload");
			File out=new File(realPath,file.getOriginalFilename());
			FileUtils.writeByteArrayToFile(out, bytes);
			
			Deployment deployment = repositoryService.createDeployment().addInputStream(file.getOriginalFilename(), file.getInputStream()).deploy();
			
			redirectAttributes.addFlashAttribute("message", "文件上传成功!保存在:"+out.getPath());
		}
		return "redirect:/main";
	}
	
	
	@RequestMapping(value="/processlist",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView processlist(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView modelAndView=new ModelAndView("workflow/processlist");
		
		/*
		 * 保存两个对象，一个是ProcessDefinition（流程定义），一个是Deployment（流程部署）
		 */
		List<Object[]> objects = new ArrayList<Object[]>();
		
		List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().list();
		for (ProcessDefinition processDefinition : list) {
			String deploymentId = processDefinition.getDeploymentId();
			Deployment deployment = repositoryService.createDeploymentQuery().deploymentId(deploymentId).singleResult();
			objects.add(new Object[]{processDefinition,deployment});
		}
		modelAndView.addObject("objects",objects);
		return modelAndView;
	}
	
	
}
