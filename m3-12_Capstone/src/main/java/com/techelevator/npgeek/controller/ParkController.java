package com.techelevator.npgeek.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.npgeek.model.Park;
import com.techelevator.npgeek.model.ParkDAO;
import com.techelevator.npgeek.model.Weather;
import com.techelevator.npgeek.model.WeatherDAO;

@Controller
@SessionAttributes("celsiusOrFahrenheit")
public class ParkController {

	@Autowired
	private ParkDAO parkDAO;
	
	@Autowired
	private WeatherDAO weatherDAO;
	
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String getAllParks(ModelMap map) {
		map.addAttribute("parks", parkDAO.getAllParks());
		return "viewParks";
	}
	
	@RequestMapping(path="/parkDetails", method=RequestMethod.GET)
	public String getParkDetail(ModelMap map, @RequestParam String parkCode) {
		for (Park park : parkDAO.getAllParks()) {
			if (park.getCode().equalsIgnoreCase(parkCode)) {
				map.addAttribute("park", park);
			}
		}
		List<Weather> weather = weatherDAO.getFiveDayForecast(parkCode.toUpperCase());
		map.addAttribute("weather", weather);
		return "parkDetails";
	}
	
}