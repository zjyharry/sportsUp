package com.example.model;

public class EventResponse {
	private int statusCode;

	public EventResponse() {
		super();
	}	
	public EventResponse(int statusCode) {//Constructor
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
