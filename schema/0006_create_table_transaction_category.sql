DO $$
BEGIN
	IF NOT EXISTS (
		SELECT *
			FROM information_schema.tables
			WHERE table_name = 'transaction_category'
	) THEN
		CREATE TABLE transaction_category (
			transaction_id INT,
			category_id INT
		);
		
		RAISE NOTICE 'TRANSACTION_CATEGORY TABLE CREATED';
	ELSE
		RAISE NOTICE 'TRANSACTION_CATEGORY TABLE EXISTS';
	END IF;
END;
$$;