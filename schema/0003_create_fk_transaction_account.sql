
ALTER TABLE transaction 
ADD CONSTRAINT fk_account_transaction
FOREIGN KEY (account_id)
REFERENCES account (id)