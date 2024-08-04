
DO $$
BEGIN
	IF EXISTS (
		SELECT * 
		FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
		WHERE CONSTRAINT_NAME = 'fk_transaction_category_transaction'
			AND TABLE_NAME = 'transaction_category'
	)
	THEN
		RAISE NOTICE 'FK fk_transaction_category_transaction exists.';
		RETURN;
	END IF;

	ALTER TABLE transaction_category 
	ADD CONSTRAINT fk_transaction_category_transaction
	FOREIGN KEY (transaction_id)
	REFERENCES transaction (id);
	
	RAISE NOTICE 'FK fk_transaction_category_transaction created.';
END;
$$;