package kr.co.DaGuDak.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.DaGuDak.model.HorseVO;
import kr.co.DaGuDak.service.HorseService;

@Controller
@RequestMapping("/horse/*")
public class HorseController {
	
	@Inject
	HorseService horseService;

	@RequestMapping(value = "horses", method = RequestMethod.GET)
	public String horses(Locale locale, Model model) throws Exception {
		List<HorseVO> horseList = new ArrayList<HorseVO>();
		horseList = horseService.horseList();
		
		model.addAttribute("horseList", horseList);
		return "horse/horses";
	}
	
	@RequestMapping(value = "horseInfo", method = RequestMethod.GET)
	public String horseInfo(Locale locale, Model model) {
		
		return "horse/horseInfo";
	}
	
	@RequestMapping("createForm")
	public String createForm() {
		return "horse/createHorse";
	}
	

	@RequestMapping(value = "updateForm", method = RequestMethod.GET)
	public String updateForm() {
		return "horse/updateHorse";
	}
}
