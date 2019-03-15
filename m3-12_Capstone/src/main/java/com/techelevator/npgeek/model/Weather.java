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
	
	public String convertLowToCelsiusAndFormat() {
		double lowDouble = (lowTemperature - 32.0) / 1.8;
		int lowInt = (int) lowDouble;
		String lowString = lowInt + "°C";
		return lowString;
	}
	
	public String convertHighToCelsiusAndFormat() {
		double highDouble = (highTemperature - 32.0) / 1.8;
		int highInt = (int) highDouble;
		String highString = highInt + "°C";
		return highString;
	}
	
	public String formatLowFahrenheit() {
		String lowString = lowTemperature + "°F";
		return lowString;
	}
	
	public String formatHighFahrenheit() {
		String highString = highTemperature + "°F";
		return highString;
	}
	
}