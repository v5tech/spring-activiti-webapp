package org.activiti.web.simple.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.web.simple.webapp.model.User;
import org.activiti.web.simple.webapp.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Resource(name="accountServiceImpl")
	private AccountService accountService;
	
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
	 * 执行用户登录
	 * @param username接受表单提交过来的用户名
	 * @param password接受表单提交过来的密码
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value="/loginin",method={RequestMethod.POST,RequestMethod.GET})
	public String loginin(@RequestParam("username")String username,@RequestParam("password")String password,HttpServletRequest request, HttpServletResponse response){
		System.out.println(username);
		System.out.println(password);
		boolean b = accountService.checkPassword(username, password);
		String forword=b?"main":"login";
		
		User user=new User();
		user.setId(username);
		user.setPassword(password);
		request.getSession().setAttribute("loginuser", user);
		
		return forword;
	}
	
	
}
