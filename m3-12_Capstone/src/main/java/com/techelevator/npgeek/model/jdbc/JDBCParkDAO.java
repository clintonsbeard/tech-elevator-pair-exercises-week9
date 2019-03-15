package com.techelevator.npgeek.model.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;

@Component
public class JDBCParkDAO implements ParkDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public JDBCParkDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public Park mapRowToPark(SqlRowSet results) {
		Park park = new Park();
		park.setCode(results.getString("parkcode"));
		park.setName(results.getString("parkname"));
		park.setState(results.getString("state"));
		park.setAcreage(results.getInt("acreage"));
		park.setElevationInFeet(results.getInt("elevationinfeet"));
		park.setMilesOfTrail(results.getDouble("milesoftrail"));
		park.setNumberOfCampsites(results.getInt("numberofcampsites"));
		park.setClimate(results.getString("climate"));
		park.setYearFounded(results.getString("yearfounded"));
		park.setAnnualVisitorCount(results.getInt("annualvisitorcount"));
		park.setInspirationalQuote(results.getString("inspirationalquote"));
		park.setInspirationalQuoteSource(results.getString("inspirationalquotesource"));
		park.setParkDescription(results.getString("parkdescription"));
		park.setEntryFee(results.getInt("entryfee"));
		park.setNumberOfAnimalSpecies(results.getInt("numberofanimalspecies"));
		return park;
	}
	
	@Override
	public Park mapRowToFavoritePark(SqlRowSet results) {
		Park park = new Park();
		park.setName(results.getString("parkname"));
		park.setSurveyCount(results.getInt("surveycount"));
		return park;
	}

	@Override
	public List<Park> getAllParks() {
		List<Park> parks = new ArrayList<>();
		
		String sqlAllParks = "SELECT * FROM park ORDER BY parkname";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlAllParks);

		while (results.next()) {
			Park p = mapRowToPark(results);
			parks.add(p);
		}
		return parks;
	}
	
	@Override
	public List<Park> getFavoriteParks() {
		List<Park> parks = new ArrayList<>();
		
		String sqlFavoriteParks = "SELECT p.parkname, count(activitylevel) AS surveycount " +
								  "FROM survey_result sr LEFT JOIN park p ON p.parkcode = sr.parkcode " +
								  "GROUP BY sr.parkcode, p.parkcode " +
								  "ORDER BY surveycount DESC, p.parkcode";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlFavoriteParks);

		while (results.next()) {
			Park p = mapRowToFavoritePark(results);
			parks.add(p);
		}
		return parks;
	}
	
}