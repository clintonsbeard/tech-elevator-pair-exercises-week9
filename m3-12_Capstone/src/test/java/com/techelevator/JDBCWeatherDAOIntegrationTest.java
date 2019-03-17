package com.techelevator;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.jdbc.JDBCWeatherDAO;

public class JDBCWeatherDAOIntegrationTest extends DAOIntegrationTest {

	private JDBCWeatherDAO dao;
	private JdbcTemplate jdbcTemplate;
	
	@Before
	public void setupTest() {
	    dao = new JDBCWeatherDAO(getDataSource());
	    jdbcTemplate = new JdbcTemplate(getDataSource());
	}
	
	
	@Test
	public void get_all_five_days_of_forecast() {
		//Arrange
		//Act
		List<Weather> forecast = dao.getFiveDayForecast("GNP");
		int numberOfForecast = forecast.size();
		
		//Assert
		assertEquals(5, numberOfForecast);	
	}
	
	@Test
	public void get_correct_forecast() {
		//Arrange
		//Act
		List<Weather> forecasts = dao.getFiveDayForecast("GNP");
		//Assert
		assertEquals("snow", forecasts.get(0).getForecast());
		assertEquals("snow", forecasts.get(1).getForecast());
		assertEquals("partly cloudy", forecasts.get(2).getForecast());
		assertEquals("cloudy", forecasts.get(3).getForecast());
		assertEquals("snow", forecasts.get(4).getForecast());
	}
	


}
