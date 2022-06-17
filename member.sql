CREATE TABLE tbl_member(
id VARCHAR2(6),
pw VARCHAR2(600),
name VARCHAR2(15),
phone VARCHAR2(15),
birth DATE,
CONSTRAINT pk_member_id PRIMARY KEY(id)
)

SELECT * FROM tbl_member

drop table member3
drop table tbl_readcnt
drop table tbl_upload
drop table tbl_board_notice

SELECT * FROM tabs
SELECT A.UNIQUENESS

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = tbl_member;
