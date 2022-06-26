package kr.co.dw.domain;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

public class ReviewDTO implements Serializable{


	private static final long serialVersionUID = 1L;
	private int rno;
	private int iId;
	private String mid;
	private String rtitle;
	private String rcontent;
	private String regDay;
	private String updateDay;
	private List<String> rfilenamelist;
	
	public ReviewDTO() {
		// TODO Auto-generated constructor stub
	}


	public ReviewDTO(int rno, int iId, String rtitle, String rcontent, String regDay, String updateDay ,String mid) {
		super();
		this.rno = rno;
		this.iId = iId;
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		this.regDay = regDay;
		this.updateDay = updateDay;
		this.mid = mid;
	}
	
	

	public ReviewDTO(int rno, int iId, String mid, String rtitle, String rcontent, String regDay, String updateDay,
			List<String> rfilenamelist) {
		super();
		this.rno = rno;
		this.iId = iId;
		this.mid = mid;
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		this.regDay = regDay;
		this.updateDay = updateDay;
		this.rfilenamelist = rfilenamelist;
	}


	public int getRno() {
		return rno;
	}


	public void setRno(int rno) {
		this.rno = rno;
	}


	public int getiId() {
		return iId;
	}


	public void setiId(int iId) {
		this.iId = iId;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getRtitle() {
		return rtitle;
	}


	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}


	public String getRcontent() {
		return rcontent;
	}


	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}


	public String getRegDay() {
		return regDay;
	}


	public void setRegDay(String regDay) {
		this.regDay = regDay;
	}


	public String getUpdateDay() {
		return updateDay;
	}


	public void setUpdateDay(String updateDay) {
		this.updateDay = updateDay;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	

	public List<String> getRfilenamelist() {
		return rfilenamelist;
	}


	public void setRfilenamelist(List<String> rfilenamelist) {
		this.rfilenamelist = rfilenamelist;
	}


	@Override
	public int hashCode() {
		return Objects.hash(iId, mid, rcontent, regDay, rno, rtitle, updateDay);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewDTO other = (ReviewDTO) obj;
		return iId == other.iId && Objects.equals(mid, other.mid) && Objects.equals(rcontent, other.rcontent)
				&& Objects.equals(regDay, other.regDay) && rno == other.rno && Objects.equals(rtitle, other.rtitle)
				&& Objects.equals(updateDay, other.updateDay);
	}


	@Override
	public String toString() {
		return "ReviewDTO [rno=" + rno + ", iId=" + iId + ", mid=" + mid + ", rtitle=" + rtitle + ", rcontent="
				+ rcontent + ", regDay=" + regDay + ", updateDay=" + updateDay + "]";
	}

}
