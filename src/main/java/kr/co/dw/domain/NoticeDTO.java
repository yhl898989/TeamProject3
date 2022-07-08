package kr.co.dw.domain;

import java.io.Serializable;
import java.util.Objects;

public class NoticeDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int nno;
	private String aid;
	private String ntitle;
	private String ncontent;
	private String ndate;
	private String nupdateday;
	private int nreadcnt;
	private String userId;
	
	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int nno, String aid, String ntitle, String ncontent, String ndate, String nupdateday, int nreadcnt,
			String userId) {
		super();
		this.nno = nno;
		this.aid = aid;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.ndate = ndate;
		this.nupdateday = nupdateday;
		this.nreadcnt = nreadcnt;
		this.userId = userId;
	}

	public int getNno() {
		return nno;
	}

	public void setNno(int nno) {
		this.nno = nno;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}

	public String getNupdateday() {
		return nupdateday;
	}

	public void setNupdateday(String nupdateday) {
		this.nupdateday = nupdateday;
	}

	public int getNreadcnt() {
		return nreadcnt;
	}

	public void setNreadcnt(int nreadcnt) {
		this.nreadcnt = nreadcnt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(nno);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NoticeDTO other = (NoticeDTO) obj;
		return nno == other.nno;
	}

	@Override
	public String toString() {
		return "NoticeDTO [nno=" + nno + ", aid=" + aid + ", ntitle=" + ntitle + ", ncontent=" + ncontent + ", ndate="
				+ ndate + ", nupdateday=" + nupdateday + ", nreadcnt=" + nreadcnt + ", userId=" + userId + "]";
	}

	
	
}
