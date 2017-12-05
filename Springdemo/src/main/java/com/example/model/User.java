package com.example.model;

public class User {
     private String Name;
     private int gender;
     private String userId;
     private String email;
     private String password;
     
     public User() {
		super();
	}


	public User(String name, int gender, String userId, String email, String password) {
 		super();
 		Name = name;
 		this.gender = gender;
 		this.userId = userId;
 		this.email = email;
 		this.password = password;
 	}
      
     
	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

     
}
