DO $$
BEGIN
	IF NOT EXISTS (
		SELECT *
			FROM information_schema.tables
			WHERE table_name = 'g_user'
	) THEN
		CREATE TABLE g_user (
			id SERIAL PRIMARY KEY,
			username VARCHAR(100),
			password_hash VARCHAR(100),
			date_created DATE
		);
		
		RAISE NOTICE 'g_user TABLE CREATED';
	ELSE
		RAISE NOTICE 'g_user TABLE EXISTS';
	END IF;
END;
$$;