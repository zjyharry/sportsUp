package com.example.model;

public class StadiumResponse {
	 private int statusCode;

		public int getStatusCode() {
			return statusCode;
		}

		public void setStatusCode(int statusCode) {
			this.statusCode = statusCode;
		}

		public StadiumResponse(int statusCode) {
			super();
			this.statusCode = statusCode;
		}

		public StadiumResponse() {
			super();
		}

}
