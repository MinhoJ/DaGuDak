package kr.co.DaGuDak.dao;

import java.util.List;

import kr.co.DaGuDak.model.HorseVO;

public interface HorseDAO {

	public List<HorseVO> horseList();
	
	public void create(HorseVO vo) throws Exception;

	public HorseVO read(int horse_no) throws Exception;

	public boolean update(HorseVO vo) throws Exception;

	public boolean delete(int horse_no) throws Exception;
}
