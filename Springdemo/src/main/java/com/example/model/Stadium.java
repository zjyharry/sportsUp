package com.example.model;

public class Stadium {
	
	public Stadium() {
		super();
	}


	private int stadiumId;
   


	private String location;
    private String descr;
    private double longtitude, latitute;
    private int capacity;
	public int getStadiumId() {
		return stadiumId;
	}
	public void setStadiumId(int stadiumId) {
		this.stadiumId = stadiumId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public double getLongtitude() {
		return longtitude;
	}
	public void setLongtitude(double longtitude) {
		this.longtitude = longtitude;
	}
	public double getLatitute() {
		return latitute;
	}
	public void setLatitute(double latitute) {
		this.latitute = latitute;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public Stadium(int stadiumId, String location, String descr, double longtitude, double latitute, int capacity) {
		super();
		this.stadiumId = stadiumId;
		this.location = location;
		this.descr = descr;
		this.longtitude = longtitude;
		this.latitute = latitute;
		this.capacity = capacity;
	}

}
