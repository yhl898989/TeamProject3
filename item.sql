CREATE TABLE tbl_item(
iId NUMBER,
iName VARCHAR2(60) NOT NULL,
iPrice NUMBER NOT NULL,
iDc NUMBER DEFAULT 0,
iCount NUMBER NOT NULL,
ifilename VARCHAR2(100),
i_CATEGORY VARCHAR2(100),
CONSTRAINT pk_item_iId PRIMARY KEY(iId)
)
CREATE TABLE itemfileupload(
ifilename VARCHAR2(300),
iId NUMBER,
CONSTRAINT fk_upload_iId FOREIGN KEY (iId) REFERENCES tbl_item(iId)
)

create sequence seq_item_iId 

drop table tbl_item

drop table itemfileupload

drop table tbl_member




delete from itemfileupload
delete from tbl_item
select * from tbl_item
select * from itemfileupload

