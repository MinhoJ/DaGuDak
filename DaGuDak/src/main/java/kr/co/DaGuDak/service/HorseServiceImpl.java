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
	public List<HorseVO> horsesInfo() {
		List<HorseVO> horsesInfo = new ArrayList<HorseVO>();
		horsesInfo = horseDao.horsesInfo();
		return horsesInfo;
	}

}
