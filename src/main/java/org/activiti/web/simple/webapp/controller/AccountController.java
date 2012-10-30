package org.activiti.web.simple.webapp.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.activiti.web.simple.webapp.service.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Resource(name="accountServiceImpl")
	private AccountService accountService;
	
	ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception{
		return null;
	}
	
	@RequestMapping("/login")
	public String login(){
		return "login";
	}
	
	@RequestMapping("/loginin")
	public String loginin(@PathVariable("username")String username,@PathVariable("password")String password,HttpServletRequest request, HttpServletResponse response){
		System.out.println(username);
		System.out.println(password);
		boolean b = accountService.checkPassword(username, password);
		String forword=b?"":"";
		return forword;
	}
	
	
}
