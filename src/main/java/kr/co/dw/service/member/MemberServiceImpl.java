package kr.co.dw.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dw.domain.MemberDTO;
import kr.co.dw.repository.member.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO mDao;

	@Override
	public MemberDTO login(MemberDTO mDto) {
		// TODO Auto-generated method stub
		return mDao.login(mDto);
	}
	
	@Override
	public List<MemberDTO> list() {
		// TODO Auto-generated method stub
		return mDao.list();
	}
	
	@Override
	public void insert(MemberDTO dto) {
		mDao.insert(dto);
	}

	@Override
	public MemberDTO mypage(String mid) {
		// TODO Auto-generated method stub
		return mDao.mypage(mid);
	}

	@Override
	public MemberDTO updateUI(String mid) {
		
		MemberDTO dto = mDao.updateUI(mid);
		
		String mbirth = dto.getMbirth().substring(0, 10);
		dto.setMbirth(mbirth);
		
		return dto;
	}

	@Override
	public void update(MemberDTO dto) {
		
		mDao.update(dto);
		
	}

	@Override
	public void delete(MemberDTO dto) {
		mDao.delete(dto);
		
	}
	
}
