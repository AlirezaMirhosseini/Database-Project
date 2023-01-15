CREATE OR REPLACE PROCEDURE checkNatCode ()
	LANGUAGE plpgsql
	AS $$
	
		DECLARE _sum INTEGER := 0;
		DECLARE _result_ INTEGER := 0;
		DECLARE temprow RECORD = NULL;
		

	BEGIN
	
			ALTER TABLE customer ADD COLUMN IF NOT EXISTS natCodeIsValid INTEGER;
			
			
			FOR temprow IN SELECT * FROM customer LOOP
					_sum = 0;
					_result_ = 0;
					FOR i IN 1..LENGTH(temprow.natcode) 
						LOOP
								_sum = _sum + SUBSTR(temprow.natcode, i , 1)::DECIMAL * (LENGTH(temprow.natcode) - i + 1);
								
-- 								raise notice 'sum: % ', _sum;
-- 								raise notice 'i: % ', i;

								IF i = LENGTH(temprow.natcode) - 1 THEN
									EXIT;
								ELSE 
									i = i + 1; 
								END IF;
								
						END LOOP;

				IF (_sum % 11 < 2 AND SUBSTR(temprow.natcode, LENGTH(temprow.natcode) , 1)::INTEGER  = (_sum % 11)) OR
					 (_sum % 11 >= 2 AND SUBSTR(temprow.natcode, LENGTH(temprow.natcode) , 1)::INTEGER = 11 - (_sum % 11)) THEN
								raise notice '% is ok ... ' , temprow.natcode;
								_result_ = 1;
				ELSE 
								raise notice '%d is not ok ...' , temprow.natcode;
								_result_ = 0;
				END IF;
				
				UPDATE customer SET natCodeIsValid = _result_ WHERE customer.CID = temprow.CID;
			END LOOP;	
				
				CREATE OR REPLACE VIEW NationalCodeValidation AS 
				(
					SELECT * FROM customer
				);
				
-- 				raise notice 'Value: % ', _sum;
				RETURN;
-- 
																 
	END $$;
	
	
	call checkNatCode();