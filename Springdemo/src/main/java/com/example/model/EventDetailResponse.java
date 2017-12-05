package com.example.model;
import com.example.model.*;
import java.util.*;

public class EventDetailResponse {

       	public Event event;
       	public List<User> users;
		public EventDetailResponse(Event event, List<User> users) {
			super();
			this.event = event;
			this.users = users;
		}
		public EventDetailResponse() {
			super();
		}
       	
}
