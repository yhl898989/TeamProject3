package kr.co.dw.service.order;

import java.util.List;
import java.util.Map;

import kr.co.dw.domain.OrderCancelDTO;
import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderItemDTO;
import kr.co.dw.domain.OrderPageItemDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.SaleDTO;

public interface OrderService {
   
   public List<OrderPageItemDTO> getItemsInfo(List<OrderPageItemDTO> orders);
   
   public void order(OrderDTO oDto);

   public List<OrderDTO> List();

   public void orderUpdate(String orderId, int savePoint,String mid);
   
   public void orderCancle(OrderCancelDTO dto);

   public List<OrderDTO> orderList(String mid);

   public OrderDTO orderRead(String orderId);

   public OrderItemDTO orderItemRead(String orderId);

   public void orderAddUpdate(OrderDTO odto);

   public PageTO<OrderDTO> list(Integer curpage);

   public PageTO<OrderDTO> myorderList(Integer curpage, String mid);
   
   public long gettodayPrice();
   
   public long getAllPrice();

   public long getsale(SaleDTO sdto);

   public java.util.List<OrderDTO> checkOid(String mid);

   public Integer count(Map<String, Object> map, String orderId);

   public List<Long> weekSale(List<String> list);

   public java.util.List<Long> monthSale(java.util.List<String> month);

   public List<Integer> gettodaytotal();

   public java.util.List<OrderItemDTO> orderItem();

   public List<Long> pietotal(java.util.List<String> arr);

}