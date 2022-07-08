package kr.co.dw.domain;

import java.io.Serializable;

public class OrderCancelDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String mid;
	private String orderId;
	
	public OrderCancelDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderCancelDTO(String mid, String orderId) {
		super();
		this.mid = mid;
		this.orderId = orderId;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "OrderCancelDTO [mid=" + mid + ", orderId=" + orderId + "]";
	}
	
	
	
	
}
