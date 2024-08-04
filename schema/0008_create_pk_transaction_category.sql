DO $$
BEGIN
	IF EXISTS (
		SELECT * 
		FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
		WHERE CONSTRAINT_NAME = 'pk_transaction_category'
			AND TABLE_NAME = 'transaction_category'
	)
	THEN
		RAISE NOTICE 'PK transaction_category exists.';
		RETURN;
	END IF;

	ALTER TABLE transaction_category
	ADD CONSTRAINT pk_transaction_category
	PRIMARY KEY (transaction_id, category_id);
	
	RAISE NOTICE 'PK transaction_category created.';
END;
$$;