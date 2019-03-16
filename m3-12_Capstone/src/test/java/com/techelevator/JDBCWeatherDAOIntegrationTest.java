package com.techelevator;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.jdbc.JDBCWeatherDAO;

public class JDBCWeatherDAOIntegrationTest extends DAOIntegrationTest {

	private String parkCode;
	private static SingleConnectionDataSource dataSource;
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
}
