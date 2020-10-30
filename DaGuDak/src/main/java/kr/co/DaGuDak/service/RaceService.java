package kr.co.DaGuDak.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public interface RaceService {

	public void createRace(ArrayList<Integer> selectedHorses, Date resultDate) throws Exception;

	public List<Object> raceList() throws Exception;

}
