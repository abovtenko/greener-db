DO $$
BEGIN
	IF NOT EXISTS (
		SELECT *
			FROM information_schema.tables
			WHERE table_name = 'category'
	) THEN
		CREATE TABLE category (
			id SERIAL PRIMARY KEY,
			user_id INT,
			category_id INT,
			name VARCHAR(100)
		);
		
		RAISE NOTICE 'CATEGORY TABLE CREATED';
	ELSE
		RAISE NOTICE 'CATEGORY TABLE EXISTS';
	END IF;
END;
$$;