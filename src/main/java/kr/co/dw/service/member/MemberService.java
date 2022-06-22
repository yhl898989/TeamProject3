package kr.co.dw.service.member;

import java.util.List;

import kr.co.dw.domain.MemberDTO;

public interface MemberService {
	
	MemberDTO login(MemberDTO mDto);

	void insert(MemberDTO dto);

	List<MemberDTO> list();

	MemberDTO mypage(String mid);

	MemberDTO updateUI(String mid);

	void update(MemberDTO dto);

	void delete(MemberDTO dto);

	int idCheck(String mid);


}
