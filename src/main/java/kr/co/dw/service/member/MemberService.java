package kr.co.dw.service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import kr.co.dw.domain.MemberDTO;

public interface MemberService {
	
	MemberDTO login(MemberDTO mDto);

	void insert(MemberDTO dto);

	List<MemberDTO> list();

	MemberDTO mypage(String mid);
	
	MemberDTO s_mypage(String mid);

	MemberDTO updateUI(String mid);

	void update(MemberDTO dto);

	void delete(MemberDTO dto);

	int idCheck(String mid);

	String findid(MemberDTO mDto);

	String findpw(MemberDTO mDto);

	void pw2(HttpServletResponse response, MemberDTO mDto) throws IOException;
	
	void sendEmail(MemberDTO mDto, String div)throws IOException;

	void socialInsert(MemberDTO mDto);

	MemberDTO socialLogin(MemberDTO mDto);

	void s_delete(MemberDTO dto);

	void charge(MemberDTO dto);

}
