CREATE TABLE tbl_admin(
aid VARCHAR2(150),
apw VARCHAR2(600),
aauth  NUMBER DEFAULT 2,
aname VARCHAR2(100),
CONSTRAINT pk_admin_aid PRIMARY KEY(aid)
)

drop table tbl_admin

insert into tbl_admin (aid, apw, aauth, aname)  values ('aa', 'aa', 2, 'aa')

select * from tbl_admin


delete from tbl_admin where aid = 'bb'