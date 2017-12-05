package com.example.model;
import java.util.*;

import com.example.demo.DataBase;

public class AllEventResponse {
	public int count;
	public List<Event> eventList;
	public AllEventResponse() {
		count = 0;
		eventList = new ArrayList();
	}
	public AllEventResponse(int count) {
		this.count = count;
		eventList = new ArrayList();
	}
	AllEventResponse(int count, List<Event> eventList) {
		this.count = count;
		this.eventList = eventList;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List<Event> getEventList() {
		return eventList;
	}
	public void setEventList(List<Event> eventList) {
		this.eventList = eventList;
	}
	
	public static AllEventResponse DummyResponse() {
		AllEventResponse res = new AllEventResponse(2);
		//res.eventList.add(new Event( "basketball game","2017-11-25T09:34:49.49","", "2017-11-25T09:34:49.49",1, "Beijing", 10));
		//res.eventList.add(new Event( "basketball game","2017-11-25T09:34:49.49", "","2017-11-25T09:34:49.49",1, "Beijing", 10));
		return res;
	}
	
	
}
