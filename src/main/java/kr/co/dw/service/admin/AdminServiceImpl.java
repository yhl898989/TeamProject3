package kr.co.dw.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dw.domain.AdminDTO;
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
	
	

}
