CREATE TABLE tbl_member(
id VARCHAR2(6),
pw VARCHAR2(600),
name VARCHAR2(15),
phone VARCHAR2(15),
birth DATE,
CONSTRAINT pk_member_id PRIMARY KEY(id)
)

SELECT * FROM tbl_review

drop table tbl_member
drop table tbl_readcnt
drop table tbl_upload
drop table tbl_board

SELECT * FROM tabs
SELECT A.UNIQUENESS

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = tbl_member;

CREATE TABLE tbl_review(
rno NUMBER,
iId NUMBER,
rtitle VARCHAR2(600),
rcontent VARCHAR2(3000),
regDay DATE DEFAULT SYSDATE,
updateDay DATE DEFAULT SYSDATE,
CONSTRAINT pk_review_rno PRIMARY KEY(rno),
CONSTRAINT fk_review_iid FOREIGN KEY (iId) REFERENCES tbl_item(iId)
)

CREATE SEQUENCE seq_review_rno