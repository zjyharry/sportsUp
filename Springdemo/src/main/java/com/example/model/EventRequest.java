package com.example.model;

public class EventRequest {
	private Event newEvent;
	private String userId;
	
	public Event getNewEvent() {
		return newEvent;
	}
	public void setNewEvent(Event newEvent) {
		this.newEvent = newEvent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public EventRequest() {
		super();
	}
	public EventRequest(Event newEvent, String userId) {
		super();
		this.newEvent = newEvent;
		this.userId = userId;
	}	
}
