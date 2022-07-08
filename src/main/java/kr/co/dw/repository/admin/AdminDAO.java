package kr.co.dw.repository.admin;

import java.util.List;

import kr.co.dw.domain.AdminDTO;
import kr.co.dw.domain.MemberDTO;

public interface AdminDAO {

	AdminDTO login(AdminDTO aDto);

	void insert(AdminDTO aDto);

	List<AdminDTO> list();

	AdminDTO read(String aid);

	void giveauth(AdminDTO aDto);

	int getamount();

	List<MemberDTO> mlist(int curPage);

	Integer getamount(String criteria, String keyword);

	List<MemberDTO> search(String criteria, String keyword, int curPage);

}
