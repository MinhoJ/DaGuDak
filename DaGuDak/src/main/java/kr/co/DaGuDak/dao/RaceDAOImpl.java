package kr.co.DaGuDak.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.DaGuDak.model.RaceVO;

@Repository
public class RaceDAOImpl implements RaceDAO {
	@Inject
	SqlSession sqlSession;

	@Override
	public void createRace(RaceVO vo) throws Exception {
		sqlSession.insert("race.insertRace", vo);
	}

	@Override
	public List<Object> raceList() throws Exception {
		return sqlSession.selectList("race.raceList");
	}
}
