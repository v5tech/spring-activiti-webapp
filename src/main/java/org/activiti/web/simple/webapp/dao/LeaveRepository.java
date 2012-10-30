package org.activiti.web.simple.webapp.dao;

import org.activiti.web.simple.webapp.model.Leave;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * 使用Spring Data JPA操作请假流程
 * @author scott
 *
 */
public interface LeaveRepository extends PagingAndSortingRepository<Leave, Long>{
	
	
	
}
