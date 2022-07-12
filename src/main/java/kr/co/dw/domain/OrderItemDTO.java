package kr.co.dw.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;

public class OrderItemDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int oid;
	private String orderId;
	private int iId;
	private String iName;
	private int iCount;
	private int iPrice;
	private int iDc;
	private String orderState;
	private Date orderDate;
	private String i_CATEGORY;
	private String ifilename;
	private int savePoint;
	private int salePrice;
	private int totalPrice;
	private int totalSavePoint;
	
	public OrderItemDTO() {
		// TODO Auto-generated constructor stub
	}
	


	public OrderItemDTO(int oid, String orderId, int iId, String iName, int iCount, int iPrice, int iDc,
			String orderState, Date orderDate, String i_CATEGORY, String ifilename, int savePoint, int salePrice,
			int totalPrice, int totalSavePoint) {
		super();
		this.oid = oid;
		this.orderId = orderId;
		this.iId = iId;
		this.iName = iName;
		this.iCount = iCount;
		this.iPrice = iPrice;
		this.iDc = iDc;
		this.orderState = orderState;
		this.orderDate = orderDate;
		this.i_CATEGORY = i_CATEGORY;
		this.ifilename = ifilename;
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



	public String getiName() {
		return iName;
	}



	public void setiName(String iName) {
		this.iName = iName;
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




	public String getOrderState() {
		return orderState;
	}




	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}




	public Date getOrderDate() {
		return orderDate;
	}




	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}




	public String getI_CATEGORY() {
		return i_CATEGORY;
	}




	public void setI_CATEGORY(String i_CATEGORY) {
		this.i_CATEGORY = i_CATEGORY;
	}




	public String getIfilename() {
		return ifilename;
	}



	public void setIfilename(String ifilename) {
		this.ifilename = ifilename;
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
		return Objects.hash(oid);
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
		return oid == other.oid;
	}

	
	

	@Override
	public String toString() {
		return "OrderItemDTO [oid=" + oid + ", orderId=" + orderId + ", iId=" + iId + ", iName=" + iName + ", iCount="
				+ iCount + ", iPrice=" + iPrice + ", iDc=" + iDc + ", orderState=" + orderState + ", orderDate="
				+ orderDate + ", i_CATEGORY=" + i_CATEGORY + ", ifilename=" + ifilename + ", savePoint=" + savePoint
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
