/*Сформируйте выборку, который содержит средние движения по счетам в рамках одного произвольного дня, в разрезе типа продукта.*/

SELECT product_type.name_, records.oper_date, ROUND(AVG(records.sum), 2) average
FROM records INNER JOIN accounts ON records.acc_ref = accounts.id
INNER JOIN products ON accounts.product_ref = products.id
INNER JOIN product_type ON products.product_type_id = product_type.id
GROUP BY product_type.name_, records.oper_date
ORDER BY product_type.name_, records.oper_date;


/*Можно сделать так, если нужна одна случайная дата

SELECT product_type.name_, (DATE_ADD('2015-01-01', INTERVAL FLOOR(RAND() * 2555) DAY)) AS Дата, ROUND(AVG(records.sum), 2) average
FROM records INNER JOIN accounts ON records.acc_ref = accounts.id
INNER JOIN products ON accounts.product_ref = products.id
INNER JOIN product_type ON products.product_type_id = product_type.id
WHERE records.oper_date = (DATE_ADD('2015-01-01', INTERVAL FLOOR(RAND() * 2555) DAY))
GROUP BY product_type.name_
ORDER BY product_type.name_;*/ 
