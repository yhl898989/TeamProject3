package kr.co.dw.service.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderItemDTO;
import kr.co.dw.domain.OrderPageItemDTO;
import kr.co.dw.repository.item.ItemDAO;
import kr.co.dw.repository.member.MemberDAO;
import kr.co.dw.repository.order.OrderDAO;

@Service
public class OrderServiceImpl  implements OrderService{
	
	@Autowired
	private OrderDAO oDAO;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private ItemDAO iDAO;
	

	

	@Override
	public List<OrderPageItemDTO> getItemsInfo(List<OrderPageItemDTO> orders) {
		// TODO Auto-generated method stub
		List<OrderPageItemDTO> result = new ArrayList<OrderPageItemDTO>();
		
		for(OrderPageItemDTO ord : orders) {
			OrderPageItemDTO ItemsInfo = oDAO.getItemsInfo(ord.getiId());
			ItemsInfo.setiCount(ord.getiCount());
			ItemsInfo.initSaleTotal();
			
			result.add(ItemsInfo);
		}
		
		
		return result;
	}

	@Override
	@Transactional
	public void order(OrderDTO oDto) {
		
		
		
		/* 사용할 데이터가져오기 */
		/* 회원 정보 */
		MemberDTO member = mDAO.mypage(oDto.getMid());

		/* 주문 정보 */
		List<OrderItemDTO> ords = new ArrayList<>();
		for(OrderItemDTO oit : oDto.getOrders()) {
			OrderItemDTO orderItem = oDAO.getOrderInfo(oit.getiId());
			// 수량 셋팅
			orderItem.setiCount(oit.getiCount());
			// 기본정보 셋팅
			orderItem.initsaleTotal();
			//List객체 추가
			ords.add(orderItem);
		}
		/* OrderDTO 셋팅 */
		oDto.setOrders(ords);
		oDto.getOrderPriceInfo();
		
	/*DB 주문,주문상품(,배송정보) 넣기*/
		
		/* orderId만들기 및 OrderDTO객체 orderId에 저장 */
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
		String orderId = member.getMid() + format.format(date);
		oDto.setOrderId(orderId);
		
		/* db넣기 */
		oDAO.enrollOrder(oDto);		//vam_order 등록
		for(OrderItemDTO oit : oDto.getOrders()) {		//vam_orderItem 등록
			oit.setOrderId(orderId);
			oDAO.enrollOrderItem(oit);			
		}

	/* 비용 포인트 변동 적용 */
		
		/* 비용 차감 & 변동 돈(money) Member객체 적용 */
		int calMoney = member.getMmoney();
		calMoney -= oDto.getOrderFinalSalePrice();
		member.setMmoney(calMoney);
		
		/* 포인트 차감, 포인트 증가 & 변동 포인트(point) Member객체 적용 */
		int calPoint = member.getMpoint();
		calPoint = calPoint -  oDto.getUsePoint() + oDto.getOrderSavePoint();	// 기존 포인트 - 사용 포인트 + 획득 포인트
		member.setMpoint(calPoint);
			
		/* 변동 돈, 포인트 DB 적용 */
		oDAO.deductMoney(member);
		
	/* 재고 변동 적용 */
		for(OrderItemDTO oit : oDto.getOrders()) {
			/* 변동 재고 값 구하기 */
			ItemDTO item = iDAO.read(oit.getiId());
			item.setiCount(item.getiCount() - oit.getiCount());
			/* 변동 값 DB 적용 */
			oDAO.deductStock(item);
		}
		
		
	}
	


}
