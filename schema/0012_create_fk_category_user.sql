ALTER TABLE category 
ADD CONSTRAINT fk_category_user
FOREIGN KEY (user_id)
REFERENCES user (id)