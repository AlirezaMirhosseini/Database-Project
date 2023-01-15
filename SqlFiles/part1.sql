CREATE OR REPLACE PROCEDURE checkNatCode (IN _natCode_ VARCHAR(10) , OUT _result_ INTEGER)
	LANGUAGE plpgsql
	AS $$
	
		DECLARE _sum INTEGER := 0;
	
	BEGIN
								

										
					FOR i IN 1..LENGTH(_natCode_) LOOP
							_sum = _sum + SUBSTR(_natCode_, i , 1)::DECIMAL * (LENGTH(_natCode_) - i + 1);
							
							raise notice 'sum: % ', _sum;
							raise notice 'i: % ', i;

							IF i = LENGTH(_natCode_) - 1 THEN
								EXIT;
							ELSE 
								i = i + 1; 
							END IF;
							
				END LOOP;

				IF (_sum % 11 < 2 AND SUBSTR(_natCode_, LENGTH(_natCode_) , 1)::INTEGER  = (_sum % 11)) OR
					 (_sum % 11 >= 2 AND SUBSTR(_natCode_, LENGTH(_natCode_) , 1)::INTEGER = 11 - (_sum % 11)) THEN
								raise notice 'thats ok ... ';
								_result_ = 1;
				ELSE 
								raise notice 'not ok ... %' , SUBSTR(_natCode_, LENGTH(_natCode_) , 1);
								_result_ = 0;
				END IF;
				raise notice 'Value: % ', _sum;
				RETURN;
-- 
																 
	END; $$;
	
	-- ********************************


CREATE OR REPLACE VIEW customer_check_natCode AS (

	SELECT "name" , natcode ,
		
		CASE 
			
				
	
	FROM customer

	
);





-- DO $$
-- 	
-- DECLARE _sum INTEGER := 0;
-- 	
-- 	BEGIN
-- 	
-- 	FOR i IN 1..LENGTH('1130602257') LOOP
-- 			_sum = _sum + SUBSTR('1130602257', i , 1)::DECIMAL * (LENGTH('1130602257') - i + 1);
-- 			
-- 			raise notice 'sum: % ', _sum;
-- 			raise notice 'i: % ', i;
-- 
-- 			IF i = LENGTH('1130602257') - 1 THEN
-- 				EXIT;
-- 			ELSE 
-- 				i = i + 1; 
-- 			END IF;
-- 			
-- END LOOP;
-- 
-- IF (_sum % 11 < 2 AND SUBSTR('1130602257', LENGTH('1130602257') , 1)::INTEGER  = (_sum % 11)) OR
-- 	 (_sum % 11 >= 2 AND SUBSTR('1130602257', LENGTH('1130602257') , 1)::INTEGER = 11 - (_sum % 11)) THEN
-- 				raise notice 'thats ok ... ';
-- ELSE 
-- 				raise notice 'not ok ... %' , SUBSTR('1130602257', LENGTH('1130602257') , 1);
-- END IF;
-- raise notice 'Value: % ', _sum;
-- 
-- 
-- END; $$
