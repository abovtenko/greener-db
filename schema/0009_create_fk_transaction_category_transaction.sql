ALTER TABLE transaction_category
ADD CONSTRAINT fk_transaction_category_transaction
FOREIGN KEY (transaction_id)
REFERENCES transaction (id)