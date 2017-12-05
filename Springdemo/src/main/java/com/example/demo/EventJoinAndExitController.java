package com.example.demo;
//import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.*;

import com.example.model.*;


@RestController
public class EventJoinAndExitController {
	
  @RequestMapping(value = "/event_join", method = RequestMethod.POST)
  public @ResponseBody EventJoinAndExitResponse eventJoinResponse (@RequestBody EventJoinAndExitRequest jsonString){
  		
	  	EventJoinAndExitRequest eventreq = jsonString;
	  	
		boolean Succuess = false;
		boolean EventFull = false;
		try {
			if(DataBase.eventMap.get(eventreq.getEventId()).event.getCapacity()>0) {
    			//add to userMap
    	  			DataBase.userMap.get(eventreq.getUserId()).eventSet.add(eventreq.getEventId());
    	  	
    	  		//add to eventMap
    	  			DataBase.eventMap.get(eventreq.getEventId()).userSet.add(eventreq.getUserId());
    	  			DataBase.eventMap.get(eventreq.getEventId()).event.setCapacity(DataBase.eventMap.get(eventreq.getEventId()).event.getCapacity()-1);
    	  			Succuess = true;
			}
			else {
				EventFull = true;
				Succuess = false;
			}
		}
		catch(Exception ex) {
			Succuess = false;
		}

		
		//search and Add the event into database
		//Succuess = true;
		//set the Dummy statusCode here
		if(Succuess)
			return new EventJoinAndExitResponse(1);
		else if(!Succuess && EventFull)
			return new EventJoinAndExitResponse(503);
		else
			return new EventJoinAndExitResponse(500);
  }
  
  @RequestMapping(value = "/event_exit", method = RequestMethod.POST)
  public @ResponseBody EventJoinAndExitResponse eventExitResponse (@RequestBody EventJoinAndExitRequest jsonString){
  		
	  	EventJoinAndExitRequest eventreq = jsonString;
	  	
		boolean Succuess = false;
		try {
    	  		DataBase.userMap.get(eventreq.getUserId()).eventSet.remove(eventreq.getEventId());
    	  	
    	  		//add to eventMap
    	  		DataBase.eventMap.get(eventreq.getEventId()).userSet.remove(eventreq.getUserId());
    	  		DataBase.eventMap.get(eventreq.getEventId()).event.setCapacity(DataBase.eventMap.get(eventreq.getEventId()).event.getCapacity()+1);
    	  		Succuess = true;
		}
		catch(Exception ex) {
			Succuess = false;
		}

		
		//search and Add the event into database
		//Succuess = true;
		//set the Dummy statusCode here
		if(Succuess)
			return new EventJoinAndExitResponse(1);
		else
			return new EventJoinAndExitResponse(500);
  }
}

