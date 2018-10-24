set serveroutput on;

   
create or replace procedure procExplicitCursorAccountSelec is
CURSOR a_account is


      SELECT * FROM account;
BEGIN

   FOR v_account in a_account LOOP
    EXIT WHEN a_account%notfound;
      dbms_output.put_line(v_account.id || ' ' || v_account.accounttype || ' ' || v_account.balance);
      
   END LOOP;
   close a_account;
END;
/
call procExplicitCursorAccountSelec();


