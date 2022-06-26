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
    orderDate DATE DEFAULT SYSDATE,
    CONSTRAINT pk_order_orderId PRIMARY KEY(orderId),
    CONSTRAINT fk_order_mid FOREIGN KEY (mid) REFERENCES tbl_member(mid)
);

create table tbl_orderItem(
    oid NUMBER,
    orderId varchar2(50),
    iId NUMBER,
   	itemCount NUMBER not null,
    itemPrice NUMBER not null,
    itemDiscount NUMBER not null,
    savePoint NUMBER not null,
    CONSTRAINT pk_orderItem_oid PRIMARY KEY(oid),
    CONSTRAINT fk_orderItem_orderId FOREIGN KEY (orderId) REFERENCES tbl_order(orderId),
    CONSTRAINT fk_orderItem_iId FOREIGN KEY (iId) REFERENCES tbl_item(iId)
);

create sequence seq_orderItem_oid

SELECT * FROM tabs



select * from tbl_orderItem

select * from tbl_order

drop table tbl_order
drop table tbl_orderItem

