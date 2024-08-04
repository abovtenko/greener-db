DO $$
BEGIN
	IF EXISTS (
		SELECT * 
		FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
		WHERE CONSTRAINT_NAME = 'fk_account_g_user'
			AND TABLE_NAME = 'account'
	)
	THEN
		RAISE NOTICE 'FK fk_account_g_user exists.';
		RETURN;
	END IF;

	ALTER TABLE account 
	ADD CONSTRAINT fk_account_g_user
	FOREIGN KEY (user_id)
	REFERENCES g_user (id);
	
	RAISE NOTICE 'FK fk_account_g_user created.';
END;
$$;