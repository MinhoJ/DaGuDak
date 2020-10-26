package kr.co.DaGuDak.service;

import javax.servlet.http.HttpSession;

import kr.co.DaGuDak.model.MemberVO;

public interface MemberService {
	public void register(MemberVO vo) throws Exception;

	public int idChk(String member_id) throws Exception;

	public void logout(HttpSession session);

	public boolean loginCheck(MemberVO vo, HttpSession session) throws Exception;

	public MemberVO viewMember(MemberVO vo) throws Exception;
  
	public void updateMember(MemberVO vo) throws Exception;

	public MemberVO userInfo(String member_id) throws Exception;
	
	public void chargePoint(String member_id, int point) throws Exception;

	public boolean passwordChk(String member_id, MemberVO vo) throws Exception;

	public int getPoint(String loginId)throws Exception;
	
	public void deleteMember(String member_id) throws Exception;
}

//MemberController에서 보낸 파라미터를 memberService로 받아주고 받은 파라미터는 DAO로 보내줍니다.
//DAO에서 반환한 값 result를 return합니다.
