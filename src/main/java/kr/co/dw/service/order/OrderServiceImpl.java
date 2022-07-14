package kr.co.dw.service.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.OrderCancelDTO;
import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderItemDTO;
import kr.co.dw.domain.OrderPageItemDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.SaleDTO;
import kr.co.dw.repository.item.ItemDAO;
import kr.co.dw.repository.member.MemberDAO;
import kr.co.dw.repository.order.OrderDAO;

@Service
public class OrderServiceImpl implements OrderService {

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

      for (OrderPageItemDTO ord : orders) {
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
      for (OrderItemDTO oit : oDto.getOrders()) {
         OrderItemDTO orderItem = oDAO.getOrderInfo(oit.getiId());

         oDto.setI_CATEGORY(orderItem.getI_CATEGORY());
         // 수량 셋팅
         orderItem.setiCount(oit.getiCount());
         // 기본정보 셋팅
         orderItem.initsaleTotal();
         // List객체 추가
         ords.add(orderItem);
      }
      /* OrderDTO 셋팅 */
      oDto.setOrders(ords);
      oDto.getOrderPriceInfo();

      /* DB 주문,주문상품(,배송정보) 넣기 */

      /* orderId만들기 및 OrderDTO객체 orderId에 저장 */
      Date date = new Date();
      SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddHHmmss");
      String orderId = member.getMid() + format.format(date);
      oDto.setOrderId(orderId);

      /* db넣기 */
      oDAO.enrollOrder(oDto); // vam_order 등록

      for (OrderItemDTO oit : oDto.getOrders()) { // vam_orderItem 등록
         oit.setOrderId(orderId);

         oDAO.enrollOrderItem(oit);
      }

      /* 비용 포인트 변동 적용 */

      /* 비용 차감 & 변동 돈(돈) Member객체 적용 */
      long calMoney = member.getMmoney();

      calMoney -= oDto.getOrderFinalSalePrice();
      if (calMoney < 0) {

      }

      member.setMmoney(calMoney);

      /* 포인트 차감, 포인트 증가 & 변동 포인트(point) Member객체 적용 */
      long calPoint = member.getMpoint();
      calPoint = calPoint - oDto.getUsePoint(); // 기존 포인트 - 사용 포인트 + 획득 포인트
      member.setMpoint(calPoint);

      /* 변동 돈, 포인트 DB 적용 */
      oDAO.deductMoney(member);

      /*
       * for(int i = 0 ; i<oDto.getOrders().size(); i++) { OrderItemDTO oit =
       * oDto.getOrders().get(i);
       * 
       * ItemDTO item = iDAO.read(oit.getiId()); item.setiCount(item.getiCount() -
       * oit.getiCount()); 변동 값 DB 적용 oDAO.deductStock(item); }
       */

      /* 재고 변동 적용 */
      for (OrderItemDTO oit : oDto.getOrders()) {
         /* 변동 재고 값 구하기 */
         ItemDTO item = iDAO.read(oit.getiId());
         item.setiCount(item.getiCount() - oit.getiCount());
         /* 변동 값 DB 적용 */
         oDAO.deductStock(item);
      }

   }
   
   @Transactional
   @Override
   public java.util.List<OrderDTO> List() {
      // TODO Auto-generated method stub

      return oDAO.orderList();
   }

   @Override
   public void orderUpdate(String orderId, int savePoint, String mid) {
      oDAO.orderUpdate(orderId);
      oDAO.orderItemUpdate(orderId);
      mDAO.pointGet(savePoint, mid);
   }

   @Override
   public void orderCancle(OrderCancelDTO dto) {

      /* 주문, 주문상품 객체 */
      /* 회원 */
      MemberDTO member = mDAO.mypage(dto.getMid());
      /* 주문상품 */
      List<OrderItemDTO> ords = oDAO.getOrderItemInfo(dto.getOrderId());

      for (OrderItemDTO ord : ords) {
         ord.initsaleTotal();
      }
      /* 주문 */
      OrderDTO orw = oDAO.getOrder(dto.getOrderId());
      orw.setOrders(ords);

      orw.getOrderPriceInfo();

      /* 주문상품 취소 DB */
      oDAO.orderCancle(dto.getOrderId());
      oDAO.orderItemCancle(dto.getOrderId());
      /* 돈, 포인트, 재고 변환 */
      /* 돈 */
      long calMoney = member.getMmoney();
      calMoney += orw.getOrderFinalSalePrice();
      member.setMmoney(calMoney);

      /* 포인트 */
      long calPoint = member.getMpoint();
      calPoint = calPoint + orw.getUsePoint();
      member.setMpoint(calPoint);

      /* DB적용 */
      oDAO.deductMoney(member);

      /* 재고 */
      for (OrderItemDTO ord : orw.getOrders()) {
         ItemDTO item = iDAO.read(ord.getiId());
         item.setiCount(item.getiCount() + ord.getiCount());
         oDAO.deductStock(item);
      }

   }

   @Override
   public java.util.List<OrderDTO> orderList(String mid) {
      // TODO Auto-generated method stub
      return oDAO.orderMemberList(mid);
   }

   @Override
   public OrderDTO orderRead(String orderId) {
      // TODO Auto-generated method stub
      return oDAO.orderRead(orderId);
   }

   @Override
   public OrderItemDTO orderItemRead(String orderId) {
      // TODO Auto-generated method stub
      return oDAO.orderItemRead(orderId);
   }

   @Override
   public void orderAddUpdate(OrderDTO odto) {
      oDAO.orderAddUpdate(odto);

   }

   @Override
   public PageTO<OrderDTO> list(Integer curpage) {
      PageTO<OrderDTO> pt = new PageTO<OrderDTO>(curpage);

      Integer amount = oDAO.getAmountOrder();
      pt.setAmount(amount);

      List<OrderDTO> list = oDAO.OrderList(pt);
      pt.setList(list);

      return pt;
   }

   @Override
   public PageTO<OrderDTO> myorderList(Integer curpage, String mid) {
      PageTO<OrderDTO> pt = new PageTO<OrderDTO>(curpage);

      Integer amount = oDAO.getAmountmyOrder(mid);
      pt.setAmount(amount);

      List<OrderDTO> list = oDAO.myOrderList(pt, mid);
      pt.setList(list);

      return pt;
   }

   @Override
   public long gettodayPrice() {
      // TODO Auto-generated method stub
      return oDAO.gettodayPrice();
   }

   @Override
   public long getAllPrice() {
      // TODO Auto-generated method stub
      return oDAO.getAllPrice();
   }

   @Override
   public long getsale(SaleDTO sdto) {
      // TODO Auto-generated method stub
      return oDAO.getsale(sdto);
   }

   @Override
   public java.util.List<OrderDTO> checkOid(String mid) {
      // TODO Auto-generated method stub
      return oDAO.checkOid(mid);
   }

   @Override
   public Integer count(Map<String, Object> map, String orderId) {
      // TODO Auto-generated method stub
      return oDAO.count(map, orderId);
   }

   @Override
   public List<Long> weekSale(List<String> list) {
      // TODO Auto-generated method stub

      List<Long> result = new ArrayList<Long>();

      for (String lis : list) {
         
         long sale = oDAO.weekSale(lis);
         
         result.add((long) sale);
      }

      return result;
   }

   @Override
   public java.util.List<Long> monthSale(java.util.List<String> month) {

      List<Long> result = new ArrayList<Long>();

      for (String sos : month) {
         long sale = oDAO.monthSales(sos);

         result.add(sale);
      }

      return result;
   }

   @Override
   public List<Integer> gettodaytotal() {
      // TODO Auto-generated method stub
      return oDAO.gettodaytotal();
   }

   @Override
   public java.util.List<OrderItemDTO> orderItem() {
      // TODO Auto-generated method stub
      return oDAO.getOrderItem();
   }

   @Override
   public List<Long> pietotal(List<String> arr) {
      // TODO Auto-generated method stub

      List<Long> pitetotalService = new ArrayList<Long>();

      for (int i = 0; i < arr.size(); i++) {
         long pvalue = oDAO.pietotals(arr.get(i));
         pitetotalService.add(i, pvalue);

      }

      return pitetotalService;
   }

}