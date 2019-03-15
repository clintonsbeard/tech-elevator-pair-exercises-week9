package com.techelevator;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Before;

import org.junit.Test;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.SingleConnectionDataSource;


import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.jdbc.JDBCParkDAO;
import com.techelevator.npgeek.model.jdbc.JDBCSurveyDAO;

public class JDBCParkDAOIntegrationTest extends DAOIntegrationTest {

	private JDBCParkDAO dao;
	private JDBCSurveyDAO surveyDao;
	private JdbcTemplate jdbcTemplate;

	@Before
	public void setupTest() {
	    dao = new JDBCParkDAO(getDataSource());
	    jdbcTemplate = new JdbcTemplate(getDataSource());
	    surveyDao = new JDBCSurveyDAO(getDataSource());
	    jdbcTemplate.execute("DELETE FROM survey_result");
	}
	
	@Test
	public void all_parks__get_listed() {
		//Arrange
	    int count = jdbcTemplate.queryForObject("SELECT count(*) FROM park", Integer.class);
	    
	    //Act
	    List<Park> results = dao.getAllParks();
	    
	    //Assert
	    assertEquals(count, results.size());
	}
	
	@Test
	public void get_favorite_parks_returns_correct_survey_count() {
		//Arrange
		Survey theSurvey = getSurvey("CVNP", "testEmail@test.com", "Ohio", "inactive");
		surveyDao.save(theSurvey);
		
		//Act
		List<Park> favorites = dao.getFavoriteParks();
		//Assert
		assertEquals(1, favorites.size());	
	}
	
	@Test
	public void get_favorite_parks_returns_multiple_survey_count_for_one_park() {
		//Arrange
		Survey theSurvey = getSurvey("CVNP", "testEmail@test.com", "Ohio", "inactive");
		surveyDao.save(theSurvey);
		Survey newSurvey = getSurvey("CVNP", "testEmail2@test.com", "Ohio", "inactive");
		surveyDao.save(newSurvey);
		
		//Act
		List<Park> favorites = dao.getFavoriteParks();
		
		//Assert
		assertEquals(1, favorites.size());	
		assertEquals(2, favorites.get(0).getSurveyCount());
	}
	
	@Test
	public void get_favorite_parks_returns_nothing_when_no_votes_for_any_park() {
		//Arrange
		//Act
		List<Park> favorites = dao.getFavoriteParks();
		
		//Assert
		assertEquals(0, favorites.size());	
	}
	
	@Test
	public void get_favorite_returns_multiple_parks_alphabetically_when_tied_survey_count() {
		//Arrange
		Survey theSurvey = getSurvey("ENP", "testEmail@test.com", "Ohio", "inactive");
		surveyDao.save(theSurvey);
		Survey newSurvey = getSurvey("CVNP", "testEmail2@test.com", "Ohio", "inactive");
		surveyDao.save(newSurvey);
		Survey newSurvey2 = getSurvey("GNP", "testEmail3@test.com", "Ohio", "inactive");
		surveyDao.save(newSurvey2);
				
		//Act
		List<Park> favorites = dao.getFavoriteParks();
				
		//Assert
		assertEquals(3, favorites.size());	
		assertEquals("cvnp", favorites.get(0).getCode());
		assertEquals("enp", favorites.get(1).getCode());
		assertEquals("gnp", favorites.get(2).getCode());
		
	}
	
	@Test
	public void get_favorite_returns_multiple_parks_for_corresponding_parks() {
		//Arrange
			
			Survey theSurvey = getSurvey("CVNP", "testEmail@test.com", "Ohio", "inactive");
			surveyDao.save(theSurvey);
			Survey newSurvey = getSurvey("ENP", "testEmail2@test.com", "Ohio", "inactive");
			surveyDao.save(newSurvey);
				
		//Act
		List<Park> favorites = dao.getFavoriteParks();
				
		//Assert
		assertEquals(2, favorites.size());	
		assertEquals(1, favorites.get(0).getSurveyCount());
		assertEquals(1, favorites.get(1).getSurveyCount());
	}
	
	private Survey getSurvey(String parkcode, String email, String state, String activitylevel) {
	    Survey theSurvey = new Survey();
	    theSurvey.setCode(parkcode);
	    theSurvey.setEmail(email);
	    theSurvey.setState(state);
	    theSurvey.setActivityLevel(activitylevel);
	    return theSurvey;
	}
}
