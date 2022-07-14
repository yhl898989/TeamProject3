package kr.co.dw.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.Objects;

public class MemberDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String mid;
	private String mpw;
	private String mname;
	private String memail;
	private String mphone;
	private String maddress1;
	private String maddress2;
	private String maddress3;
	private Date mbirth;
	private int macount;
	private long mmoney;
	private long mpoint;
	private int msocial;
	
	
	public MemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String mid, String mpw, String mname, String memail, String mphone, String maddress1,
			String maddress2, String maddress3, Date mbirth, int macount, long mmoney, long mpoint) {
		super();
		this.mid = mid;
		this.mpw = mpw;
		this.mname = mname;
		this.memail = memail;
		this.mphone = mphone;
		this.maddress1 = maddress1;
		this.maddress2 = maddress2;
		this.maddress3 = maddress3;
		this.mbirth = mbirth;
		this.macount = macount;
		this.mmoney = mmoney;
		this.mpoint = mpoint;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMpw() {
		return mpw;
	}

	public void setMpw(String mpw) {
		this.mpw = mpw;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMemail() {
		return memail;
	}

	public void setMemail(String memail) {
		this.memail = memail;
	}

	public String getMphone() {
		return mphone;
	}

	public void setMphone(String mphone) {
		this.mphone = mphone;
	}

	public String getMaddress1() {
		return maddress1;
	}

	public void setMaddress1(String maddress1) {
		this.maddress1 = maddress1;
	}

	public String getMaddress2() {
		return maddress2;
	}

	public void setMaddress2(String maddress2) {
		this.maddress2 = maddress2;
	}

	public String getMaddress3() {
		return maddress3;
	}

	public void setMaddress3(String maddress3) {
		this.maddress3 = maddress3;
	}

	public Date getMbirth() {
		return mbirth;
	}

	public void setMbirth(Date mbirth) {
		this.mbirth = mbirth;
	}

	public int getMacount() {
		return macount;
	}

	public void setMacount(int macount) {
		this.macount = macount;
	}

	public long getMmoney() {
		return mmoney;
	}

	public void setMmoney(long mmoney) {
		this.mmoney = mmoney;
	}

	public long getMpoint() {
		return mpoint;
	}

	public void setMpoint(long mpoint) {
		this.mpoint = mpoint;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		return Objects.hash(mid, mpw);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberDTO other = (MemberDTO) obj;
		return Objects.equals(mid, other.mid) && Objects.equals(mpw, other.mpw);
	}

	@Override
	public String toString() {
		return "MemberDTO [mid=" + mid + ", mpw=" + mpw + ", mname=" + mname + ", memail=" + memail + ", mphone="
				+ mphone + ", maddress1=" + maddress1 + ", maddress2=" + maddress2 + ", maddress3=" + maddress3
				+ ", mbirth=" + mbirth + ", macount=" + macount + ", mmoney=" + mmoney + ", mpoint=" + mpoint
				+ ", msocial=" + msocial + "]";
	}

	public MemberDTO(int msocial) {
		super();
		this.msocial = msocial;
	}

	public int getMsocial() {
		return msocial;
	}

	public void setMsocial(int msocial) {
		this.msocial = msocial;
	}

	
	
	
}
