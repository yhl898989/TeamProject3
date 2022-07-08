package kr.co.dw.service.qa;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.QaDTO;
import kr.co.dw.repository.qa.QaDao;
@Service
public class QaServiceImpl implements QaService{

	@Autowired
	private QaDao qDao;

	@Override
	public List<QaDTO> list() {
		// TODO Auto-generated method stub
		return qDao.list();
	}

	@Override
	public void insert(QaDTO nQdto) {
		// TODO Auto-generated method stub
		qDao.insert(nQdto);
	}

	@Override
	@Transactional
	public QaDTO read(int qno) {
		// TODO Auto-generated method stub
		
		qDao.increaseReadCnt(qno);
		return qDao.read(qno);
	}
	@Override
	public void update(QaDTO nQdto) {
		// TODO Auto-generated method stub
		qDao.update(nQdto);
	}
	@Override
	public QaDTO updateUI(int qno) {
		// TODO Auto-generated method stub
		QaDTO nQdto=qDao.updateUI(qno);
		return nQdto;
	}
	
	@Override
	public void delete(QaDTO nQdto) {
		// TODO Auto-generated method stub
		qDao.delete(nQdto);
	}

	@Override
	public List<QaDTO> listpage(Integer curpage) {
		// TODO Auto-generated method stub
		PageTO<QaDTO> pt = new PageTO<QaDTO>(curpage);
		
		Integer amount = qDao.getamountqa();
		pt.setAmount(amount);
		return qDao.listpage(curpage);
	}

	@Override
	public Integer getamount() {
		// TODO Auto-generated method stub
		return qDao.getamount();
	}

	@Override
	public PageTO<QaDTO> search(Integer curpage, String criteria, String keyword) {
		// TODO Auto-generated method stub
		PageTO<QaDTO> pt=new PageTO<QaDTO>(curpage);
		
		int amount=qDao.getAmountSearch(criteria,keyword);
		
		pt.setAmount(amount);
		
		List<QaDTO>list=qDao.search(pt,criteria,keyword);
		pt.setList(list);
		
		return pt;
	}
}
