package kr.co.dw.domain;

import java.util.Objects;

public class AdminDTO {
	private String aid;
	private String apw;
	private int aauth;
	private String aname;
	
	public AdminDTO() {
		// TODO Auto-generated constructor stub
	}

	public AdminDTO(String aid, String apw, int aauth, String aname) {
		super();
		this.aid = aid;
		this.apw = apw;
		this.aauth = aauth;
		this.aname = aname;
	}

	public String getAid() {
		return aid;
	}

	public void setAid(String aid) {
		this.aid = aid;
	}

	public String getApw() {
		return apw;
	}

	public void setApw(String apw) {
		this.apw = apw;
	}

	public int getAauth() {
		return aauth;
	}

	public void setAauth(int aauth) {
		this.aauth = aauth;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	@Override
	public int hashCode() {
		return Objects.hash(aid, apw);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AdminDTO other = (AdminDTO) obj;
		return Objects.equals(aid, other.aid) && Objects.equals(apw, other.apw);
	}

	@Override
	public String toString() {
		return "adminDTO [aid=" + aid + ", apw=" + apw + ", aauth=" + aauth + ", aname=" + aname + "]";
	}
	
	
}
