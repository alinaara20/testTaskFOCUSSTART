/*Сформируйте выборку, в который попадут клиенты, у которых были операции по счетам за прошедший месяц от текущей даты. 
Выведите клиента и сумму операций за день в разрезе даты.*/

SELECT SUM(sum) sum_oper, oper_date, clients.name_ 
FROM records INNER JOIN accounts ON records.acc_ref = accounts.id
INNER JOIN clients ON accounts.client_ref = clients.id
WHERE oper_date > CURDATE() - INTERVAL 1 MONTH
GROUP BY oper_date;