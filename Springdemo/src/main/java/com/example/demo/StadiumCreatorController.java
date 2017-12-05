package com.example.demo;

import com.example.demo.DataBase.StadiumInfo;
import com.example.model.*;
import org.springframework.web.bind.annotation.*;
import java.util.*;
@RestController
public class StadiumCreatorController {
	/***********
	Localhost: localhost:8080/createstadium
	{
	    "stadiumId": "1",
	    "descr": "hello",
	    "location": "SU",
	    "capacity": 10
    }
	***********/
	 @RequestMapping("/createstadium")
	 public @ResponseBody StadiumCreatorResponse createStadium(@RequestBody Stadium createSta) {
		//check database 
		 if(DataBase.stadiumMap.containsKey(createSta.getStadiumId()) ) {
			  return new StadiumCreatorResponse(0);
		 }
		 DataBase.StadiumInfo si = new StadiumInfo();
		 si.eventSet = new HashSet<Integer>();
		 si.stadium = createSta;
		 DataBase.stadiumMap.put(createSta.getStadiumId(), si);
		 return new StadiumCreatorResponse(1);
	 }
}