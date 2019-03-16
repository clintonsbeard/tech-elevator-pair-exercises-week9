package com.techelevator.npgeek.model;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Calendar;

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
		int highInt = (int) ((highTemperature - 32) / 1.8);
		String high = Integer.toString(highInt);
		return high;
	}
	
	public String getDayOfTheWeek(int day) {
		Calendar calendar = Calendar.getInstance();
		int currentDay = calendar.get(Calendar.DAY_OF_WEEK);
		int dayOfWeek = (currentDay + day) - 2;
		if (dayOfWeek > 7) {
			dayOfWeek = dayOfWeek - 7;
		}
		String dayCapitalized = DayOfWeek.of(dayOfWeek).toString();
		String dayOfTheWeek = capitalizeFirstLetter(dayCapitalized);
		return dayOfTheWeek;
	}
	
	public String capitalizeFirstLetter(String word) {
		String firstLetter = word.substring(0, 1).toUpperCase();
		String fixedWord = firstLetter + word.substring(1).toLowerCase();
		return fixedWord;
	}
}