-- ***************************************** Customers **************************************************

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
	

CALL insert_data_to_customer();

-- ***************************************** Deposit Status **************************************************

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

-- ***************************************** Deposit Type **************************************************

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


-- ***************************************** Deposit **************************************************


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
	
call insert_data_to_deposit();

-- ***************************************** Branch ****************************************************

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
																	
-- 	
	END; $$;
	
	-- ********************************

call insert_data_to_branch();

-- ***************************************** Transactions ****************************************************

CREATE TABLE IF NOT EXISTS Transact (
	
	VoucherId VARCHAR(10) PRIMARY KEY,
	TrnDate DATE ,
	TrnTime VARCHAR(15) ,
	Amount BIGINT ,
	SourceDep INTEGER ,
	DesDep INTEGER ,
	Branch_ID INTEGER ,
	Trn_Desc VARCHAR(100) ,
	
	FOREIGN KEY (SourceDep)
			REFERENCES deposit (Dep_ID) ,
	FOREIGN KEY (DesDep)
			REFERENCES deposit (Dep_ID) ,
	FOREIGN KEY (Branch_ID)
			REFERENCES branch (Branch_ID)
);

CREATE OR REPLACE PROCEDURE insert_data_to_transact ()
	LANGUAGE plpgsql
	AS $$
	BEGIN
	
			INSERT INTO transact VALUES (600 , '2022-01-28' , '09:12:00' , 90000 , 500 , 501 , 200 , '9000 toman rikhte shod be hesabe felani ... ') ,
																 (601 , '2021-01-28' , '01:13:00' , 10000 , 500 , 502 , 201 , '1000 toman rikhte shod be hesabe felani ... ') ,
																 (602 , '2020-01-28' , '02:12:00' , 1870000 , 500 , 510 , 206 , 'jj toman rikhte shod be hesabe felani ... ') ,
																 (603 , '2022-01-28' , '09:14:00' , 1770000 , 501 , 502 , 208 , 'kk toman rikhte shod be hesabe felani ... ') ,
																 (604 , '2022-01-28' , '06:17:00' , 5670000 , 501 , 509 , 207 , 'gg toman rikhte shod be hesabe felani ... ') ,
																 (605 , '2019-01-28' , '08:18:00' , 3450600 , 501 , 512 , 201 , 'hh toman rikhte shod be hesabe felani ... ') ,
																 (606 , '2018-01-28' , '09:19:00' , 340000000 , 502 , 508 , 202 , 'jj toman rikhte shod be hesabe felani ... ') ,
																 (607 , '2017-01-28' , '13:34:00' , 120000000 , 502 , 507 , 203 , 'll toman rikhte shod be hesabe felani ... ') ,
																 (608 , '2009-01-28' , '23:23:00' , 1000000000 , 503 , 506 , 205 , 'dd toman rikhte shod be hesabe felani ... ') ,
																 (609 , '2022-01-28' , '22:25:00' , 4560000 , 504 , 501 , 200 , 'cc toman rikhte shod be hesabe felani ... ') ,
																 (610 , '2022-01-28' , '20:28:00' , 3400500 , 505 , 503 , 207 , 'aa toman rikhte shod be hesabe felani ... ') ,
																 (611 , '2021-01-28' , '09:10:00' , 89000000 , 507 , 504 , 206 , 'vv toman rikhte shod be hesabe felani ... ') ,
																 (612 , '2020-01-28' , '18:01:00' , 10000 , 508 , 505 , 205 , 'bb toman rikhte shod be hesabe felani ... ') ,
																 (613 , '2022-01-28' , '09:00:00' , 20000 , 509 , 508 , 201 , 'nn toman rikhte shod be hesabe felani ... ') ,
																 (614 , '2022-01-28' , '14:02:00' , 9180000 , 511 , 512 , 203 , 'mm toman rikhte shod be hesabe felani ... ') ,
																 (615 , '2019-01-28' , '09:02:19' , 120000 , 512 , 519 , 208 , 'oo toman rikhte shod be hesabe felani ... ') ,
																 (616 , '2018-01-28' , '15:22:00' , 540900 , 515 , 518 , 207 , 'zz toman rikhte shod be hesabe felani ... ') ,
																 (617 , '2016-01-28' , '09:55:00' , 90000 , 517 , 514 , 206 , 'uu toman rikhte shod be hesabe felani ... ') ,
																 (618 , '2015-01-28' , '09:57:00' , 1320000 , 518 , 517 , 204 , 'rr toman rikhte shod be hesabe felani ... ') ,
																 (619 , '2013-01-28' , '13:45:00' , 12345678 , 519 , 513 , 203 , 'ee toman rikhte shod be hesabe felani ... ');
																 
	END; $$;
	
	-- ********************************

call insert_data_to_transact();


SELECT * from transact;



INSERT INTO transact VALUES (620 , '2022-02-20' , '09:12:00' , 90000 , 519 , 501 , 207 , '9000 toman rikhte shod be hesabe felani ... ') ,
														(621 , '2021-11-28' , '01:13:00' , 10000 , 518 , 502 , 205 , '1000 toman rikhte shod be hesabe felani ... ') ,
														(622 , '2020-07-14' , '02:12:00' , 1870000 , 516 , 510 , 201 , 'jj toman rikhte shod be hesabe felani ... ') ,
														(623 , '2022-12-10' , '09:14:00' , 1770000 , 510 , 502 , 203 , 'kk toman rikhte shod be hesabe felani ... ') ,
														(624 , '2022-09-09' , '06:17:00' , 5670000 , 504 , 509 , 207 , 'gg toman rikhte shod be hesabe felani ... ') ,
														(625 , '2019-06-08' , '08:18:00' , 3450600 , 505 , 512 , 204 , 'hh toman rikhte shod be hesabe felani ... ') ,
														(626 , '2018-04-17' , '09:19:00' , 340000000 , 503 , 508 , 202 , 'jj toman rikhte shod be hesabe felani ... ') ,
														(627 , '2017-02-16' , '13:34:00' , 120000000 , 502 , 504 , 203 , 'll toman rikhte shod be hesabe felani ... ') ,
														(628 , '2009-10-12' , '23:23:00' , 1000000000 , 501 , 503 , 205 , 'dd toman rikhte shod be hesabe felani ... ') ,
														(629 , '2022-11-13' , '22:25:00' , 4560000 , 512 , 501 , 200 , 'cc toman rikhte shod be hesabe felani ... ') ,
														(630 , '2022-03-29' , '20:28:00' , 3400500 , 514 , 513 , 207 , 'aa toman rikhte shod be hesabe felani ... ') ,
														(631 , '2021-01-28' , '09:10:00' , 89000000 , 507 , 509 , 206 , 'vv toman rikhte shod be hesabe felani ... ') ,
														(632 , '2020-05-30' , '18:01:00' , 10000 , 503 , 509 , 205 , 'bb toman rikhte shod be hesabe felani ... ') ,
														(633 , '2022-07-03' , '09:00:00' , 20000 , 505 , 500 , 201 , 'nn toman rikhte shod be hesabe felani ... ') ,
														(634 , '2022-10-05' , '14:02:00' , 9180000 , 512 , 511 , 203 , 'mm toman rikhte shod be hesabe felani ... ') ,
														(635 , '2019-01-17' , '09:02:19' , 120000 , 516 , 518 , 208 , 'oo toman rikhte shod be hesabe felani ... ') ,
														(636 , '2018-08-23' , '15:22:00' , 540900 , 517 , 516 , 207 , 'zz toman rikhte shod be hesabe felani ... ') ,
														(637 , '2016-03-25' , '09:55:00' , 90000 , 500 , 514 , 206 , 'uu toman rikhte shod be hesabe felani ... ') ,
														(638 , '2015-02-28' , '09:57:00' , 1320000 , 507 , 514, 204 , 'rr toman rikhte shod be hesabe felani ... ') ,
														(639 , '2013-08-08' , '13:45:00' , 12345678 , 506 , 511 , 203 , 'ee toman rikhte shod be hesabe felani ... ');



-- ***************************************** Insert Transaction **************************************************

INSERT INTO transact VALUES 
							(640 , '2022-04-20' , '09:12:00' , 4000 , 503 , 510 , 207 , '9000  transfered') ,
							(641 , '2022-04-28' , '09:12:00' , 100 , 503 , 512 , 207 , '9000  transfered') ,
							(642 , '2022-05-10' , '09:12:00' , 5700 , 503 , 515 , 207 , '9000  transfered') ,
							(643 , '2022-06-20' , '09:12:00' , 2800 , 503 , 505 , 207 , '9000  transfered') ,
							(644 , '2022-11-19' , '09:12:00' , 10000 , 503 , 508 , 207 , '9000  shapour level');
							


-- ***************************************** Update Transaction **************************************************

UPDATE transact SET trn_desc = amount || ' transferred from ' || sourcedep || ' to ' || desdep;

UPDATE transact SET amount = amount / 1000 WHERE amount > 1000000;

UPDATE transact SET amount = amount / 100 WHERE amount > 9999;



-- ***************************************** Question 1 **************************************************


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



-- ***************************************** Question 2 **************************************************

-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Track Previous Transactions $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


CREATE OR REPLACE FUNCTION trackPreviousTransactions (
	
	_SrcDep_ INTEGER ,
	_DesDep_ INTEGER ,
	_Amount_ BIGINT ,
	_TrnDate_ Date ,
	_TrnTime_ VARCHAR(15)	,
	i BIGINT ,
	_sum_ BIGINT
)
	RETURNS TABLE (VoucherId VARCHAR(10) , TrnDate DATE , TrnTime VARCHAR(15) , Amount BIGINT , 
						SourceDep INTEGER , DesDep INTEGER , Branch_ID INTEGER , Trn_Desc VARCHAR(100))
	LANGUAGE plpgsql

	AS $$

	DECLARE temprow RECORD = NULL;


	BEGIN FOR temprow IN
			SELECT * FROM transact
				WHERE transact.desdep = _SrcDep_ AND (transact.trndate < _TrnDate_ OR 
													(transact.trndate = _TrnDate_ AND transact.trntime < _TrnTime_)) 
													ORDER BY (transact.trndate, transact.trntime) ASC
			LOOP
					raise notice 'sum before % ', _sum_;
					_sum_ = _sum_ + temprow.amount;
					raise notice 'transact % from % to % => sum : % , amount : % ', temprow.amount, _SrcDep_, _DesDep_, _sum_, _Amount_;

					IF _sum_ <= (_Amount_ * 1.1) 
						AND EXISTS (SELECT * FROM deposit WHERE deposit.dep_id = temprow.sourcedep) 
						AND EXISTS (SELECT * FROM deposit WHERE deposit.dep_id = temprow.desdep) THEN	
							
						i = i + 1;

						RETURN QUERY  
						SELECT * FROM trackPreviousTransactions(temprow.sourcedep , temprow.desdep , temprow.amount , temprow.trndate , temprow.trntime , 0 , 0);
					END IF;
			END LOOP;
			RETURN QUERY 
			(
				(
				 SELECT * FROM transact t
					WHERE t.desdep = _SrcDep_ AND  t.trndate =  (
																	SELECT min(t2.trndate) FROM transact t2 
																	WHERE t2.desdep = _SrcDep_ AND 
																		t2.trndate < _TrnDate_ 
																		OR
																		(t2.trndate = _TrnDate_ AND t2.trntime < _TrnTime_)
																)
				)
				UNION
				(SELECT * FROM transact
					WHERE transact.desdep = _SrcDep_ AND (transact.trndate < _TrnDate_ OR (transact.trndate = _TrnDate_ AND transact.trntime < _TrnTime_)) 				ORDER BY (transact.trndate, transact.trntime) ASC LIMIT i)
			);

END $$;


SELECT * FROM trackPreviousTransactions(508 , 505 , 100000 , '2020-03-25' , '09:00:00' , 0 , 0);



-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Track Subsequent Transactions $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$



CREATE OR REPLACE FUNCTION trackSubsequentTransactions (
	
	_SrcDep_ INTEGER ,
	_DesDep_ INTEGER ,
	_Amount_ BIGINT ,
	_TrnDate_ Date ,
	_TrnTime_ VARCHAR(15)	,
	i BIGINT ,
	_sum_ BIGINT
)
	RETURNS TABLE (VoucherId VARCHAR(10) , TrnDate DATE , TrnTime VARCHAR(15) , Amount BIGINT , 
						SourceDep INTEGER , DesDep INTEGER , Branch_ID INTEGER , Trn_Desc VARCHAR(100))
	LANGUAGE plpgsql

	AS $$

	DECLARE temprow RECORD = NULL;


	BEGIN FOR temprow IN
		SELECT * FROM transact
			WHERE transact.sourcedep = _DesDep_ AND (transact.trndate > _TrnDate_ OR 
																(transact.trndate = _TrnDate_ AND transact.trntime > _TrnTime_)) 
																ORDER BY (transact.trndate, transact.trntime) ASC
		LOOP
				raise notice 'sum before % ', _sum_;
				_sum_ = _sum_ + temprow.amount;
				raise notice 'transact % from % to % => sum : % , amount : % ', temprow.amount, _SrcDep_, _DesDep_, _sum_, _Amount_;

				IF _sum_ <= (_Amount_ * 1.1) 
					AND EXISTS (SELECT * FROM deposit WHERE deposit.dep_id = temprow.sourcedep) 
					AND EXISTS (SELECT * FROM deposit WHERE deposit.dep_id = temprow.desdep) THEN	
						
					i = i + 1;

					RETURN QUERY  
					SELECT * FROM trackSubsequentTransactions(temprow.sourcedep , temprow.desdep , temprow.amount , temprow.trndate , temprow.trntime , 0 , 0);
					
				END IF;
	 END LOOP;
		RETURN QUERY 
		(
			(
			 SELECT * FROM transact t
				WHERE t.sourcedep = _DesDep_ AND  t.trndate =  (
																	SELECT min(t2.trndate) FROM transact t2 
																	WHERE t2.sourcedep = _DesDep_ AND 
																		t2.trndate > _TrnDate_ 
																		OR
																		(t2.trndate = _TrnDate_ AND t2.trntime > _TrnTime_)
																)
			)
			UNION
			(SELECT * FROM transact
				WHERE transact.sourcedep = _DesDep_ AND (transact.trndate > _TrnDate_ OR (transact.trndate = _TrnDate_ AND transact.trntime > _TrnTime_)) 				ORDER BY (transact.trndate, transact.trntime) ASC LIMIT i)
		);

END $$;



SELECT * FROM trackSubsequentTransactions(500 , 501 , 100000 , '2020-03-25' , '09:00:00' , 0 , 0);


-- SELECT min(t2.trndate) FROM 
-- transact t2 WHERE t2.sourcedep = 505 AND t2.trndate > '2000-03-25' OR 
-- (t2.trndate = '2000-03-25' AND t2.trntime > '09:00:00')

-- SELECT * from transact WHERE sourcedep = 501



-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ Union of that Functions $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$


CREATE OR REPLACE FUNCTION TrackRelatedTransactions (
	_SrcDep_ INTEGER ,
	_DesDep_ INTEGER ,
	_Amount_ BIGINT ,
	_TrnDate_ Date ,
	_TrnTime_ VARCHAR(15)
)
	RETURNS TABLE (VoucherId VARCHAR(10) , TrnDate DATE , TrnTime VARCHAR(15) , Amount BIGINT , 
						SourceDep INTEGER , DesDep INTEGER , Branch_ID INTEGER , Trn_Desc VARCHAR(100))
	LANGUAGE plpgsql

	AS $$
	
	BEGIN
	
		RETURN QUERY 
		(
			SELECT * FROM trackSubsequentTransactions(_SrcDep_ , _DesDep_ , _Amount_ , _TrnDate_ , _TrnTime_ , 0 , 0) 
				UNION
			SELECT * FROM trackPreviousTransactions(_SrcDep_ , _DesDep_ , _Amount_ , _TrnDate_ , _TrnTime_ , 0 , 0) 
		);

END $$;

SELECT * FROM TrackRelatedTransactions(510 , 504 , 1000 , '2020-03-25' , '09:00:00');