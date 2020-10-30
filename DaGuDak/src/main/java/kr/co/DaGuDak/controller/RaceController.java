package kr.co.DaGuDak.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.DaGuDak.model.RaceVO;
import kr.co.DaGuDak.service.RaceService;

@Controller
@RequestMapping("/race/*")
public class RaceController {

	@Inject
	RaceService service;

	@RequestMapping(value = "createRace", method = RequestMethod.POST)
	public String createRace(HttpServletRequest request, ModelMap model) throws Exception {
		String[] arr = request.getParameterValues("chkHorse");
		String date = request.getParameter("race_date"); // 2020-10-31
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date resultDate = transFormat.parse(date.replace("T", " "));

		ArrayList<Integer> selectedHorses = new ArrayList<Integer>();

		for (String temp : arr) {
			selectedHorses.add(Integer.parseInt(temp));
		}

		service.createRace(selectedHorses, resultDate);

		return "redirect:racingList";
	}

	@RequestMapping(value = "/racingList", method = RequestMethod.GET)
	public String racingList(Locale locale, Model model) throws Exception {

		List<Object> list = service.raceList();

		model.addAttribute("list", list);
		return "race/racingList";
	}

	@RequestMapping(value = "/racing", method = RequestMethod.GET)
	public String racing(Locale locale, Model model) {

		return "race/racing";
	}

	@RequestMapping(value = "/racingResult", method = RequestMethod.GET)
	public String racingResult(Locale locale, Model model) {
		return "race/racingResult";
	}

}
