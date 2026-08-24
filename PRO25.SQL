DECLARE
    -- Variable to store the department number to filter by
    v_deptno      EMP.DEPTNO%TYPE := &Enter_Dept_No;
    
    -- Counter to keep track of processed rows
    v_count       NUMBER := 0;
    
    -- Explicit cursor to select records for the given department
    CURSOR emp_cursor IS
        SELECT EMP_ID, EMPNM, DEPTNO, SALARY
        FROM EMP
        WHERE DEPTNO = v_deptno;
        
    -- User-defined exception declaration
    NO_DEPT_FOUND EXCEPTION;

BEGIN
    -- Fetch and process records using a Cursor FOR Loop
    FOR emp_rec IN emp_cursor LOOP
        INSERT INTO EMP_BACKUP (EMP_ID, EMPNM, DEPTNO, SALARY)
        VALUES (emp_rec.EMP_ID, emp_rec.EMPNM, emp_rec.DEPTNO, emp_rec.SALARY);
        
        v_count := v_count + 1;
    END LOOP;

    -- Raise exception if no rows were found/inserted
    IF v_count = 0 THEN
        RAISE NO_DEPT_FOUND;
    ELSE
        DBMS_OUTPUT.PUT_LINE(v_count || ' record(s) successfully backed up for Department: ' || v_deptno);
        COMMIT;
    END IF;

EXCEPTION
    WHEN NO_DEPT_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: No records found for Department Number ' || v_deptno);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/