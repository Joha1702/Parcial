--Parcial final
--Leidy Johana Moreno López

CREATE TABLE MASKS (
masks VARCHAR2(1000),
result VARCHAR2(4000)
);

-- Función --

CREATE OR REPLACE FUNCTION mask_function(mask VARCHAR2)

RETURN VARCHAR2
IS

mask_number VARCHAR2(4000);
temp VARCHAR2(4000);
DECLARE 
Fuera_de_rango EXCEPTION;
BEGIN
    FOR i IN 0..9 LOOP
        temp := REPLACE('mask','*','i');
            IF MOD((TO_NUMBER(temp)),6)= 0 THEN
                mask_number := mask_number||','||temp;
            END IF;
    END LOOP;
return mask_number;
EXCEPTION 
WHEN Fuera_de_rango THEN
    IF(mask <= 0 or mask.length > 10000) THEN
    dbms_output.put_line('El número ingresado debe estar entre 1 y 10000');
    END IF;
WHEN  other THEN
    dbms_output.put_line('Error!');
END mask_function;

-- trigger --

CREATE OR REPLACE TRIGGER mask_result

BEFORE INSERT
ON MASKS
FOR EACH ROW

DECLARE
BEGIN

END;