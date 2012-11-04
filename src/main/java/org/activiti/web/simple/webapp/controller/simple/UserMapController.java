package org.activiti.web.simple.webapp.controller.simple;

import java.util.Map;
import java.util.Set;

import org.activiti.web.simple.webapp.model.example.User;
import org.activiti.web.simple.webapp.model.example.UserMapForm;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserMapController {
	
	@RequestMapping(value="/usermap",method={RequestMethod.POST})
	public String test(UserMapForm userMapForm){
		
		Map<String, User> map = userMapForm.getUsers();
		Set<String> keySet = map.keySet();
		
		for (String key : keySet) {
			System.out.println(key+"\t"+map.get(key).getFirstName()+"\t"+map.get(key).getLastName()+"\t"+map.get(key).getBirthday());
		}
		
		return "";
	}
	
}
