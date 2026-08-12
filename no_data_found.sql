--no data found
set serveroutput on
declare
pnm char(15);
p number(8);
proid number:=&proid;

begin
	select name,price INTO pnm,p from producat where id=proid;

	dbms_output.put_line('Product name:'||pnm||'Price:'||p);


EXCEPTION

WHEN NO_DATA_FOUND THEN
dbms_output.put_line('Product id:'||proid||' not available in table');
end;
/