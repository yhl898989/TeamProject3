package kr.co.dw.repository.order;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderItemDTO;
import kr.co.dw.domain.OrderPageItemDTO;

@Repository
public class OrderDAOImpl  implements OrderDAO{

	@Autowired
	private SqlSession sqlsession;
	
	private final String NAMESPACE = "kr.co.dw.order";
	
	@Override
	public OrderPageItemDTO getItemsInfo(int iId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".getItemsInfo", iId);
	}

	@Override
	public OrderItemDTO getOrderInfo(int iId) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne(NAMESPACE+".getOrderInfo", iId);
	}

	@Override
	public int enrollOrder(OrderDTO ord) {
		// TODO Auto-generated method stub
		return sqlsession.insert(NAMESPACE+".enrollOrder", ord);
	}

	@Override
	public int enrollOrderItem(OrderItemDTO orid) {
		// TODO Auto-generated method stub
		return sqlsession.insert(NAMESPACE+".enrollOrderItem", orid);
	}

	@Override
	public int deductMoney(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return sqlsession.update(NAMESPACE+".deductMoney", mdto);
	}

	@Override
	public int deductStock(ItemDTO idto) {
		// TODO Auto-generated method stub
		return sqlsession.update(NAMESPACE+".deductStock", idto);
	}
	
	

}
