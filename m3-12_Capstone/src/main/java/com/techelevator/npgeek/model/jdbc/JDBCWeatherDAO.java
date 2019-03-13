package com.techelevator.npgeek.model.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.WeatherDAO;

@Component
public class JDBCWeatherDAO implements WeatherDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCWeatherDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public Weather mapRowToWeather(SqlRowSet results) {
		Weather weather = new Weather();
		weather.setParkCode(results.getString("parkcode"));
		weather.setDay(results.getInt("fivedayforecastvalue"));
		weather.setLowTemperature(results.getInt("low"));
		weather.setHighTemperature(results.getInt("high"));
		weather.setForecast(results.getString("forecast"));
		return weather;
	}
	
	@Override
	public List<Weather> getFiveDayForecast(String parkCode) {
		List<Weather> weather = new ArrayList<>();
		
		String sqlAllParks = "SELECT * FROM weather WHERE parkcode = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlAllParks, parkCode);

		while (results.next()) {
			Weather w = mapRowToWeather(results);
			weather.add(w);
		}
		return weather;
	}
	
}