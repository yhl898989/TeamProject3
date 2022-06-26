package kr.co.dw.domain;

import java.io.Serializable;
import java.util.Objects;

public class OrderItemDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int oid;
	private String orderId;
	private int iId;
	private int orderItemId;
	private int iCount;
	private int iPrice;
	private int iDc;
	private int savePoint;
	private int salePrice;
	private int totalPrice;
	private int totalSavePoint;
	
	public OrderItemDTO() {
		
	}
	
	public OrderItemDTO(int oid, String orderId, int iId, int orderItemId, int iCount, int iPrice, int iDc,
			int savePoint, int salePrice, int totalPrice, int totalSavePoint) {
		super();
		this.oid = oid;
		this.orderId = orderId;
		this.iId = iId;
		this.orderItemId = orderItemId;
		this.iCount = iCount;
		this.iPrice = iPrice;
		this.iDc = iDc;
		this.savePoint = savePoint;
		this.salePrice = salePrice;
		this.totalPrice = totalPrice;
		this.totalSavePoint = totalSavePoint;
	}



	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getiId() {
		return iId;
	}

	public void setiId(int iId) {
		this.iId = iId;
	}

	public int getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(int orderItemId) {
		this.orderItemId = orderItemId;
	}

	public int getiCount() {
		return iCount;
	}

	public void setiCount(int iCount) {
		this.iCount = iCount;
	}

	public int getiPrice() {
		return iPrice;
	}

	public void setiPrice(int iPrice) {
		this.iPrice = iPrice;
	}

	public int getiDc() {
		return iDc;
	}

	public void setiDc(int iDc) {
		this.iDc = iDc;
	}

	public int getSavePoint() {
		return savePoint;
	}

	public void setSavePoint(int savePoint) {
		this.savePoint = savePoint;
	}

	public int getSalePrice() {
		return salePrice;
	}

	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getTotalSavePoint() {
		return totalSavePoint;
	}

	public void setTotalSavePoint(int totalSavePoint) {
		this.totalSavePoint = totalSavePoint;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	@Override
	public int hashCode() {
		return Objects.hash(iCount, iDc, iId, iPrice, oid, orderId, orderItemId, salePrice, savePoint, totalPrice,
				totalSavePoint);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		OrderItemDTO other = (OrderItemDTO) obj;
		return iCount == other.iCount && iDc == other.iDc && iId == other.iId && iPrice == other.iPrice
				&& oid == other.oid && Objects.equals(orderId, other.orderId) && orderItemId == other.orderItemId
				&& salePrice == other.salePrice && savePoint == other.savePoint && totalPrice == other.totalPrice
				&& totalSavePoint == other.totalSavePoint;
	}

	@Override
	public String toString() {
		return "OrderItemDTO [oid=" + oid + ", orderId=" + orderId + ", iId=" + iId + ", orderItemId=" + orderItemId
				+ ", iCount=" + iCount + ", iPrice=" + iPrice + ", iDc=" + iDc + ", savePoint=" + savePoint
				+ ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + ", totalSavePoint=" + totalSavePoint
				+ "]";
	}

	public void initsaleTotal() {
		
		int dc = (int)(this.iPrice*(this.iDc*0.01));
		
		this.salePrice = this.iPrice-dc;
		this.totalPrice = this.salePrice * this.iCount;
		this.savePoint = (int)(Math.floor(this.salePrice*0.05));
		this.totalSavePoint = this.savePoint * this.iCount; 
	}
	
}
