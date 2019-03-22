package com.techelevator.npgeek.model;

import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
		this.day = day - 1;
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
	
	public List<String> getAdvisories() {
		List<String> advisories = new ArrayList<>();
		String weatherAdvisory = getWeatherAdvisory();
		String tempAdvisory = getTempAdvisory();
		String differenceInTempAdvisory = getDifferenceInTempAdvisory();
		if (weatherAdvisory.equals("none") && tempAdvisory.equals("none")
			&& differenceInTempAdvisory.equals("none")) {
			advisories.add("No current advisories.  Enjoy!");
			return advisories;
		}
		if (!weatherAdvisory.equals("none")) {
			advisories.add(weatherAdvisory);
		}
		if (!tempAdvisory.equals("none")) {
			advisories.add(tempAdvisory);
		}
		if (!differenceInTempAdvisory.equals("none")) {
			advisories.add(differenceInTempAdvisory);
		}
		return advisories;
	}
	
	public String getWeatherAdvisory() {
		if (forecast.equals("rain")) {
			return "Pack rain gear and waterproof shoes!";
		}
		else if (forecast.equals("thunderstorms")) {
			return "Seek shelter and avoid hiking on exposed ridges!";
		}
		else if (forecast.equals("snow")) {
			return "Pack snow shoes!";
		}
		else if (forecast.equals("sunny")) {
			return "Pack sunblock!";
		}
		return "none";
	}
	
	public String getTempAdvisory() {
		if (highTemperature > 75 || lowTemperature > 75) {
			return "Bring an extra gallon of water!";
		}
		else if (highTemperature < 20 || lowTemperature < 20) {
			return "Danger! Frigid temperatures! FROST BITE may occur";
		}
		return "none";
	}
	
	public String getDifferenceInTempAdvisory() {
		if (highTemperature - lowTemperature > 20) {
			return "Wear breathable layers!";
		}
		return "none";
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
	    calendar.add(Calendar.DAY_OF_WEEK, day);
	    Date futureDate = calendar.getTime();
	    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("EEEE");
	    String futureDateString = simpleDateFormat.format(futureDate);

	    return futureDateString;
	}
	
	public String capitalizeFirstLetter(String word) {
		String firstLetter = word.substring(0, 1).toUpperCase();
		String fixedWord = firstLetter + word.substring(1).toLowerCase();
		return fixedWord;
	}
}