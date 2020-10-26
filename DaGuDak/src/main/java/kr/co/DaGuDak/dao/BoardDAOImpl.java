package kr.co.DaGuDak.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.DaGuDak.model.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession SqlSession;
	
	@Override
	public void create(BoardVO vo) throws Exception {
		SqlSession.insert("board.insert", vo);
	}

	@Override
	public BoardVO read(int bid, int bno) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("bid", bid);
		map.put("bno", bno);
		return SqlSession.selectOne("board.view", map);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		SqlSession.update("board.updateArticle", vo);

	}

	@Override
	public void delete(int bid, int bno) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("bid", bid);
		map.put("bno", bno);
		int result = SqlSession.delete("board.deleteArticle", map);
		System.out.println("BoardDAOImpl.delete(): result == " + result);
	}

	@Override
	public void increaseViewcnt(int bid, int bno) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("bid", bid);
		map.put("bno", bno);
		SqlSession.update("board.increaseViewcnt", map);

	}

	@Override
	public List<BoardVO> listAll(int start, int end, String searchOption, String keyword, int bid) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		map.put("start", start);
		map.put("end", end);
		map.put("bid", bid);
		return SqlSession.selectList("board.listAll", map);
	}

	@Override
	public int countArticle(int bid, String searchOption, String keyword) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bid", bid);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		return SqlSession.selectOne("board.countArticle", map);
	}

}
