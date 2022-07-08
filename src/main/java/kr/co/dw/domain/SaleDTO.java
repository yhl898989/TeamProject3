package kr.co.dw.domain;

import java.io.Serializable;

public class SaleDTO implements  Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String start;
	private String end;
	
	public SaleDTO() {
		// TODO Auto-generated constructor stub
	}

	public SaleDTO(String start, String end) {
		super();
		this.start = start;
		this.end = end;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SaleDTO [start=" + start + ", end=" + end + "]";
	}
	
	
	
	
}
