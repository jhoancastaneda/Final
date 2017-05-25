create trigger findSum BEFORE INSERT ON findSum FOR EACH ROW
BEGIN
SELECT finfSum_function (:NEW.findSum) into :new.resultado from dual; 
END;

CREATE OR REPLACE FUNCTION findSum (N INT)
RETURN varchar2( 4000)is
resultado  varchar2;
AA_N EXCEPTION;
AA_D EXCEPTION;

BEGIN
  IF N<0 THEN
    RAISE AA_N;
   ELSIF (N<0 or N>99999) THEN 
      RAISE AA_D;
      ELSE    
       FOR i IN 1..N
          LOOP
          if ((i mod 3 = 0) or (i mod 5 = 0) ) then
          resultado:=resultado+i;
           else
            DBMS_OUTPUT.PUT_LINE('no es multiplo de ninguno');
          end if;
       END LOOP;
         DBMS_OUTPUT.PUT_LINE(REGEXP_COUNT(resultado));
  END IF;
 EXCEPTION
 WHEN AA_N THEN
 DBMS_OUTPUT.PUT_LINE('EL VALOR DE N DEBE SER MAYOR O IGUAL A CERO');
 WHEN AA_D THEN
 DBMS_OUTPUT.PUT_LINE('EL VALOR DE D DEBE SER MAYOR O IGUAL A CERO Y MENOR IGUAL A 99999');
END;

EXEC DBMS_OUTPUT.PUT_LINE(findSum(5));

CREATE TABLE SUMS(
base_values varchar2(5), 
result_values varchar2(4000)
)
