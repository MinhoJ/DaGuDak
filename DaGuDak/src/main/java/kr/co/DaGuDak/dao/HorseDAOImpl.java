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
      System.out.println("dao create 실행");
      System.out.println(vo);
      int result = sqlSession.insert("horse.insertHorse", vo);
      System.out.println(result);
      System.out.println("HorseDAOImpl: "+vo);
   }

   @Override
   public HorseVO read(int horse_no) throws Exception {
      return sqlSession.selectOne("horse.readHorse", horse_no);
   }

   @Override
   public boolean update(HorseVO vo) throws Exception {
      System.out.println("dao update 실행");

      int result = sqlSession.insert("horse.updateHorse", vo);

      System.out.println("result : " + result);
      System.out.println("HorseDAOImpl: " + vo);
      return result == 1 ? true : false;
   }

	@Override
	public boolean delete(int horse_no) throws Exception {
		int result = sqlSession.delete("horse.deleteHorse", horse_no);
		return result == 1 ? true : false;
	}

}