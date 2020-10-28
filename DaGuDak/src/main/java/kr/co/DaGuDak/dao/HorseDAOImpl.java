package kr.co.DaGuDak.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.DaGuDak.model.HorseVO;


@Repository
public class HorseDAOImpl implements HorseDAO{

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<HorseVO> horsesInfo() {
		return sqlSession.selectList("horse.horsesList");
	}

}
