package kr.co.DaGuDak.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/horse/*")
public class HorseController {

	@RequestMapping(value = "/horses", method = RequestMethod.GET)
	public String horses(Locale locale, Model model) {
		return "horse/horses";
	}

	@RequestMapping(value = "/horseInfo", method = RequestMethod.GET)
	public String horseInfo(Locale locale, Model model) {
		return "horse/horseInfo";
	}
}
