package kr.co.DaGuDak.service;

import java.util.List;

import kr.co.DaGuDak.model.CommentVO;

public interface CommentService {
	public List<CommentVO> list(int bno);

	public void create(CommentVO vo);

	public void update(CommentVO vo);

	public void delete(int rno);
}
