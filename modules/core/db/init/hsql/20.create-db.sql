-- begin CELDI_ORDER
alter table CELDI_ORDER add constraint FK_CELDI_ORDER_ON_CUSTOMER foreign key (CUSTOMER_ID) references CELDI_CUSTOMER(ID)^
create index IDX_CELDI_ORDER_ON_CUSTOMER on CELDI_ORDER (CUSTOMER_ID)^
-- end CELDI_ORDER
