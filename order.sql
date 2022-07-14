create table tbl_order(
    orderId VARCHAR2(50),
    addressee varchar2(50) not null,
    mid varchar2(150),
    memberAddr1 varchar2(100) not null,
    memberAddr2 varchar2(100) not null,
    memberAddr3 varchar2(100) not null,
    orderState varchar2(30) not null,
    deliveryCost NUMBER not null,
    usePoint NUMBER not null,
    savePoint NUMBER not null,
    i_CATEGORY VARCHAR2(100),
    orderDate DATE DEFAULT SYSDATE,
    orderFinalSalePrice NUMBER not null,
    CONSTRAINT pk_order_orderId PRIMARY KEY(orderId)
)

create table tbl_orderItem(
    oid NUMBER,
    orderId varchar2(50),
    iId NUMBER,
    iName varchar2(60),
      iCount NUMBER not null,
    iPrice NUMBER not null,
    iDc NUMBER not null,
    orderState VARCHAR2(30),
    orderDate DATE DEFAULT SYSDATE,
    i_CATEGORY VARCHAR2(100),
    ifilename VARCHAR2(100),
    savePoint NUMBER not null,
    CONSTRAINT pk_orderItem_oid PRIMARY KEY(oid),
    CONSTRAINT fk_orderItem_orderId FOREIGN KEY (orderId) REFERENCES tbl_order(orderId)
)


select o.iName, o.icount from tbl_item i, tbl_orderItem o where i.iName = o.iName 

SELECT m.id, t.did, t.name, m.name FROM member m , test t WHERE m.did = t.did ;

create sequence seq_orderItem_oid

SELECT * FROM tabs

TO_CHAR(orderDate, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD')
select orderFinalSalePrice FROM tbl_order WHERE TO_CHAR(orderDate, 'yyyy-mm-dd') = '2022-07-04'
select orderFinalSalePrice FROM tbl_order WHERE TO_CHAR(orderDate, 'yyyy-mm-dd') = TO_CHAR(SYSDATE, 'YYYYMMDD')
select sum(orderFinalSalePrice) from tbl_order where TO_CHAR(orderDate, 'YYYYMMDD') = TO_CHAR(SYSDATE, 'YYYYMMDD') and orderstate ='배송완료'

select TO_CHAR(orderDate,'yyyy-mm-dd') from tbl_order WHERE orderDate
select * from tbl_order
select * from tbl_orderItem

select * from tbl_order where orderstate ='배송완료'

drop table tbl_order
drop table tbl_orderItem

SELECT COUNT(orderId) FROM tbl_order WHERE mid = '12'

update tbl_order set mid = '(탈퇴한회원)' where mid = '1234(삭제)'


select orderFinalSalePrice FROM tbl_order WHERE TO_CHAR(orderDate, 'yyyy-mm-dd') = TO_CHAR(sysdate,'yyyy-mm-dd')

select orderFinalSalePrice FROM tbl_order WHERE TO_CHAR(orderDate, 'yyyy-mm-dd') = TO_CHAR(sysdate,'yyyy-mm-dd')


select sum(orderFinalSalePrice) from tbl_order where TO_CHAR(orderDate, 'YYYY-MM') = '2022-06' and orderstate ='배송완료'