
DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1 
		FROM information_schema.tables
		WHERE table_name = 'transaction'
	)
	THEN
		CREATE TABLE transaction (
			id SERIAL PRIMARY KEY,
			accound_id INT,
			description VARCHAR(100),
			credit NUMERIC(8, 2),
			debit NUMERIC(8,2),
			date DATE
		);
	
		RAISE NOTICE 'TRANSACTION TABLE CREATED';
	ELSE
		RAISE NOTICE 'TRANSACTION TABLE EXISTS';
	END IF;
END
$$