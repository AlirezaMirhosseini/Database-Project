CREATE TABLE IF NOT EXISTS customer (
	
	CID INTEGER PRIMARY KEY,
	name VARCHAR(50) ,
	natCode CHAR(10) UNIQUE NOT NULL CHECK(CHAR_LENGTH(natCode) = 10),
	birthDate DATE NOT NULL,
	Addr VARCHAR(50) NOT NULL,
	Tel VARCHAR(12) NOT NULL UNIQUE 

);

CREATE OR REPLACE PROCEDURE insert_data_to_customer ()
	LANGUAGE plpgsql
	AS $$
	
	BEGIN
		INSERT INTO customer VALUES (100 , 'Ali' , '1130603456' , '2002-10-09' , 'isfahan' , 09136666666) ,
														(101 , 'Mohammad' , '1130603457' , '2008-10-09' , 'yazd' , 09137777777) ,
														(102 , 'Jamshid' , '1130603458' , '2006-8-09' , 'isfahan dspaas' , 09138888888) ,
														(103 , 'Mahdi' , '1130603459' , '2009-1-06' , 'isfahan dspaas' , 09131111111) ,
														(104 , 'Hamed' , '1130603489' , '1986-4-19' , 'isfahan dspaas' , 09136686963) ,
														(105 , 'Reza' , '1130603490' , '1990-10-09' , 'isfahan dspaas' , 09136666665) ,
														(106 , 'Aref' , '1130603491' , '1999-10-01' , 'isfahan dspaas' , 091366666645) ,
														(107 , 'Pouya' , '1130603492' , '2000-10-08' , 'isfahan dspaas' , 09136666663) ,
														(108 , 'Mostafa' , '1130603460' , '2012-10-20' , 'isfahan dspaas' , 0913666643) ,
														(109 , 'Nader' , '1130603461' , '1987-10-29' , 'isfahan dspaas' , 09136669996) ,
														(110 , 'Neda' , '1130603462' , '1970-10-30' , 'isfahan dspaas' , 091366669000) ,
														(111 , 'Zahra' , '1130603463' , '1980-10-13' , 'isfahan dspaas' , 091366668732) ,
														(112 , 'Motahare' , '1130603464' , '2007-10-25' , 'isfahan dspaas' , 09136666987);
	END; $$;
	
	-- **********************************************************************************************************************************

CALL insert_data_to_customer();

-- DELETE from customer
-- 
SELECT * from customer