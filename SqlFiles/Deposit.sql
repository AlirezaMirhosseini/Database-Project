CREATE TABLE IF NOT EXISTS Deposit (
	
	Dep_ID INTEGER PRIMARY KEY,
	Dep_Type INTEGER,
	CID INTEGER ,
	OpenDate Date ,
	Status INTEGER ,
	
	FOREIGN KEY (Dep_Type)
			REFERENCES deposit_type (Dep_Type) ,
	FOREIGN KEY (CID)
			REFERENCES customer (CID) ,
	FOREIGN KEY (Status)
			REFERENCES deposit_status (Status)
);


CREATE OR REPLACE PROCEDURE insert_data_to_deposit ()
	LANGUAGE plpgsql
	AS $$
	BEGIN
	
			INSERT INTO deposit VALUES (500 , 301 , 101 , '2023-01-28' , 400) ,
																 (501 , 300 , 101 , '2022-11-24' , 401) ,
																 (502 , 302 , 101 , '2019-02-03' , 400) ,
																 (503 , 303 , 102 , '2002-05-02' , 401) ,
																 (504 , 301 , 103 , '1990-06-05' , 401) ,
																 (505 , 301 , 104 , '1986-10-01' , 401) ,
																 (506 , 302 , 105 , '2021-09-11' , 401) ,
																 (507 , 303 , 106 , '2020-07-01' , 400) ,
																 (508 , 300 , 107 , '2017-11-21' , 400) ,
																 (509 , 302 , 107 , '2015-12-01' , 400) ,
																 (510 , 303 , 109 , '2019-03-29' , 401) ,
																 (511 , 303 , 109 , '2013-02-01' , 401) ,
																 (512 , 302 , 109 , '2006-06-02' , 400) ,
																 (513 , 302 , 109 , '2025-08-03' , 401) ,
																 (514 , 301 , 110 , '1980-11-07' , 400) ,
																 (515 , 303 , 110 , '1978-01-19' , 401) ,
																 (516 , 302 , 111 , '1999-02-01' , 400) ,
																 (517 , 302 , 107 , '1998-04-17' , 401) ,
																 (518 , 301 , 111 , '2000-07-15' , 400) ,
																 (519 , 303 , 112 , '2009-11-14' , 401);
	END; $$;
	
	-- ********************************

call insert_data_to_deposit();



-- DROP TABLE deposit

-- DELETE from deposit;
SELECT * from deposit;