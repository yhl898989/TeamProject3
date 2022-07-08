CREATE TABLE tbl_readcnt(
	ip VARCHAR2(300),
	nno NUMBER,
	CONSTRAINT pk_readcnt_ipNbno PRIMARY KEY(ip,nno)
)


drop table tbl_readcnt CASCADE CONSTRAINTS