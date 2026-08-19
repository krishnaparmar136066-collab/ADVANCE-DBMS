DECLARE
   v_num NUMBER := 10;
   v_zero NUMBER := 0;
   v_result NUMBER;
BEGIN
   -- Division by zero triggers ORA-01476
   v_result := v_num / v_zero;
   
   DBMS_OUTPUT.PUT_LINE('Result: ' || v_result);

EXCEPTION
   WHEN ZERO_DIVIDE THEN
      DBMS_OUTPUT.PUT_LINE('Error: Cannot divide by zero!');
END;
/