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



-- DROP TABLE transact

-- DELETE from transact;
SELECT * from transact;


-- DROP TABLE Transact




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














