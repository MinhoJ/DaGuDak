package kr.co.DaGuDak.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/bet/*")
public class BetController {
	
	@RequestMapping(value = "/betting", method = RequestMethod.GET)
	public String betting(Locale locale, Model model) {

		return "bet/betting";
	}

	@RequestMapping(value = "/bettingHistory", method = RequestMethod.GET)
	public String bettingHistory(Locale locale, Model model) {

		return "bet/bettingHistory";
	}
}
