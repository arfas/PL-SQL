declare
      type year_type is table of number index by binary_integer;
      year_profits      year_type;
      tot_profits number := 0;
      i           number;
begin
      year_profits(1990) := 34000;
      year_profits(1991) := -45000;
      year_profits(1992) := 43000;
      year_profits(1996) := -13000;
      year_profits(1998) := 53000;

      i := year_profits.first;
      while i <= year_profits.last
      loop
            if year_profits(i) < 0 then
                  year_profits.delete(i);
            end if;
            i := year_profits.next(i);
      end loop;

      i := year_profits.first;
      while i <= year_profits.last
      loop
            tot_profits := tot_profits + year_profits(i);
            i := year_profits.next(i);
      end loop;
      dbms_output.put_line('Total profits: ' || tot_profits);
      dbms_output.put_line('No. of years in profit: ' ||year_profits.count);

end;