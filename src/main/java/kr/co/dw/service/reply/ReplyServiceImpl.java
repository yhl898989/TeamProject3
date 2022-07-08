package kr.co.dw.service.reply;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import kr.co.dw.domain.ReplyDTO;
import kr.co.dw.repository.reply.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO rDao;

	@Override
	public void insert(Map<String, Object> map) {
		// TODO Auto-generated method stub
		rDao.insert(map);
	}

	@Override
	public List<ReplyDTO> list(int qno) {
		// TODO Auto-generated method stub
		return rDao.list(qno);
	}

	@Override
	public void delete(Map<String, Object> map) {
		// TODO Auto-generated method stub
		rDao.delete(map);
	}

	@Override
	public void update(Map<String, Object> map) {
		// TODO Auto-generated method stub
		rDao.update(map);
	}

	@Override
	public void deleteByQno(int qno) {
		// TODO Auto-generated method stub
		rDao.deleteByQno(qno);
	}
}