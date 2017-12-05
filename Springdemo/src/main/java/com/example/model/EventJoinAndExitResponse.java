package com.example.model;

public class EventJoinAndExitResponse {
	private int statusCode;

	public EventJoinAndExitResponse() {
		super();
	}	
	public EventJoinAndExitResponse(int statusCode) {//Constructor
		super();
		this.statusCode = statusCode;
	}
	public int getStatusCode() {//getter
		return statusCode;
	}

	public void setStatusCode(int statusCode) {//setter
		this.statusCode = statusCode;
	}
}
