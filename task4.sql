/*Сформируйте отчет, который содержит все счета, относящиеся к продуктам типа ДЕПОЗИТ, 
принадлежащих клиентам, у которых нет открытых продуктов типа КРЕДИТ*/
SELECT a.id, a.name_, a.saldo, a.client_ref, a.open_date, a.close_date, a.product_ref, a.acc_num, product_type.name_
FROM accounts a
INNER JOIN products ON a.product_ref = products.id
INNER JOIN product_type ON products.product_type_id = product_type.id
WHERE product_type.name_ = 'ДЕПОЗИТ' 
AND products.client_ref NOT IN (SELECT products.client_ref /*клиенты, у которых есть КРЕДИТ*/
                                FROM products INNER JOIN product_type 
                                ON products.product_type_id = product_type.id
                                WHERE product_type.name_ = 'КРЕДИТ');