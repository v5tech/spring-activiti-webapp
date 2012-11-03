package org.activiti.web.simple.webapp.model.example;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 表单实体
 * @author Administrator
 *
 */
public class User {
	
	private String firstName;  
	  
	private String lastName;
	
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
	private Date birthday;
	 
	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	 
	
	    
}
