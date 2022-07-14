CREATE TABLE tbl_qa(
qno NUMBER,
mid VARCHAR2(100),
qtitle VARCHAR2(600) NOT NULL,
qcontent VARCHAR2(3000) NOT NULL,
qdate DATE DEFAULT SYSDATE,
qupdateday DATE DEFAULT SYSDATE,
qreadcnt NUMBER DEFAULT 0,
CONSTRAINT pk_qa_qno PRIMARY KEY(qno),
CONSTRAINT fk_member_mid FOREIGN KEY(mid) REFERENCES tbl_member(mid) ON DELETE CASCADE
)

DROP table tbl_qa CASCADE CONSTRAINTS PURGE;
select*from tbl_qa

drop table tbl_qa CASCADE CONSTRAINTS

CREATE SEQUENCE seq_qa_qno

INSERT INTO tbl_qa(qno,mid,qtitle,qcontent,qdate,qupdateday,qreadcnt) values (55,'bb','giraffe','foresttree',sysdate,sysdate,0)


SELECT 
	CONSTRAINT_NAME
    ,CONSTRAINT_TYPE
    , TABLE_NAME
    ,R_CONSTRAINT_NAME  
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'tbl_qa'