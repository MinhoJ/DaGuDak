package kr.co.DaGuDak.controller;

import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.DaGuDak.service.RaceService;

@Controller
@RequestMapping("/race/*")
public class RaceController {

	@Inject 
	RaceService service;

	@RequestMapping(value = "createRace")
	public String createRace(HttpServletRequest request, ModelMap model) throws Exception {
		String[] arr = request.getParameterValues("btn");
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
		
		return "race/racingList";
	}
	
	@RequestMapping(value = "/racing", method = RequestMethod.GET)
	public String racing(Locale locale, Model model) {

		return "race/racing";
	}

	@RequestMapping(value = "/racingList", method = RequestMethod.GET)
	public String racingList(Locale locale, Model model) {
		return "race/racingList";
	}

	@RequestMapping(value = "/racingResult", method = RequestMethod.GET)
	public String racingResult(Locale locale, Model model) {
		return "race/racingResult";
	}

	

}
