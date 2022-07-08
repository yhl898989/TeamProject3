package kr.co.dw.repository.readcnt;

public interface ReadCntDao {
	void insert(String ip,int nno);
	
	String read(String ip,int nno);
	
}
