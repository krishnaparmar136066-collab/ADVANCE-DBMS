--cursor for loop
set serveroutput on
declare
	i number;
begin
	for i IN (select  id,name,price from  producat)
loop
dbms_output.put_line('product id:'||i.id||'product name:'||i.name||'price:'||i.price);
end loop;
end;
/