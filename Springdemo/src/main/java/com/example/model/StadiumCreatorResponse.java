package com.example.model;

public class StadiumCreatorResponse {
	 private int statusCode;

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public StadiumCreatorResponse(int statusCode) {
		super();
		this.statusCode = statusCode;
	}

	public StadiumCreatorResponse() {
		super();
	}

}
