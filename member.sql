CREATE TABLE tbl_member(
mid VARCHAR2(150),
mpw VARCHAR2(600),
mname VARCHAR2(15),
memail VARCHAR2(300),
mphone VARCHAR2(15),
maddress VARCHAR2(300),
mbirth DATE,
macount VARCHAR2(3000),
mpoint VARCHAR2(3000),
CONSTRAINT pk_member_mid PRIMARY KEY(mid)
)


INSERT INTO tbl_member
		(mid, mpw, mname, memail, mphone, maddress, mbirth)
		VALUES
		('12', '12', '12', '12@12', '010-0000-0000', '중랑구', '2002-02-02')