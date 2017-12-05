package com.example.demo;

import com.example.model.*;
import java.util.concurrent.atomic.AtomicLong;
import org.springframework.web.bind.annotation.*;
@RestController
public class AllEventController {
	/******** demo request
	 * localhost:8080/allevent
	{
	"eventId" : 12,
	"userId" : "jiawei"
	}

	 */
	
	
	@RequestMapping(value = "/allevent", method = RequestMethod.POST)
    public @ResponseBody AllEventResponse greeting(@RequestBody AllEventRequest body) {
		int count = DataBase.eventMap.size();
		AllEventResponse response = new AllEventResponse(count);
		
		for(DataBase.EventInfo einfo : DataBase.eventMap.values()) {
			response.eventList.add(einfo.event);
		}
		return response;
    }
	
	
	@RequestMapping(value = "/myevent", method = RequestMethod.POST)
    public @ResponseBody AllEventResponse getMyevent(@RequestBody AllEventRequest body) {
		int count = DataBase.userMap.get(body.getUserId()).eventSet.size();
		AllEventResponse response = new AllEventResponse(count);
		for(int einfo : DataBase.userMap.get(body.getUserId()).eventSet) {
			response.eventList.add(DataBase.eventMap.get( einfo).event);
		}
		return response;
    }
}



/*****
demo response
{
    "count": 2,
    "eventList": [
        {
            "eventName": "basketball game",
            "startTime": "2017-11-25T09:34:49.49",
            "descr": "",
            "endTime": "2017-11-25T09:34:49.49",
            "eventId": 1,
            "location": "Beijing",
            "capacity": 10
        },
        {
            "eventName": "basketball game",
            "startTime": "2017-11-25T09:34:49.49",
            "descr": "",
            "endTime": "2017-11-25T09:34:49.49",
            "eventId": 1,
            "location": "Beijing",
            "capacity": 10
        }
    ]
}
***/