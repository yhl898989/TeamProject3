package kr.co.dw.repository.member;

import java.util.List;

import kr.co.dw.domain.MemberDTO;

public interface MemberDAO {
	
	MemberDTO login(MemberDTO mDto);

	void delete(MemberDTO dto);

	void update(MemberDTO dto);

	MemberDTO updateUI(String mid);

	MemberDTO mypage(String mid);
	
	MemberDTO s_mypage(String mid);

	void insert(MemberDTO dto);

	List<MemberDTO> list();

	int idCheck(String mid);
	
	String findid(MemberDTO mDto);

	String findpw(MemberDTO mDto);

	int updatePw(MemberDTO mdDto);

	MemberDTO readMember(String mid);

	Object id2(String mid);

	void socialInsert(MemberDTO mDto);

	MemberDTO socialLogin(MemberDTO mDto);

	void s_delete(MemberDTO mDto);

	void charge(MemberDTO dto);

	void pointGet(int savePoints, String mid);


}
