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
	
	public String getWeatherAdvisory() {
		 
		if (forecast.equals("rain")) {
			return "Pack rain gear and waterproof shoes!";
		} else if (forecast.equals("thunderstorms")) {
			return "Seek shelter and avoid hiking on exposed ridges!";
		} else if (forecast.equals("snow")) {
			return "Pack snow shoes!";
		} else if (forecast.equals("sunny")) {
			return "Pack sunblock!";
		}
		return "";
	}
	
	public String getTempAdvisory() {
		
		if (highTemperature > 75 || lowTemperature > 75) {
			return "Bring an extra gallon of water!";
		} else if (highTemperature < 20 || lowTemperature < 20) {
			return "Danger! Frigid temperatures! FROST BITE may occur";
		}
		return "";
	}
	
	public String getDifferenceInTempAdvisory() {
		if (highTemperature - lowTemperature > 20) {
			return "Wear breathable layers!";
		}
		return "";
	}
	
	public String getConversionLowTempToCelsius() {
		int lowInt = (int) ((lowTemperature - 32) / 1.8);
		String low = Integer.toString(lowInt);
		return low;
	}
	
	public String getConversionHighTempToCelsius() {
		int lowInt = (int) ((highTemperature - 32) / 1.8);
		String low = Integer.toString(lowInt);
		return low;
	}
	

}