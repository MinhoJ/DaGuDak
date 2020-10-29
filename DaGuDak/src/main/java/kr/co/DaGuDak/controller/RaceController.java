package kr.co.DaGuDak.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/race/*")
public class RaceController {

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
