CREATE TABLE tbl_member(
mid VARCHAR2(150),
mpw VARCHAR2(600),
mname VARCHAR2(15),
memail VARCHAR2(300),
mphone VARCHAR2(15),
maddress1 VARCHAR2(300),
maddress2 VARCHAR2(300),
maddress3 VARCHAR2(300),
mbirth DATE,
macount NUMBER,
mmoney number default 10000000,
mpoint NUMBER,
msocial NUMBER default 0,
CONSTRAINT pk_member_mid PRIMARY KEY(mid)
)

DROP table tbl_member cascade constraint


INSERT INTO tbl_member
		(mid, mpw, mname, memail, mphone, maddress, mbirth)
		VALUES
		('12', '12', '12', '12@12', '010-0000-0000', '중랑구', '2002-02-02')
		
select * from tbl_member

