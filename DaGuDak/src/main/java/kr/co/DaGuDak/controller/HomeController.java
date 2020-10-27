package kr.co.DaGuDak.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.websocket.Session;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model) {

		return "board/list";
	}

	@RequestMapping(value = "/horses", method = RequestMethod.GET)
	public String horses(Locale locale, Model model) {
		return "horses";
	}

	@RequestMapping(value = "/horseInfo", method = RequestMethod.GET)
	public String horseInfo(Locale locale, Model model) {
		return "horseInfo";
	}

	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String news(Locale locale, Model model) {

		return "news";
	}

	@RequestMapping(value = "/forum", method = RequestMethod.GET)
	public String forum(Locale locale, Model model) {

		return "forum";
	}
 

	@RequestMapping(value = "/customerService", method = RequestMethod.GET)
	public String customerServic(Locale locale, Model model) {
		return "customerService";
	}

	@RequestMapping(value = "/racing", method = RequestMethod.GET)
	public String racing(Locale locale, Model model) {

		return "racing";
	}

	@RequestMapping(value = "/betting", method = RequestMethod.GET)
	public String betting(Locale locale, Model model) {

		return "betting";
	}

	@RequestMapping(value = "/racingList", method = RequestMethod.GET)
	public String racingList(Locale locale, Model model) {
		return "racingList";
	}

	@RequestMapping(value = "/bettingHistory", method = RequestMethod.GET)
	public String bettingHistory(Locale locale, Model model) {

		return "bettingHistory";
	}

	@RequestMapping(value = "/csChat", method = RequestMethod.GET)
	public String csChat(Locale locale, Model model) {

		return "csChat";
	}

	@RequestMapping(value = "/racingResult", method = RequestMethod.GET)
	public String racingResult(Locale locale, Model model) {
		return "racingResult";
	}
	

	
	
	/*
	 * @RequestMapping(value = "/register", method = RequestMethod.GET) public
	 * String register(Locale locale, Model model) { return "member/register"; }
	 */
	   
}