
package com.example.demo;

import org.springframework.web.bind.annotation.*;

import com.example.model.*;
import java.util.*;
@RestController
public class UserController {
	
	    
	 @RequestMapping("/usercreator")
	 public @ResponseBody UserResponse user(@RequestBody User us1) {
		
		  boolean res = !DataBase.userMap.containsKey(us1.getUserId());
		  
		  if(res == true)
			  DataBase.userMap.put(us1.getUserId(), new DataBase.UserInfo(us1, new HashSet<>()));
		 
		 return new UserResponse(res);
	 }
	 
	 @RequestMapping("/usersignin")
	 public @ResponseBody UserResponse usersignin(@RequestBody User us1) {
		 boolean res = DataBase.userMap.containsKey(us1.getUserId()) && 
				 us1.getPassword().equals(DataBase.userMap.get(us1.getUserId()).user.getPassword());
		 return new UserResponse(res);
	 }
	 
	 
	 @RequestMapping("/userprofile")
	 public @ResponseBody User userprofile(@RequestBody User us1) {
		 String userId = us1.getUserId();
		 return DataBase.userMap.get(userId).user;
	 }
}
 