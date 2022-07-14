package kr.co.dw.repository.order;

import java.util.List;
import java.util.Map;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderItemDTO;
import kr.co.dw.domain.OrderPageItemDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.SaleDTO;

public interface OrderDAO {
   
   public OrderPageItemDTO getItemsInfo(int iId);

   public OrderItemDTO getOrderInfo(int iId);
   
   public int enrollOrder(OrderDTO ord);
   
   public int enrollOrderItem(OrderItemDTO orid);
   
   public int deductMoney(MemberDTO mdto);
   
   public int deductStock(ItemDTO idto);

   public List<OrderDTO> orderList();

   public void orderUpdate(String orderId);
   
   /* 주문 취소 */
   public int orderCancle(String orderId);
   
   /* 주문 상품 정보(주문취소) */
   public List<OrderItemDTO> getOrderItemInfo(String orderId);
   
   /* 주문 정보(주문취소) */
   public OrderDTO getOrder(String orderId);

   public List<OrderDTO> orderMemberList(String mid);

   public OrderDTO orderRead(String orderId);

   public OrderItemDTO orderItemRead(String orderId);

   public void orderAddUpdate(OrderDTO odto);

   public Integer getAmountOrder();

   public List<OrderDTO> OrderList(PageTO<OrderDTO> pt);

   public Integer getAmountmyOrder(String mid);

   public List<OrderDTO> myOrderList(PageTO<OrderDTO> pt, String mid);
   
   public long gettodayPrice();
   
   public long getAllPrice();

   public long getsale(SaleDTO sdto);

   public List<OrderDTO> checkOid(String mid);

   public Integer count(Map<String, Object> map, String orderId);

   public long weekSale(String lis);

   public long monthSales(String sos);

   public List<Integer> gettodaytotal();

   public void orderItemUpdate(String orderId);

   public void orderItemCancle(String orderId);

   public List<OrderItemDTO> getOrderItem();

   public long pietotals(String string);

   public void deleteMid(MemberDTO dto);


}