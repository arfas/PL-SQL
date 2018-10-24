set serveroutput on;    --to get an output
DECLARE
a number;               --declaring three variables two for two sides of the triangle and one for the third side of the triangle
b number;
c number;
pythagoran_triple boolean; --this boolean statement checks if the condition is true or false               
PROCEDURE procPythagoras(x in out number,y in out number,z in out number,pythagoran_triple IN OUT boolean) --a procedure is defined called procPythagoras as instructed
is
begin
if (x**2+y**2)=z**2 or (x**2+z**2)=y**2 or (y**2+x**2)=z**2 or(y**2+z**2)=x**2 or(z**2+x**2)=y**2 then --if condition to check two sides are equal to the third side
pythagoran_triple:=true;
else
pythagoran_triple:=false;
end if;
end;
begin
a:=3;        --variables declaration
b:=5;
c:=4;
procPythagoras(a,b,c,pythagoran_triple);    --calling function procPythagoras
dbms_output.put_line('pythagoran triple:'||case when pythagoran_triple = true 
                           then 'true'
                           else 'false'
                        end );  --output using case arguments where the pythagoran_triple is checked using case condition if the boolean is true the output is true or its false
end;





