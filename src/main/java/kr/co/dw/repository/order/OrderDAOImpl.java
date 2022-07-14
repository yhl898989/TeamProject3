package kr.co.dw.repository.order;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.dw.domain.ItemDTO;
import kr.co.dw.domain.MemberDTO;
import kr.co.dw.domain.OrderDTO;
import kr.co.dw.domain.OrderItemDTO;
import kr.co.dw.domain.OrderPageItemDTO;
import kr.co.dw.domain.PageTO;
import kr.co.dw.domain.SaleDTO;

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

   @Override
   public List<OrderDTO> orderList() {
      // TODO Auto-generated method stub
      return sqlsession.selectList(NAMESPACE+".orderList");
   }

   @Override
   public void orderUpdate(String orderId) {
      sqlsession.update(NAMESPACE+".orderUpdate", orderId);
      
   }

   @Override
   public int orderCancle(String orderId) {
      // TODO Auto-generated method stub
      return sqlsession.update(NAMESPACE+".orderCancle", orderId);
   }

   @Override
   public List<OrderItemDTO> getOrderItemInfo(String orderId) {
      // TODO Auto-generated method stub
      return sqlsession.selectList(NAMESPACE+".getOrderItemInfo", orderId);
   }

   @Override
   public OrderDTO getOrder(String orderId) {
      // TODO Auto-generated method stub
      return sqlsession.selectOne(NAMESPACE+".getOrder", orderId);
   }

   @Override
   public List<OrderDTO> orderMemberList(String mid) {
      // TODO Auto-generated method stub
      return sqlsession.selectList(NAMESPACE+".ordermemberList",mid);
   }

   @Override
   public OrderDTO orderRead(String orderId) {
      // TODO Auto-generated method stub
      return sqlsession.selectOne(NAMESPACE+".orderRead",orderId);
   }

   @Override
   public OrderItemDTO orderItemRead(String orderId) {
      // TODO Auto-generated method stub
      return sqlsession.selectOne(NAMESPACE+".orderItemRead", orderId);
   }

   @Override
   public void orderAddUpdate(OrderDTO odto) {
      sqlsession.update(NAMESPACE+".orderAddUpdate", odto);
      
   }

   @Override
   public Integer getAmountOrder() {
      // TODO Auto-generated method stub
      return sqlsession.selectOne(NAMESPACE+".getAmountOrder");
   }

   @Override
   public List<OrderDTO> OrderList(PageTO<OrderDTO> pt) {
      RowBounds rb = new RowBounds(pt.getStartNum()-1,pt.getPerPage());
      
      
      return sqlsession.selectList(NAMESPACE+".orderList", null, rb);
   }

   @Override
   public Integer getAmountmyOrder(String mid) {
      // TODO Auto-generated method stub
      return sqlsession.selectOne(NAMESPACE+".getAmountmyOrder", mid);
   }

   @Override
   public List<OrderDTO> myOrderList(PageTO<OrderDTO> pt, String mid) {
      
      RowBounds rb = new RowBounds(pt.getStartNum()-1,pt.getPerPage());
      
      
      return sqlsession.selectList(NAMESPACE+".myOrderList", mid, rb);
   }

   @Override
   public long gettodayPrice() {
      // TODO Auto-generated method stub
      return sqlsession.selectOne(NAMESPACE+".gettodayPrice");
   }

   @Override
   public long getAllPrice() {
      // TODO Auto-generated method stub
      return sqlsession.selectOne(NAMESPACE+".getAllPrice");
   }

   @Override
   public long getsale(SaleDTO sdto) {
      // TODO Auto-generated method stub
      return sqlsession.selectOne(NAMESPACE+".getsale", sdto);
   }


   @Override
   public List<OrderDTO> checkOid(String mid) {
      // TODO Auto-generated method stub
      return sqlsession.selectList(NAMESPACE+".checkOid", mid);
   }
   
   @Override
   public Integer count(Map<String, Object> map, String orderId) {
      // TODO Auto-generated method stub
      map.put("orderId", orderId);
      return sqlsession.selectOne(NAMESPACE+".count", map);
   }

   @Override
   public long weekSale(String lis) {
      // TODO Auto-generated method stub
      System.out.println(lis);
      return sqlsession.selectOne(NAMESPACE+".weekSale", lis);
   }
   
   @Override
   public long monthSales(String sos) {
      // TODO Auto-generated method stub
      return sqlsession.selectOne(NAMESPACE+".monthsale", sos);
   }

   @Override
   public List<Integer> gettodaytotal() {
      // TODO Auto-generated method stub
      return sqlsession.selectList(NAMESPACE+".gettotal");
   }
   
   @Override
   public void orderItemUpdate(String orderId) {
      // TODO Auto-generated method stub
      sqlsession.update(NAMESPACE+".orderItemUpdate", orderId);
   }
   
   @Override
   public void orderItemCancle(String orderId) {
      // TODO Auto-generated method stub
      sqlsession.update(NAMESPACE+".orderItemCancle", orderId);
   }
   
   @Override
   public List<OrderItemDTO> getOrderItem() {
      // TODO Auto-generated method stub
      return sqlsession.selectList(NAMESPACE+".getOrderItem");
   }
   
   @Override
   public long pietotals(String string) {
      // TODO Auto-generated method stub
   
      return sqlsession.selectOne(NAMESPACE+".pietotals", string) ;
   }

   @Override
   public void deleteMid(MemberDTO dto) {
      sqlsession.update(NAMESPACE+".deleteMid", dto);
      
   }
   
}