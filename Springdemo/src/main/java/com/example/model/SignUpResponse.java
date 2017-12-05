package com.example.model;

public class SignUpResponse {
	int statusCode;

	public SignUpResponse(int statusCode) {
		super();
		this.statusCode = statusCode;
	}

	
	public int getStatusCode() {
		return statusCode;
	}

	
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}
	
}
