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
      List<HorseVO> horsesList = new ArrayList<HorseVO>();
      horsesList = horseDao.horseList();
      return horsesList;
   }

   @Override
   public void create(HorseVO vo) throws Exception {
      System.out.println("service.create 실행");
      String speed = "" + vo.getSpeed1() + vo.getSpeed2() + vo.getSpeed3() + vo.getSpeed4();
      vo.setSpeed(speed);
      System.out.println(speed);
      horseDao.create(vo);
      System.out.println("HorseServiceImpl: "+vo);
   }

   @Override
   public HorseVO read(int horse_no) throws Exception {
      return horseDao.read(horse_no);
   }

   @Override
   public boolean update(HorseVO vo) throws Exception {
      String speed = "" + vo.getSpeed1() + vo.getSpeed2() + vo.getSpeed3() + vo.getSpeed4();
      vo.setSpeed(speed);
      System.out.println(speed);
      return horseDao.update(vo);
   }

	@Override
	public boolean delete(int horse_no) throws Exception {
		return horseDao.delete(horse_no);
	}

}