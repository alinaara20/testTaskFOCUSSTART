/*Закройте продукты (установите дату закрытия равную текущей) типа КРЕДИТ, у которых произошло полное погашение, 
но при этом не было повторной выдачи.*/

UPDATE products
SET products.close_date = CURDATE()
WHERE products.product_type_id IN (SELECT id FROM product_type WHERE name_ = 'КРЕДИТ')
AND products.id IN (SELECT product_ref FROM accounts WHERE saldo = 0);
