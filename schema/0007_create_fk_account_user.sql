ALTER TABLE account 
ADD CONSTRAINT fk_account_user
FOREIGN KEY (user_id)
REFERENCES user (id)