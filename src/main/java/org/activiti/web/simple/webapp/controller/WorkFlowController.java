package org.activiti.web.simple.webapp.controller;

import java.io.IOException;

import javax.annotation.Resource;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.ManagementService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	@RequestMapping(value="/fileupload",method=RequestMethod.POST)
	public String upload(@RequestParam("username")String username,@RequestParam("file")MultipartFile file){
		System.out.println(username);
		String message="";
		if(!file.isEmpty()){
			try {
				byte[] bytes = file.getBytes();
			} catch (IOException e) {
				e.printStackTrace();
			}
			/*String realPath = request.getSession().getServletContext().getRealPath("/upload");
			File out=new File(realPath,file.getName());
			FileUtils.writeByteArrayToFile(out, bytes);
			message="文件上传成功!保存在:"+out.getPath();*/
		}
		return "redirect:main";
	}
	
	
}
