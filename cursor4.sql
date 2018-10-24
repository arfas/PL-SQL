create or replace procedure procWithRecord is

type cust_record is record (ID client.ID%type,firstname client.firstname%type,lastname client.lastname%type);
type acc_record is record (ID account.ID%type,balance account.balance%type,accounttype account.accounttype%type);
type cust_acct_record is record(client cust_record,account acc_record);
cust_acct_record1 cust_acct_record;
cust_acct_record2 cust_acct_record;
cust_acct_record3 cust_acct_record;
begin
cust_acct_record1.account.ID:=16603;
cust_acct_record1.account.balance:=30000;
cust_acct_record2.account.ID:=16604;
cust_acct_record2.account.balance:=40000;
cust_acct_record3.account.ID:=16605;
cust_acct_record3.account.balance:=50000;

update account
set balance=cust_acct_record1.account.balance where ID=16603;
update account
set balance=cust_acct_record2.account.balance where ID=16604;
update account
set balance=cust_acct_record3.account.balance where ID=16605;
end;
execute procWithRecord;
select * from account;
