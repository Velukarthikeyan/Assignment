


--C:\Program Files (x86)\pgAdmin III\1.22>psql -h 192.168.1.89 -U odoo avitech_accounts

--delete from avitech_data;

--\copy avitech_data from 'C:/data_migration_velu/BP2010.csv' delimiter ',' csv 
/*
delete from account_move_line;
delete from account_invoice;
delete from account_move;
delete from avitech_data;

*/
--
delete  from avitech_data where document_no is null;
delete from avitech_data where series='Series';
update  avitech_data set cumulative_fc=0 where cumulative_fc='****';
--run only for GL CSV
insert into account_move(journal_id,period_id,state,date,name,ref)
(select distinct 7,(select id from account_period where date_start <=to_date(a.posting_date, 'DD Mon YY') and date_stop>=to_date(a.posting_date, 'DD Mon YY') and name not like 'Opening%'),'posted',to_date(posting_date, 'DD Mon YY'),a.document_no,a.transaction_number from avitech_data a);





--GL
insert into account_move_line(state,journal_id,account_id,period_id,date,move_id,name,credit,debit,amount_currency,currency_id) 
(select 'valid', 7,(select id from account_account where code=a.gl_acctbp_code ),(select id from account_period where date_start <=to_date(a.posting_date, 'DD Mon YY') and date_stop>=to_date(a.posting_date, 'DD Mon YY')and name not like 'Opening%')
,to_date(a.posting_date, 'DD Mon YY'),(select b.id  as move_id from account_move b where b.name=a.document_no 
and b.date=to_date(a.posting_date, 'DD Mon YY') and b.ref=a.transaction_number),document_no,credit_lc::numeric,0.0,cast(a.debit_credit_fc as numeric),(select id from res_currency where name=a.cumulative_fc_currency)  from avitech_data a
join account_account b on b.code=a.gl_acctbp_code and a.credit_lc is not null ) ;


insert into account_move_line(state,journal_id,account_id,period_id,date,move_id,name,debit,credit,amount_currency,currency_id) 
(select 'valid',7,(select id from account_account where code=a.gl_acctbp_code ),(select id from account_period where date_start <=to_date(a.posting_date, 'DD Mon YY') and date_stop>=to_date(a.posting_date, 'DD Mon YY') and name not like 'Opening%')
,to_date(a.posting_date, 'DD Mon YY'),(select b.id  as move_id from account_move b where b.name=a.document_no 
and b.date=to_date(a.posting_date, 'DD Mon YY') and b.ref=a.transaction_number),document_no,debit_lc::numeric,0.0,cast(a.debit_credit_fc as numeric),(select id from res_currency where name=a.cumulative_fc_currency)  from avitech_data a
join account_account b on b.code=a.gl_acctbp_code and a.debit_lc is not null) ;

--BP
delete  from avitech_data where document_no is null;
delete from avitech_data where series='Series';
update  avitech_data set cumulative_fc=0 where cumulative_fc='****';

insert into account_move_line(state,journal_id,account_id,period_id,date,move_id,name,credit,debit,amount_currency,currency_id,partner_id) 
(select 'valid',7,(select id from account_account where code=a.control_account ),(select id from account_period where date_start <=to_date(a.posting_date, 'DD Mon YY') and date_stop>=to_date(a.posting_date, 'DD Mon YY') and name not like 'Opening%')
,to_date(a.posting_date, 'DD Mon YY'),(select b.id  as move_id from account_move b where b.name=a.document_no 
and b.date=to_date(a.posting_date, 'DD Mon YY') and b.ref=a.transaction_number),document_no,credit_lc::numeric,0.0,cast(a.debit_credit_fc as numeric),(select id from res_currency where name=a.cumulative_fc_currency ),(select id from res_partner where vendor_code=a.gl_acctbp_code limit 1)  from avitech_data a
join account_account b on b.code=a.control_account and a.credit_lc is not null ) ;



 insert into account_move_line(state,journal_id,account_id,period_id,date,move_id,name,debit,credit,amount_currency,currency_id,partner_id) 
(select 'valid',7,(select id from account_account where code=a.control_account ),(select id from account_period where date_start <=to_date(a.posting_date, 'DD Mon YY') and date_stop>=to_date(a.posting_date, 'DD Mon YY') and name not like 'Opening%')
,to_date(a.posting_date, 'DD Mon YY'),(select b.id  as move_id from account_move b where b.name=a.document_no 
and b.date=to_date(a.posting_date, 'DD Mon YY') and b.ref=a.transaction_number),document_no,debit_lc::numeric,0.0,cast(a.debit_credit_fc as numeric),(select id from res_currency where name=a.cumulative_fc_currency),(select id from res_partner where vendor_code=a.gl_acctbp_code limit 1)  from avitech_data a
join account_account b on b.code=a.control_account and a.debit_lc is not null) ;
;



--ALTER TABLE account_move_line DROP CONSTRAINT account_move_line_credit_debit2;

--select * from account_period where code like '%2010%' order by id;

--delete from account_move where period_id in  (152,153,154,155,156,157,158,159,160,161,162,163,164);

