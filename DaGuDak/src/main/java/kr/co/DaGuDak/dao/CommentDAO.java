package kr.co.DaGuDak.dao;

import java.util.List;

import kr.co.DaGuDak.model.CommentVO;

public interface CommentDAO {
	public List<CommentVO> list(int bno);

	public void create(CommentVO vo);

	public void update(CommentVO vo);

	public void delete(int rno);
}
