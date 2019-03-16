package com.techelevator.jUnit;

import org.junit.*;

import static org.junit.Assert.assertEquals;

import com.techelevator.npgeek.model.Weather;

public class WeatherTest {
	
	private Weather target;
	
	@Before
	public void setup() {
		target = new Weather();
	}
	
	@Test
	public void rain_forecast_returns_correct_advisory_statement() {
		//Arrange
		target.setForecast("rain");
		//Act
		String actual = target.getWeatherAdvisory();
		//Assert
		assertEquals("Pack rain gear and waterproof shoes!", actual);
		
	}
	
	@Test
	public void thunderstorms_forecast_returns_correct_advisory_statement() {
		//Arrange
		target.setForecast("thunderstorms");
		//Act
		String actual = target.getWeatherAdvisory();
		//Assert
		assertEquals("Seek shelter and avoid hiking on exposed ridges!", actual);
		
	}
	
	@Test
	public void snow_forecast_returns_correct_advisory_statement() {
		//Arrange
		target.setForecast("snow");
		//Act
		String actual = target.getWeatherAdvisory();
		//Assert
		assertEquals("Pack snow shoes!", actual);
		
	}
	
	@Test
	public void sunny_forecast_returns_correct_advisory_statement() {
		//Arrange
		target.setForecast("sunny");
		//Act
		String actual = target.getWeatherAdvisory();
		//Assert
		assertEquals("Pack sunblock!", actual);
	}
	
	@Test
	public void high_temp_higher_than_75_returns_correct_advisory_statement() {
		//Arrange
		target.setHighTemperature(88);
	
		//Act
		String actual = target.getTempAdvisory();
		//Assert
		assertEquals("Bring an extra gallon of water!", actual);
	}
	
	@Test
	public void low_temp_higher_than_75_returns_correct_advisory_statement() {
		//Arrange
		target.setLowTemperature(88);
		
		//Act
		String actual = target.getTempAdvisory();
		
		//Assert
		assertEquals("Bring an extra gallon of water!", actual);
	}
	
	@Test
	public void temp_diff_higher_than_20_returns_correct_advisory_statement() {
		//Arrange
		target.setHighTemperature(70);
		target.setLowTemperature(45);
		
		//Act
		String actual = target.getDifferenceInTempAdvisory();
		
		//Assert
		assertEquals("Wear breathable layers!", actual);
	}
	
	@Test
	public void temp_diff_higher_than_20_returns_correct_advisory_statement_and_higher_than_20() {
		//Arrange
		target.setHighTemperature(80);
		target.setLowTemperature(45);
		
		//Act
		String actual = target.getDifferenceInTempAdvisory();
		
		//Assert
		assertEquals("Wear breathable layers!", actual);
	}
	
	@Test
	public void high_temp_lower_than_20_returns_correct_advisory_statement() {
		//Arrange
		target.setHighTemperature(18);
	
		//Act
		String actual = target.getTempAdvisory();
		//Assert
		assertEquals("Danger! Frigid temperatures! FROST BITE may occur", actual);
	}
	
	@Test
	public void low_temp_lower_than_20_returns_correct_advisory_statement() {
		//Arrange
		target.setLowTemperature(18);
		
		//Act
		String actual = target.getTempAdvisory();
		
		//Assert
		assertEquals("Danger! Frigid temperatures! FROST BITE may occur", actual);
	}
	 
	@Test
	public void low_temp_calculation_returns_correct_celsius_conversion() {
		//Arrange
		target.setLowTemperature(67);
		
		//Act
		String actual = target.getConversionLowTempToCelsius();
		
		//Assert
		assertEquals("19", actual);
	}
	
	@Test
	public void high_temp_calculation_returns_correct_celsius_conversion() {
		//Arrange
		target.setHighTemperature(67);
		
		//Act
		String actual = target.getConversionHighTempToCelsius();
		
		//Assert
		assertEquals("19", actual);
	}
	
	
	

}
