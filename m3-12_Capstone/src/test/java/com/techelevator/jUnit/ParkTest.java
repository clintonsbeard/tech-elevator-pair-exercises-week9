package com.techelevator.jUnit;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.assertEquals;

import com.techelevator.npgeek.model.Park;



public class ParkTest {
	
	private Park target;

	@Before
	public void setup() {
		target = new Park();
	}

	@Test
	public void commas_format_correctly_after_3_digits() {
		//Arrange
		//Act
		String actual = target.formatNumberWithCommas(1873900983);
		//Assert
		assertEquals("1,873,900,983",actual);
	}
	
	@Test
	public void integers_format_correctly_as_money_value() {
		//Arrange
		//Act
		String actual = target.formatMoney(47);
		//Assert
		assertEquals("$47.00",actual);
	}
	
}