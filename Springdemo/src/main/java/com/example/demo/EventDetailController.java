package com.example.demo;

import java.util.*;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.RestController;

import com.example.model.*;
import com.example.demo.*;
import com.example.demo.*;
/*
 * local:8080/eventdetail
{
  "eventId" : 12,
  "userId" : "Jiawei"
}
{
    "event": {
        "eventName": "hello",
        "startTime": "hello",
        "descr": "hello",
        "endTime": "hello",
        "eventId": 1,
        "location": "hello",
        "capacity": "hello"
    },
    "userId": "Jiawei"
}



*/

@RestController
public class EventDetailController {

    
	 @RequestMapping(value = "/eventdetail", method = RequestMethod.POST)
	 public @ResponseBody EventDetailResponse eventDetail(@RequestBody EventDetailRequest eventreq) {
		
		// get event element from database here
		 int id = eventreq.getEventId();
		 Event eve = DataBase.eventMap.get(id).event;
		 List<User> responseUserlist = new ArrayList<>();
		 Set<String> userlist = DataBase.eventMap.get(id).userSet; 
		 for(String us: userlist) {
			 User curuser = DataBase.userMap.get(us).user;
			 responseUserlist.add(curuser);
		 }
		 return new EventDetailResponse(eve, responseUserlist);
	 }
}
