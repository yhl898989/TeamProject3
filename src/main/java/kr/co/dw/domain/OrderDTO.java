package kr.co.dw.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;

public class OrderDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String orderId;
	private String addressee;
	private String mid;
	private String memberAddr1;
	private String memberAddr2;
	private String memberAddr3;
	private String orderState;
	private List<OrderItemDTO> orders;
	private int deliveryCost;
	private int usePoint;
	private String i_CATEGORY;
	private Date orderDate;
	private int orderSalePrice;
	private int savePoint;
	private int orderFinalSalePrice;
	
	public OrderDTO() {
		
	}
	
	public OrderDTO(String orderId, String addressee, String mid, String memberAddr1, String memberAddr2,
			String memberAddr3, String orderState, List<OrderItemDTO> orders, int deliveryCost, int usePoint,
			String i_CATEGORY, Date orderDate, int orderSalePrice, int savePoint,
			int orderFinalSalePrice) {
		super();
		this.orderId = orderId;
		this.addressee = addressee;
		this.mid = mid;
		this.memberAddr1 = memberAddr1;
		this.memberAddr2 = memberAddr2;
		this.memberAddr3 = memberAddr3;
		this.orderState = orderState;
		this.orders = orders;
		this.deliveryCost = deliveryCost;
		this.usePoint = usePoint;
		this.i_CATEGORY = i_CATEGORY;
		this.orderDate = orderDate;
		this.orderSalePrice = orderSalePrice;
		this.savePoint = savePoint;
		this.orderFinalSalePrice = orderFinalSalePrice;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getAddressee() {
		return addressee;
	}

	public void setAddressee(String addressee) {
		this.addressee = addressee;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMemberAddr1() {
		return memberAddr1;
	}

	public void setMemberAddr1(String memberAddr1) {
		this.memberAddr1 = memberAddr1;
	}

	public String getMemberAddr2() {
		return memberAddr2;
	}

	public void setMemberAddr2(String memberAddr2) {
		this.memberAddr2 = memberAddr2;
	}

	public String getMemberAddr3() {
		return memberAddr3;
	}

	public void setMemberAddr3(String memberAddr3) {
		this.memberAddr3 = memberAddr3;
	}

	public String getOrderState() {
		return orderState;
	}

	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}

	public List<OrderItemDTO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderItemDTO> orders) {
		this.orders = orders;
	}

	public int getDeliveryCost() {
		return deliveryCost;
	}

	public void setDeliveryCost(int deliveryCost) {
		this.deliveryCost = deliveryCost;
	}

	public int getUsePoint() {
		return usePoint;
	}

	public void setUsePoint(int usePoint) {
		this.usePoint = usePoint;
	}

	public String getI_CATEGORY() {
		return i_CATEGORY;
	}

	public void setI_CATEGORY(String i_CATEGORY) {
		this.i_CATEGORY = i_CATEGORY;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public int getOrderSalePrice() {
		return orderSalePrice;
	}

	public void setOrderSalePrice(int orderSalePrice) {
		this.orderSalePrice = orderSalePrice;
	}

	public int getSavePoint() {
		return savePoint;
	}

	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}

	public int getOrderFinalSalePrice() {
		return orderFinalSalePrice;
	}

	public void setOrderFinalSalePrice(int orderFinalSalePrice) {
		this.orderFinalSalePrice = orderFinalSalePrice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(addressee, deliveryCost, memberAddr1, memberAddr2, memberAddr3, mid, orderDate,
				orderFinalSalePrice, orderId, orderSalePrice,savePoint, orderState, orders, usePoint);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderDTO other = (OrderDTO) obj;
		return Objects.equals(addressee, other.addressee) && deliveryCost == other.deliveryCost
				&& Objects.equals(memberAddr1, other.memberAddr1) && Objects.equals(memberAddr2, other.memberAddr2)
				&& Objects.equals(memberAddr3, other.memberAddr3) && Objects.equals(mid, other.mid)
				&& Objects.equals(orderDate, other.orderDate) && orderFinalSalePrice == other.orderFinalSalePrice
				&& Objects.equals(orderId, other.orderId) && orderSalePrice == other.orderSalePrice
				&& savePoint == other.savePoint && Objects.equals(orderState, other.orderState)
				&& Objects.equals(orders, other.orders) && usePoint == other.usePoint;
	}

	@Override
	public String toString() {
		return "OrderDTO [orderId=" + orderId + ", addressee=" + addressee + ", mid=" + mid + ", memberAddr1="
				+ memberAddr1 + ", memberAddr2=" + memberAddr2 + ", memberAddr3=" + memberAddr3 + ", orderState="
				+ orderState + ", orders=" + orders + ", deliveryCost=" + deliveryCost + ", usePoint=" + usePoint
				+ ", i_CATEGORY=" + i_CATEGORY + ", orderDate=" + orderDate + ", orderSalePrice=" + orderSalePrice
				+ ", savePoint=" + savePoint + ", orderFinalSalePrice=" + orderFinalSalePrice + "]";
	}

	public void getOrderPriceInfo() {
		for(OrderItemDTO order : orders) {
			orderSalePrice += order.getTotalPrice();
			savePoint += order.getTotalSavePoint();
		}
		
		if(orderSalePrice >= 30000) {
			deliveryCost = 0;
		} else {
			deliveryCost = 3000;
		}
		
		orderFinalSalePrice = orderSalePrice + deliveryCost - usePoint;
	}
}
