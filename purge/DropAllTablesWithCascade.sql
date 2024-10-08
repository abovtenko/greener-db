DO $$
BEGIN
	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'account')
	THEN
		DROP TABLE account CASCADE;
		
		RAISE NOTICE 'Account table dropped.';
	END IF;
	
	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'transaction')
	THEN
		DROP TABLE transaction CASCADE;
		
		RAISE NOTICE 'Transaction table dropped.';
	END IF;
	
	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'g_user')
	THEN
		DROP TABLE g_user CASCADE;
		
		RAISE NOTICE 'g_user table dropped.';
	END IF;
	
	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'category')
	THEN
		DROP TABLE category CASCADE;
		
		RAISE NOTICE 'Category table dropped.';
	END IF;
	
	IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'transaction_category')
	THEN
		DROP TABLE transaction_category CASCADE;
		
		RAISE NOTICE 'transaction_category table dropped.';
	END IF;
END;
$$;