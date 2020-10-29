package kr.co.DaGuDak.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class RaceDAOImpl implements RaceDAO{
	@Inject
	SqlSession SqlSession;
}
