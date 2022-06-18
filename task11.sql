/*В модель данных добавьте сумму договора по продукту. 
Заполните поле для всех продуктов суммой максимальной дебетовой операции по счету для продукта типа КРЕДИТ, 
и суммой максимальной кредитовой операции по счету продукта для продукта типа ДЕПОЗИТ или КАРТА.*/
ALTER TABLE product_type
ADD price DECIMAL(10,2) NULL;

UPDATE product_type
SET price = IF(name_ = 'КРЕДИТ', (SELECT MAX(sum) FROM records WHERE dt = 1), 
                                 (SELECT MAX(sum) FROM records WHERE dt = 0));

