package kr.co.DaGuDak.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.DaGuDak.dao.RaceDAO;
import kr.co.DaGuDak.model.RaceVO;

@Service
public class RaceServiceImpl implements RaceService{

	@Inject
	RaceDAO dao;
	
	@Override
	public void createRace(ArrayList<Integer> selectedHorses, Date resultDate) throws Exception {
		RaceVO vo  = new RaceVO();

		vo.setFirst_Horse(selectedHorses.get(0));
		vo.setSecond_Horse(selectedHorses.get(1));
		vo.setThird_Horse(selectedHorses.get(2));
		vo.setFourth_Horse(selectedHorses.get(3));
		vo.setFifth_Horse(selectedHorses.get(4));
		vo.setRace_Date(resultDate);
		
		dao.createRace(vo);
		
	}

	@Override
	public List<Object> raceList() throws Exception {
		System.out.println(dao.raceList());
		
		return dao.raceList();
	}
}
