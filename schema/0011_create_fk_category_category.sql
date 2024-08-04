ALTER TABLE category 
ADD CONSTRAINT fk_category_category
FOREIGN KEY (category_id)
REFERENCES category (id)