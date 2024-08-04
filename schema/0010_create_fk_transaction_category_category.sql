ALTER TABLE transaction_category 
ADD CONSTRAINT fk_transaction_category_category
FOREIGN KEY (category_id)
REFERENCES category (id)