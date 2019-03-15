package com.techelevator.npgeek.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

public class Survey {

	@NotBlank(message="Park code is a required field.")
	private String code;
	
	@NotBlank(message="Email is a required field.")
	@Email(message="Email must be valid.")
	private String email;
	
	@NotBlank(message="State is a required field.")
	private String state;
	
	@NotBlank(message="Activity level is a required field.")
	private String activityLevel;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public String getActivityLevel() {
		return activityLevel;
	}
	public void setActivityLevel(String activityLevel) {
		this.activityLevel = activityLevel;
	}
	
}