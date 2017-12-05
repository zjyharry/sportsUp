package com.example.model;


public class EventDetailRequest {
		private int eventId;
		private String 	userId;
		
		
		public EventDetailRequest() {
			super();
		}

		public EventDetailRequest(int eventId, String userId) {
			super();
			this.eventId = eventId;
			this.userId = userId;
		}
		
		public int getEventId() {
			return eventId;
		}
		public void setEventId(int eventId) {
			this.eventId = eventId;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		
		
}
