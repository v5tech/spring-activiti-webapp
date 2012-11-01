package org.activiti.web.simple.webapp.service;

import org.activiti.web.simple.webapp.model.Leave;

public interface LeaveService {
	
	public void save(Leave leave);
	
	
	public Leave findById(String id);
	
}
