set SERVEROUTPUT ON


create or replace procedure procBalanceSelect as
cv SYS_REFCURSOR;
v_fname client.firstname%type;
v_lname client.lastname%type;
      
BEGIN
open cv for
SELECT firstname,lastname FROM client,account where client.id=account.id and account.balance>4000;
LOOP
   FETCH cv INTO v_fname, v_lname; 
    EXIT WHEN cv%notfound;
      dbms_output.put_line(v_fname || ' ' || v_lname);
      
   END LOOP;
   close cv;
END;
execute procBalanceSelect;
create or replace procedure procAcceptCurAsArg is
v_fname varchar2(50);
v_lname varchar2(50);
v_balance number;
cursor cv is
select firstname,lastname,balance FROM client,account where client.id=account.id ;
begin
open cv;
LOOP
   FETCH cv INTO v_fname, v_lname,v_balance; 
    EXIT WHEN cv%notfound;
      dbms_output.put_line(v_fname || ' ' || v_lname|| ' ' || v_balance);
      
   END LOOP;
   close cv;
end;
execute procAcceptCurAsArg;

 
