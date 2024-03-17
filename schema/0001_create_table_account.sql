DO $$
BEGIN
	IF NOT EXISTS (
		SELECT 1 
			FROM information_schema.tables
			WHERE table_name = 'account'
	) THEN
		CREATE TABLE account (
			id SERIAL PRIMARY KEY,
			name VARCHAR(100),
			provider VARCHAR(100),
			type VARCHAR(100)
		);
		
		RAISE NOTICE 'ACCOUNT TABLE CREATED';
	ELSE
		RAISE NOTICE 'ACCOUNT TABLE EXISTS';
	END IF;
END;
$$;