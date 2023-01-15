



-- ***************************************** Question 2 **************************************************

-- ********************************* Track Previous Transactions *****************************************


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



-- ***************************** Follow Related Transactions *********************************************



CREATE OR REPLACE FUNCTION followRelatedTransaction (
	
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
					SELECT * FROM followRelatedTransaction(temprow.sourcedep , temprow.desdep , temprow.amount , temprow.trndate , temprow.trntime , 0 , 0);
					
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



SELECT * FROM followRelatedTransaction(500 , 501 , 100000 , '2020-03-25' , '09:00:00' , 0 , 0);


-- SELECT min(t2.trndate) FROM 
-- transact t2 WHERE t2.sourcedep = 505 AND t2.trndate > '2000-03-25' OR 
-- (t2.trndate = '2000-03-25' AND t2.trntime > '09:00:00')

-- SELECT * from transact WHERE sourcedep = 501