package org.activiti.web.simple.webapp.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.web.simple.webapp.service.AccountService;
import org.activiti.web.simple.webapp.service.ActivitiWorkFlowService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AccountController {

	@Resource(name="accountServiceImpl")
	private AccountService accountService;
	
	@Resource(name="activitiWorkFlowServiceImpl")
	private ActivitiWorkFlowService activitiWorkFlowService;
	
	ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return null;
	}
	
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping(value="/login",method={RequestMethod.POST,RequestMethod.GET})
	public String login(){
		return "login";
	}
	
	
	
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping(value="/loginout",method={RequestMethod.POST,RequestMethod.GET})
	public String loginout(HttpSession session){
		session.removeAttribute("loginuser");
		return "redirect:/login";
	}
	
	
	
	/**
	 * 跳转到主页面
	 * @return
	 */
	@RequestMapping(value="/main",method={RequestMethod.POST,RequestMethod.GET})
	public String main(){
		return "main";
	}
	
	
	
	/**
	 * 执行用户登录
	 * @param username接受表单提交过来的用户名
	 * @param password接受表单提交过来的密码
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/loginin",method={RequestMethod.POST,RequestMethod.GET})
	public String loginin(@RequestParam("username")String username,@RequestParam("password")String password,HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttributes){
		String forword="";
		if((username!=null&&username.length()>0)&&(password!=null&&password.length()>0)){
			boolean b = accountService.checkPassword(username, password);
			if(b){
				User user = activitiWorkFlowService.getUserInfo(username);
				user.setId(username);
				user.setPassword(password);
				request.getSession().setAttribute("loginuser", user);
				redirectAttributes.addFlashAttribute("message", "登录成功!");
				forword="/main";//main.jsp
			}else{
				redirectAttributes.addFlashAttribute("message", "用户名或密码错误!");
				forword="/login";//login.jsp
			}
		}else{
			forword="/login";//login.jsp
			redirectAttributes.addFlashAttribute("message", "用户名或密码不能为空!");
		}
		return "redirect:"+forword;
	}
	
	
	
	/**
	 * 跳转到用户管理页面
	 * @return
	 */
	@RequestMapping(value="/userwork",method={RequestMethod.POST,RequestMethod.GET})
	public String userwork(){
		return "user/userwork";
	}
	
	
	
	/**
	 * 跳转到用户管理页面
	 * @return
	 */
	@RequestMapping(value="/groupwork",method={RequestMethod.POST,RequestMethod.GET})
	public String groupwork(){
		return "group/groupwork";
	}
	
	/**
	 * 查看用户列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/userlist",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView userlist(HttpServletRequest request, HttpServletResponse response){
		List<org.activiti.engine.identity.User> listuser = accountService.createUserQuery().list();
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("user/listuser");
		modelAndView.addObject("listuser", listuser);
		return modelAndView;
	}
	
	
	/**
	 * 查看组员列表
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/grouplist",method={RequestMethod.POST,RequestMethod.GET})
	public ModelAndView grouplist(HttpServletRequest request, HttpServletResponse response){
		List<Group> listgroup = accountService.createGroupQuery().list();
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("group/listgroup");
		modelAndView.addObject("listgroup", listgroup);
		return modelAndView;
	}
	
}
