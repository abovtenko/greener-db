ALTER TABLE transaction_category
ADD CONSTRAINT pk_transaction_category
PRIMARY KEY (transaction_id, category_id);