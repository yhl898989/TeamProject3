package kr.co.dw.repository.order;

import java.util.List;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderItemDTO;
import kr.co.dw.domain.OrderPageItemDTO;

public interface OrderDAO {
	
	public OrderPageItemDTO getItemsInfo(int iId);

	public OrderItemDTO getOrderInfo(int iId);
	
	public int enrollOrder(OrderDTO ord);
	
	public int enrollOrderItem(OrderItemDTO orid);
	
	public int deductMoney(MemberDTO mdto);
	
	public int deductStock(ItemDTO idto);
}
