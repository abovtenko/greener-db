DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1 
			FROM information_schema.tables
			WHERE table_name = 'customer'
	) THEN
		CREATE TABLE customer (
			id SERIAL PRIMARY KEY,
			username VARCHAR(100),
			password_hash VARCHAR(100),
			date_created DATE
		);
		
		RAISE NOTICE 'CUSTOMER TABLE CREATED';
	ELSE
		RAISE NOTICE 'CUSTOMER TABLE EXISTS';
	END IF;
END;
$$;