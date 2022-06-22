CREATE TABLE tbl_member(
mid VARCHAR2(150),
mpw VARCHAR2(600) NOT NULL,
mname VARCHAR2(15) NOT NULL,
memail VARCHAR2(300) NOT NULL,
mphone VARCHAR2(15) NOT NULL,
maddress VARCHAR2(500) NOT NULL,
mbirth DATE NOT NULL,
macount NUMBER,
mpoint NUMBER,
CONSTRAINT pk_member_mid PRIMARY KEY(mid)
)

DROP table tbl_member


INSERT INTO tbl_member
		(mid, mpw, mname, memail, mphone, maddress, mbirth)
		VALUES
		('12', '12', '12', '12@12', '010-0000-0000', '중랑구', '2002-02-02')