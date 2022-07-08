package kr.co.dw.domain;

import java.util.Objects;

public class QaDTO {

	private int qno;
	private String mid;
	private String qtitle;
	private String qcontent;
	private String qdate;
	private String qupdateday;
	private int qreadcnt;
	
	
	public QaDTO() {
		// TODO Auto-generated constructor stub
	}


	public QaDTO(int qno, String mid, String qtitle, String qcontent, String qdate, String qupdateday, int qreadcnt) {
		super();
		this.qno = qno;
		this.mid = mid;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qdate = qdate;
		this.qupdateday = qupdateday;
		this.qreadcnt = qreadcnt;
	}


	public int getQno() {
		return qno;
	}


	public void setQno(int qno) {
		this.qno = qno;
	}


	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}


	public String getQtitle() {
		return qtitle;
	}


	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}


	public String getQcontent() {
		return qcontent;
	}


	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}


	public String getQdate() {
		return qdate;
	}


	public void setQdate(String qdate) {
		this.qdate = qdate;
	}


	public String getQupdateday() {
		return qupdateday;
	}


	public void setQupdateday(String qupdateday) {
		this.qupdateday = qupdateday;
	}


	public int getQreadcnt() {
		return qreadcnt;
	}


	public void setQreadcnt(int qreadcnt) {
		this.qreadcnt = qreadcnt;
	}


	@Override
	public int hashCode() {
		return Objects.hash(qno);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		QaDTO other = (QaDTO) obj;
		return qno == other.qno;
	}


	@Override
	public String toString() {
		return "QaDTO [qno=" + qno + ", mid=" + mid + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qdate="
				+ qdate + ", qupdateday=" + qupdateday + ", qreadcnt=" + qreadcnt + "]";
	}
	
	
}
