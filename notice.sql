CREATE TABLE tbl_notice(
nno NUMBER,
aid VARCHAR2(100),
ntitle VARCHAR2(600) NOT NULL,
ncontent VARCHAR2(3000) NOT NULL,
ndate DATE DEFAULT SYSDATE,
nupdateday DATE DEFAULT SYSDATE,
nreadcnt NUMBER DEFAULT 0,
CONSTRAINT pk_notice_nno PRIMARY KEY(nno),
CONSTRAINT fk_admin_aid FOREIGN KEY (aid) REFERENCES tbl_admin(aid) ON DELETE CASCADE
)

INSERT INTO tbl_notice (nno,aid,ntitle,ncontent,ndate,nupdateday,nreadcnt) values (2,'aa','tiger','wild',sysdate,sysdate,0)

select * from tbl_notice

ALTER TABLE tbl_admin ADD CONSTRAINT FK_tbl_noticeaid FOREIGN KEY(tbl_notice_aid) REFERENCES tbl_notice(aid);
delete from tbl_notice
CREATE SEQUENCE seq_notice_nno

delete from tbl_notice
drop table tbl_notice


drop table tbl_notice CASCADE CONSTRAINTS