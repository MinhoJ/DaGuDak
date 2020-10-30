package kr.co.DaGuDak.dao;

import java.util.List;

import kr.co.DaGuDak.model.RaceVO;

public interface RaceDAO {

	public void createRace(RaceVO vo) throws Exception;

	public List<Object> raceList() throws Exception;

}
