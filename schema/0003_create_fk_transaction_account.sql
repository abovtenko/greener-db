
DO $$
BEGIN
	IF EXISTS (
		SELECT * 
		FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
		WHERE CONSTRAINT_NAME = 'fk_transaction_account'
			AND TABLE_NAME = 'transaction'
	)
	THEN
		RAISE NOTICE 'FK fk_transaction_account exists.';
		RETURN;
	END IF;

	ALTER TABLE transaction 
	ADD CONSTRAINT fk_transaction_account
	FOREIGN KEY (account_id)
	REFERENCES account (id);
	
	RAISE NOTICE 'FK fk_transaction_account created.';
END;
$$;