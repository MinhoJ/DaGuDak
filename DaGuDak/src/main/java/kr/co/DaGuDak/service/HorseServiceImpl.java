package kr.co.DaGuDak.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.DaGuDak.dao.HorseDAO;
import kr.co.DaGuDak.model.HorseVO;

@Service
public class HorseServiceImpl implements HorseService{

	@Inject
	HorseDAO horseDao;
	
	@Override
	public List<HorseVO> horseList() {
		List<HorseVO> horsesInfo = new ArrayList<HorseVO>();
		horsesInfo = horseDao.horseList();
		return horsesInfo;
	}

	@Override
	public void create(HorseVO vo) throws Exception {
		
	}

	@Override
	public HorseVO read(int horse_no) throws Exception {
		return null;
	}

	@Override
	public boolean update(HorseVO vo) throws Exception {
		return false;
	}

	@Override
	public boolean delete(int horse_no) throws Exception {
		
		return false;
	}

}
