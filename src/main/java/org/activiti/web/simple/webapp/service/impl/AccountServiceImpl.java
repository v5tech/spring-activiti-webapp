package org.activiti.web.simple.webapp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.GroupQuery;
import org.activiti.engine.identity.Picture;
import org.activiti.engine.identity.User;
import org.activiti.engine.identity.UserQuery;
import org.activiti.engine.impl.identity.Account;
import org.activiti.web.simple.webapp.service.AccountService;
import org.springframework.stereotype.Service;

@Service("accountServiceImpl")
public class AccountServiceImpl implements AccountService {
	
	@Resource(name="identityService")
	private IdentityService identityService;

	public User newUser(String userId) {
		return identityService.newUser(userId);
	}

	public void saveUser(User user) {
		identityService.saveUser(user);
	}

	public UserQuery createUserQuery() {
		return identityService.createUserQuery();
	}

	public void deleteUser(String userId) {
		identityService.deleteUser(userId);
	}

	public Group newGroup(String groupId) {
		return identityService.newGroup(groupId);
	}

	public GroupQuery createGroupQuery() {
		return identityService.createGroupQuery();
	}

	public void saveGroup(Group group) {
		identityService.saveGroup(group);		
	}

	public void deleteGroup(String groupId) {
		identityService.deleteGroup(groupId);
	}

	public void createMembership(String userId, String groupId) {
		identityService.createMembership(userId, groupId);
	}

	public void deleteMembership(String userId, String groupId) {
		identityService.deleteMembership(userId, groupId);		
	}

	public boolean checkPassword(String userId, String password) {
		return identityService.checkPassword(userId, password);
	}

	public void setAuthenticatedUserId(String authenticatedUserId) {
		identityService.setAuthenticatedUserId(authenticatedUserId);
	}

	public void setUserPicture(String userId, Picture picture) {
		identityService.setUserPicture(userId, picture);
	}

	public Picture getUserPicture(String userId) {
		return identityService.getUserPicture(userId);
	}

	public void setUserInfo(String userId, String key, String value) {
		identityService.setUserInfo(userId, key, value);
	}

	public String getUserInfo(String userId, String key) {
		return identityService.getUserInfo(userId, key);
	}

	public List<String> getUserInfoKeys(String userId) {
		return identityService.getUserInfoKeys(userId);
	}

	public void deleteUserInfo(String userId, String key) {
		identityService.deleteUserInfo(userId, key);
	}

	public void setUserAccount(String userId, String userPassword,
			String accountName, String accountUsername, String accountPassword,
			Map<String, String> accountDetails) {
		identityService.setUserAccount(userId, userPassword, accountName, accountUsername, accountPassword, accountDetails);
	}

	public List<String> getUserAccountNames(String userId) {
		return identityService.getUserAccountNames(userId);
	}

	public Account getUserAccount(String userId, String userPassword,
			String accountName) {
		return identityService.getUserAccount(userId, userPassword, accountName);
	}

	public void deleteUserAccount(String userId, String accountName) {
		identityService.deleteUserAccount(userId, accountName);
	} 
	
}
