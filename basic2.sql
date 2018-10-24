set serveroutput on;    --to get an output
DECLARE
a integer;              --declaring a variable a
i integer:=2;           --initializing a variable i=2
Composite_Number boolean; --boolean condition to check if the statement is true or false
PROCEDURE procCompositeNumber(x in out integer,Composite_Number IN OUT boolean) --declaring procedure procCompositeNumber
is
begin
if mod(a,i)=0  then                  --using if statement checking if mod a,i=0
Composite_Number:=false;             
else if a<0 then                     --if a negetive number is passed the output is false
Composite_Number:=null;
else
Composite_Number:=true;

end if;
end if;
end;
begin
a:=4;                                --variable declaration

procCompositeNumber(a,Composite_Number);--calling the function procCompositeNumber
dbms_output.put_line('prime:'||case when Composite_Number = true 
                           then 'true' when Composite_Number=null then 'prime'
                           else 'false'
                        end );          --output is printed in the following format
                                        --if boolean of composite number is true output is true
                                        --if boolean of composite number is false output is false
                                        --if boolean of composite number is negetive(null) output is false
end;





