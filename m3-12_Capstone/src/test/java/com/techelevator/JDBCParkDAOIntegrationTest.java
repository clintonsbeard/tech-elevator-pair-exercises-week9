package com.techelevator;

import static org.junit.Assert.assertEquals;

import java.sql.SQLException;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;

public class JDBCParkDAOIntegrationTest extends DAOIntegrationTest {

	private String parkCode;
	private static SingleConnectionDataSource dataSource;
	private JDBCParkDAO dao;
	private JdbcTemplate jdbcTemplate;

	@Before
	public void setupTest() {
		dao = new JDBCParkDAO(dataSource);
		jdbcTemplate = new JdbcTemplate(dataSource);
		clearParkTable();
		String createParkSql = "INSERT INTO park (name, state, acreage, elevationfeet, milesOfTrail, numberOfcampsites, climate, yearfounded, " +
								"annualvisitorcount, inspirationalquote, inspirationalquotesource, parkdescription, entryfee, numberofanimalspecies " +
								"VALUES ('testName','testState', 3, 90, 4, 5, 'testClimate', '1949', " + 
								"100, 'The test inspirational quote of the park selected.', 'John', 'This is a test description of park', 20, 4)";
	}

	
	@Test
	public void all_parks_listed() {
		
	}
	
	private void clearParkTable() {
		String truncateParkTableSql = "TRUNCATE park CASCADE";
		jdbcTemplate.update(truncateParkTableSql);
	}
	
	private Park getPark(String name, String state, int acreage, int elevationInFeet, int milesOfTrail, 
						int numberOfCampsites, String climate, String yearFounded, int annualVisitorCount, 
						String inspirationalQuote, String inspirationalQuoteSource, String parkDescription, 
						int entryFee, int numberOfAnimalSpecies) {
		
		Park testPark = new Park();
		testPark.setName(name);
		testPark.setState(state);
		testPark.setAcreage(acreage);
		testPark.setElevationInFeet(elevationInFeet);
		testPark.setMilesOfTrail(milesOfTrail);
		testPark.setNumberOfCampsite(numberOfCampsites);
		testPark.setClimate(climate);
		testPark.setYearFounded(yearFounded);
		testPark.setAnnualVisitorCount(annualVisitorCount);
		testPark.setParkDescription(parkDescription);
		testPark.setInspirationalQuote(inspirationalQuote);
		testPark.setInspirationalQuoteSource(inspirationalQuoteSource);
		testPark.setEntryFee(entryFee);
		testPark.setNumberOfAnimalSpecies(numberOfAnimalSpecies);
		return testPark;
	}
}
