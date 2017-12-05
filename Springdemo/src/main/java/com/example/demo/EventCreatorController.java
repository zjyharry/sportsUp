package com.example.demo;
import java.util.HashSet;
import java.util.Set;

//import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.*;

import com.example.model.*;


@RestController
public class EventCreatorController {
	public Set<Integer> testset = new HashSet();
	/**************
	localhost:8080/event_creator
	{
  "newEvent" : {
    “eventName” : “basketball game” // Tian You modified
    "startTime" : "2017-11-25T09:47:50",
    "descr" : "123",
    "endTime" : "2017-11-25T09:47:50",
    "eventId" : 1,
    "location" : "Beijing",
    "capacity" : 15
  				},
  	"userId" : "hello"
	}	
	 */
    @RequestMapping(value = "/event_creator", method = RequestMethod.POST)
    public @ResponseBody EventResponse evenResponse (@RequestBody EventRequest jsonString){
    		
    	
    		EventRequest eventreq = jsonString;
    		boolean Succuess = false;
    		boolean StadiumFull = false;
    		try {
    		
        		int a =DataBase.stadiumMap.size();
        		
    			if(DataBase.stadiumMap.get(eventreq.getNewEvent().getLocation()).stadium.getCapacity()>0) {
    				//add to userMap
    				
            	  //	
            	  	
            	  	//add to eventMap
            	  	Event event = new Event();
            	  	event = eventreq.getNewEvent();
            	  	DataBase.EventInfo eventinfo = new DataBase.EventInfo();
            	  	event.setCapacity(event.getCapacity()-1);
            	  	eventinfo.event = event;
            	  	eventinfo.userSet.add(eventreq.getUserId());
            	  	DataBase.eventMap.put(++DataBase.total_event_id,eventinfo);

            	  	event.setEventId(DataBase.total_event_id);
            	  	DataBase.userMap.get(eventreq.getUserId()).eventSet.add(DataBase.total_event_id);
            	  	
            	  	
            	  	//add to StadiumMap
            	  	DataBase.stadiumMap.get(eventreq.getNewEvent().getLocation()).eventSet.add(eventreq.getNewEvent().getEventId());
            	  	Stadium curstatidum = DataBase.stadiumMap.get(eventreq.getNewEvent().getLocation()).stadium;
            	  	curstatidum.setCapacity(curstatidum.getCapacity()-1);
            	  //	int tmp = DataBase.stadiumMap.get(eventreq.getNewEvent().getLocation()).stadium.getCapacity()-1;
            	  //	DataBase.stadiumMap.get(eventreq.getNewEvent().getLocation()).stadium.setCapacity(tmp);
            	  	Succuess = true;
    			}
    			else {
    				Succuess = false;
    				StadiumFull = true; 				
    			}

//        	  	
    		}catch(Exception ex){
    			Succuess = false;
    		}

    		
    		//search and Add the event into database
    		//Succuess = true;
    		//set the Dummy statusCode here
    		if(Succuess)
    			return new EventResponse(1);
    		else if(!Succuess && StadiumFull)
    			return new EventResponse(501);
    		else
    			return new EventResponse(500);
    }
}
