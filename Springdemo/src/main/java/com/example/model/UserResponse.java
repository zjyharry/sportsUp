package com.example.model;

public class UserResponse {
        private boolean statusCode;

		public boolean isStatusCode() {
			return statusCode;
		}

		public void setStatusCode(boolean statusCode) {
			this.statusCode = statusCode;
		}

		public UserResponse(boolean statusCode) {
			super();
			this.statusCode = statusCode;
		}

		public UserResponse() {
			super();
		}
           
           
}
