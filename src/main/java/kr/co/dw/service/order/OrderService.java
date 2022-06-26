package kr.co.dw.service.order;

import java.util.List;

import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderPageItemDTO;

public interface OrderService {
	
	public List<OrderPageItemDTO> getItemsInfo(List<OrderPageItemDTO> orders);
	
	public void order(OrderDTO oDto);

}
