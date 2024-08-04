
DO $$
BEGIN
	IF EXISTS (
		SELECT * 
		FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
		WHERE CONSTRAINT_NAME = 'fk_transaction_category_category'
			AND TABLE_NAME = 'transaction_category'
	)
	THEN
		RAISE NOTICE 'FK fk_transaction_category_category exists.';
		RETURN;
	END IF;

	ALTER TABLE transaction_category 
	ADD CONSTRAINT fk_transaction_category_category
	FOREIGN KEY (category_id)
	REFERENCES category (id);
	
	RAISE NOTICE 'FK fk_transaction_category_category created.';
END;
$$;