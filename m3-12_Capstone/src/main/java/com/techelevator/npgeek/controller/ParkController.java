package com.techelevator.npgeek.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.Survey;
import com.techelevator.npgeek.model.SurveyDAO;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.WeatherDAO;

@Controller
@SessionAttributes("tempChoice")
public class ParkController {

	@Autowired
	private ParkDAO parkDAO;
	
	@Autowired
	private WeatherDAO weatherDAO;
	
	@Autowired
	private SurveyDAO surveyDAO;
	
	List<Weather> weather;
	
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String getAllParks(ModelMap map) {
		map.addAttribute("parks", parkDAO.getAllParks());
		return "viewParks";
	}
	
	@RequestMapping(path="/favoriteParks", method=RequestMethod.GET)
	public String getFavoriteParks(ModelMap map) {
		List<Park> favorites = parkDAO.getFavoriteParks();
		map.addAttribute("favorites", favorites);
		return "favoriteParks";
	}
	
	@RequestMapping(path="/parkDetails", method=RequestMethod.GET)
	public String getParkDetail(ModelMap map, @RequestParam String parkCode) {
		for (Park park : parkDAO.getAllParks()) {
			if (park.getCode().equalsIgnoreCase(parkCode)) {
				map.addAttribute("park", park);
			}
		}
		weather = weatherDAO.getFiveDayForecast(parkCode.toUpperCase());
		map.addAttribute("weather", weather);
		
		return "parkDetails";
	}
	
	@RequestMapping(path="/switchTemperature", method=RequestMethod.GET)
	public String switchTemperature(ModelMap map, @RequestParam String parkCode, @RequestParam(required=false) String tempChoice) {
		if (tempChoice != null && !tempChoice.isEmpty()) {
			map.addAttribute("tempChoice", tempChoice);
		}
		return "redirect:/parkDetails?parkCode=" + parkCode;
	}
	
	@RequestMapping(path="/survey", method=RequestMethod.GET)
	public String getSurvey(ModelMap map) {
		if(! map.containsAttribute("survey")) {
			map.addAttribute("survey", new Survey());
		}
		List<Park> parks = parkDAO.getAllParks();
		map.addAttribute("parks", parks);
		return "survey";
	}
	
	@RequestMapping(path="/survey", method=RequestMethod.POST)
	public String postSurvey(@Valid @ModelAttribute("survey") Survey survey, BindingResult result) {
		if(result.hasErrors()) {
			return "survey"; 
		}
		else {
			surveyDAO.save(survey);
			return "redirect:/favoriteParks";
		}
	}
	
}