package com.techelevator.npgeek.model;

import java.util.List;

import org.springframework.jdbc.support.rowset.SqlRowSet;

public interface ParkDAO {

	public Park mapRowToPark(SqlRowSet results);
	
	public List<Park> getAllParks();
	
	public List<Park> getFavoriteParks();
	
}