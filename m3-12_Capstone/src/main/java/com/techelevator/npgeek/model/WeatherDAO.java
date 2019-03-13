package com.techelevator.npgeek.model;

import java.util.List;

import org.springframework.jdbc.support.rowset.SqlRowSet;

public interface WeatherDAO {

	public Weather mapRowToWeather(SqlRowSet results);
	
	public List<Weather> getFiveDayForecast(String parkCode);
	
}