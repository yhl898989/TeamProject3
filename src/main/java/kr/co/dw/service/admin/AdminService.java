package kr.co.dw.service.admin;

import java.util.List;

import kr.co.dw.domain.AdminDTO;
import kr.co.dw.domain.MemberDTO;

public interface AdminService {

	AdminDTO login(AdminDTO aDto);

	void insert(AdminDTO aDto);

	List<AdminDTO> list();

	void giveauth(String aid, int aauth);	

	AdminDTO read(String aid);

	int getamount();

	List<MemberDTO> mlist(int curPage);

	Integer getamount(String criteria, String keyword);

	List<MemberDTO> search(String criteria, String keyword, int curPage);
}
