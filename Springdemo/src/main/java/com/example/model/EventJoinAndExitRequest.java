package com.example.model;

public class EventJoinAndExitRequest {
	private int eventId;
	private String userId;
	
	
	public EventJoinAndExitRequest() {
		super();
	}
	public EventJoinAndExitRequest(int eventId, String userId) {
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