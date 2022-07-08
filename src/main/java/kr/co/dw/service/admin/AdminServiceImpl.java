package kr.co.dw.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dw.domain.AdminDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.repository.admin.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO aDao;


	@Override
	public AdminDTO login(AdminDTO aDto) {
		// TODO Auto-generated method stub
		return aDao.login(aDto);
	}
	
	@Override
	public void insert(AdminDTO aDto) {
		aDao.insert(aDto);
	}

	@Override
	public List<AdminDTO> list() {
		return aDao.list();
	}
	
	@Override
	public AdminDTO read(String aid) {
		return aDao.read(aid);
	}
	
	@Override
	public void giveauth(String aid, int aauth) {
		AdminDTO aDto = read(aid);
		int result = aDto.getAauth();
		result = result + aauth;
		aDto.setAauth(result);
		
		aDao.giveauth(aDto);
	}

	@Override
	public int getamount() {
		// TODO Auto-generated method stub
		return aDao.getamount();
	}

	@Override
	public List<MemberDTO> mlist(int curPage) {
		// TODO Auto-generated method stub
		return aDao.mlist(curPage);
	}

	@Override
	public Integer getamount(String criteria, String keyword) {
		// TODO Auto-generated method stub
		return aDao.getamount(criteria,keyword);
	}

	@Override
	public List<MemberDTO> search(String criteria, String keyword, int curPage) {
		// TODO Auto-generated method stub
		return aDao.search(criteria,keyword,curPage);
	}

}
