package com.techelevator.npgeek.model.jdbc;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDAO;

public class JDBCSurveyDAO implements SurveyDAO {

	private JdbcTemplate jdbcTemplate;

	public JDBCSurveyDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public void save(Survey survey) {
		String sqlInsertSurvey = "INSERT INTO survey_result(surveyid, parkcode, " +
								 "emailaddress, state, activitylevel) VALUES (DEFAULT, ?, ?, ?, ?)";
		jdbcTemplate.update(sqlInsertSurvey, survey.getParkCode(), survey.getEmail(),
							survey.getState(), survey.getActivityLevel());
	}
	
}