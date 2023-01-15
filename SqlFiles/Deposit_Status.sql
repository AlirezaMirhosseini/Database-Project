CREATE TABLE IF NOT EXISTS Deposit_Status (

	Status INTEGER PRIMARY KEY ,
	Status_Desc VARCHAR(50)
	
);

CREATE OR REPLACE PROCEDURE insert_data_to_depstatus ()
	LANGUAGE plpgsql
	AS $$
	BEGIN
	
			INSERT INTO deposit_status VALUES (400 , 'Active') , -- سپرده فعال 
																				(401 , 'Closed'); -- سپرده غیر فعال
	END; $$;
	
	-- ********************************

call insert_data_to_depstatus();


SELECT * FROM deposit_status