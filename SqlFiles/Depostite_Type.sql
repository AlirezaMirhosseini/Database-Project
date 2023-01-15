CREATE TABLE IF NOT EXISTS Deposit_Type (

	Dep_Type INTEGER PRIMARY KEY ,
	Dep_Type_Desc VARCHAR(50)
	
);

CREATE OR REPLACE PROCEDURE insert_data_to_deptype ()
	LANGUAGE plpgsql
	AS $$
	BEGIN
	
			INSERT INTO deposit_type VALUES (300 , 'Current Deposite') , -- سپرده جاری
																			(301 , 'Saving Deposite') , -- سپرده پس انداز
																			(302 , 'Short Term Deposite') , -- سپرده کوتاه مدت
																			(303 , 'Long Term Deposite'); -- سپرده بلند مدت
			
	END; $$;
	
	-- ********************************

call insert_data_to_deptype();


SELECT * FROM deposit_type