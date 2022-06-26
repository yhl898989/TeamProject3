package kr.co.dw.domain;

import java.io.Serializable;
import java.util.List;

public class OrderPageDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private List<OrderPageItemDTO> orders;
	
	public OrderPageDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderPageDTO(List<OrderPageItemDTO> orders) {
		super();
		this.orders = orders;
	}

	public List<OrderPageItemDTO> getOrders() {
		return orders;
	}

	public void setOrders(List<OrderPageItemDTO> orders) {
		this.orders = orders;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "OrderPageDTO [orders=" + orders + "]";
	}
	
	
	

}
