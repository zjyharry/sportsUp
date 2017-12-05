package com.example.demo;
import com.example.model.*;
import org.springframework.web.bind.annotation.*;

@RestController
public class StadiumController {
	/***********
	Localhost: localhost:8080/requirestadium
	{
	    "location": "SU"
    }
	***********/
	 @RequestMapping("/requirestadium")
	 public @ResponseBody StadiumResponse createStadium(@RequestBody String location) {
		//check database 
		  
		 
		 return new StadiumResponse(2);
	 }
}