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
	public List<HorseVO> horseList() {
		return sqlSession.selectList("horse.horseList");
	}

	@Override
	public void create(HorseVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public HorseVO read(int horse_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(HorseVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int horse_no) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
