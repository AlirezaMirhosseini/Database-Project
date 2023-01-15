CREATE TABLE IF NOT EXISTS Branch (

	Branch_ID INTEGER PRIMARY KEY ,
	Branch_Name VARCHAR(50) ,
	Branch_Addr VARCHAR(50) ,
	Branch_Tel VARCHAR(50)
	
);

CREATE OR REPLACE PROCEDURE insert_data_to_branch ()
	LANGUAGE plpgsql
	AS $$
	BEGIN
-- 			SELECT * FROM branch;
		INSERT INTO branch VALUES (200 , 'Azadi' , 'KhomeiniShahr' , '03133655577');
		INSERT INTO branch VALUES (201 , 'Shahidan' , 'Isfahan' , '03133655577');
		INSERT INTO branch VALUES (202 , 'Bozorgmehr' , 'Isfahan' , '03133655577');
		INSERT INTO branch VALUES (203 , 'Argentina Square' , 'Tehran' , '03133655577');
		INSERT INTO branch VALUES (204 , 'ValiAsr' , 'Rasht' , '03133655577');
		INSERT INTO branch VALUES (205 , 'Esteghlal' , 'Gorgan' , '03133655577');
		INSERT INTO branch VALUES (206 , 'Mobarake' , 'Mobarake' , '03133655577');
		INSERT INTO branch VALUES (207 , 'Sharif' , 'Tehran' , '03133655577');
		INSERT INTO branch VALUES (208 , 'Isfahan University of Technology' , 'KhomeiniShahr' , '03133655577');
																	
		COMMIT;
-- 	
	END; $$;
	
	-- ********************************

call insert_data_to_branch();


-- DELETE from branch
-- 
SELECT * from branch;