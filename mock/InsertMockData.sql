
DO $$
DECLARE
    user_id INT;
    account_id INT;
    transaction_id INT;
    category_id INT;
BEGIN

    -- delete all data
    DELETE FROM public.transaction_category;
    DELETE FROM public.transaction;
    DELETE FROM public.category;
    DELETE FROM public.account;
    DELETE FROM public.g_user;





    -- insert users

    INSERT INTO public.g_user (username, password_hash, date_created) VALUES
        ('JJohnny', 'ASDFWER', '20240801'),
        ('BigDollar', 'FSFDLLKF', '20240802'),
        ('Jsmiith', 'PLOKIJUH', '20240803');





    -- select user

    SELECT id INTO user_id 
    FROM public.g_user
    WHERE username = 'BigDollar';





    -- insert top level categories

    INSERT INTO public.category (user_id, category_id, name) VALUES
        (user_id, null, 'food and drink'),  
        (user_id, null, 'transportation'),  
        (user_id, null, 'housing');





    -- insert child categories

    SELECT id INTO category_id 
    FROM public.category
    WHERE name = 'food and drink';

    INSERT INTO public.category (user_id, category_id, name) VALUES
        (user_id, category_id, 'fast food'),  
        (user_id, category_id, 'groceries'),  
        (user_id, category_id, 'social');

    SELECT id INTO category_id 
    FROM public.category
    WHERE name = 'transportation';
    
    INSERT INTO public.category (user_id, category_id, name) VALUES
        (user_id, category_id, 'transit'),  
        (user_id, category_id, 'gas'),  
        (user_id, category_id, 'maintenance');    





    -- insert accounts    

    INSERT INTO public.account  (user_id, name, provider, type) VALUES
        (user_id, 'x daily', 'XBank', 'Chequing'),
        (user_id, 'b credit card', 'XBank', 'Credit');





    -- select account and insert transactions

    SELECT id INTO account_id 
    FROM public.account
    WHERE name = 'x daily';

    INSERT INTO public.transaction (account_id, description, credit, debit, date) VALUES
        (account_id, 'macdonalds', 0, 100, '20240801'),
        (account_id, 'macdonalds', 0, 43.3, '20240802'),
        (account_id, 'gas', 0, 97.25, '20240801'),
        (account_id, 'oil change', 0, 145, '20240801');





    -- select transaction and category and insert transaction_category    

    SELECT id INTO category_id 
    FROM public.category
    WHERE name = 'fast food';

    SELECT id INTO transaction_id 
    FROM public.transaction
    WHERE description = 'macdonalds' and date = '20240801';

    INSERT INTO public.transaction_category (transaction_id, category_id) VALUES
        (transaction_id, category_id);

END $$;