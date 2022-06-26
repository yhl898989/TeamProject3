package kr.co.dw.domain;

import java.io.Serializable;

public class OrderPageItemDTO  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int iId;
	private int iCount;
	
	private String ifilename;
	private String iName;
	private int iPrice;
	private int iDc;
	
	private int salePrice;
	private int totalPrice;
	
	private int	point;
	private int totalPoint;
	
	public OrderPageItemDTO() {
		// TODO Auto-generated constructor stub
	}

	public OrderPageItemDTO(int iId, int iCount, String iName, int iPrice, int iDc, int salePrice, int totalPrice,
			int point, int totalPoint) {
		super();
		this.iId = iId;
		this.iCount = iCount;
		this.iName = iName;
		this.iPrice = iPrice;
		this.iDc = iDc;
		this.salePrice = salePrice;
		this.totalPrice = totalPrice;
		this.point = point;
		this.totalPoint = totalPoint;
	}

	public int getiId() {
		return iId;
	}

	public void setiId(int iId) {
		this.iId = iId;
	}

	public int getiCount() {
		return iCount;
	}

	public void setiCount(int iCount) {
		this.iCount = iCount;
	}

	public String getiName() {
		return iName;
	}

	public void setiName(String iName) {
		this.iName = iName;
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

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public void initSaleTotal() {
		
		int dc = (int) (this.iPrice *(this.iDc *0.01));
		
		this.salePrice = this.iPrice-dc;
		this.totalPrice = this.salePrice * this.iCount;
		this.point = (int)(Math.floor(this.salePrice*0.05));
		this.totalPoint = this.point * this.iCount;
	}

	
	public String getIfilename() {
		return ifilename;
	}

	public void setIfilename(String ifilename) {
		this.ifilename = ifilename;
	}

	@Override
	public String toString() {
		return "OrderItemDTO [iId=" + iId + ", iCount=" + iCount + ", ifilename=" + ifilename + ", iName=" + iName
				+ ", iPrice=" + iPrice + ", iDc=" + iDc + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice
				+ ", point=" + point + ", totalPoint=" + totalPoint + "]";
	}


	
	
	
	
	
	
	
	

}

