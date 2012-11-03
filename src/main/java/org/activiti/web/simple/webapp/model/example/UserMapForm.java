package org.activiti.web.simple.webapp.model.example;

import java.util.Map;

/**
 * 收集表单数据为HashMap
 * @author Administrator
 *
 */
public class UserMapForm {
	
	private Map<String,User> users;

	public Map<String, User> getUsers() {
		return users;
	}

	public void setUsers(Map<String, User> users) {
		this.users = users;
	}
	
	
}
