package com.techelevator.npgeek.model;

public class Weather {

	private String parkCode;
	private int day;
	private int lowTemperature;
	private int highTemperature;
	private String forecast;
	
	public String getParkCode() {
		return parkCode;
	}
	public void setParkCode(String parkCode) {
		this.parkCode = parkCode;
	}

	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
	public int getLowTemperature() {
		return lowTemperature;
	}
	public void setLowTemperature(int lowTemperature) {
		this.lowTemperature = lowTemperature;
	}
	
	public int getHighTemperature() {
		return highTemperature;
	}
	public void setHighTemperature(int highTemperature) {
		this.highTemperature = highTemperature;
	}
	
	public String getForecast() {
		return forecast;
	}
	public void setForecast(String forecast) {
		this.forecast = forecast;
	}

}