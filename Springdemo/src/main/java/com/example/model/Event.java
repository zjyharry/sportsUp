package com.example.model;

public class Event {
		private String eventName;
		private String startTime;
		private String descr;
		private String classification;
		public String getClassification() {
			return classification;
		}

		public void setClassification(String classification) {
			this.classification = classification;
		}
		private String endTime;
		private int eventId;
		private int location;
		private int capacity;
			
		
		public Event() {
			super();
		}

		public Event(String eventName, String startTime, 
				String descr, String classification, String endTime, int eventId, int location,
				int capacity) {
			super();
			this.eventName = eventName;
			this.startTime = startTime;
			this.descr = descr;
			this.classification = classification;
			this.endTime = endTime;
			this.eventId = eventId;
			this.location = location;
			this.capacity = capacity;
		}
			
		public String getEventName() {
			return eventName;
		}
		public void setEventName(String eventName) {
			this.eventName = eventName;
		}
		public String getStartTime() {
			return startTime;
		}
		public void setStartTime(String startTime) {
			this.startTime = startTime;
		}
		public String getDescr() {
			return descr;
		}
		public void setDescr(String descr) {
			this.descr = descr;
		}
		public String getEndTime() {
			return endTime;
		}
		public void setEndTime(String endTime) {
			this.endTime = endTime;
		}
		public int getEventId() {
			return eventId;
		}
		public void setEventId(int eventId) {
			this.eventId = eventId;
		}
		public int getLocation() {
			return location;
		}
		public void setLocation(int location) {
			this.location = location;
		}
		public int getCapacity() {
			return capacity;
		}
		public void setCapacity(int capacity) {
			this.capacity = capacity;
		}	
		
		
	
}
