/*В результате сбоя в базе данных разъехалась информация между остатками и операциями по счетам. 
Напишите нормализацию (процедуру выравнивающую данные), которая найдет такие счета и восстановит остатки по счету.*/

/*Плохо поняла это задание, но как поняла, нужно сделать пересчет по операциям для каждого счета и внести правильный остаток по счету, 
что я и реализую дальше. То есть основываюсь на том, что операции правильные, а остаток по счету в таблице accounts неправильный*/

UPDATE accounts, (SELECT SUM(IF(dt=1, -sum, sum)) s, acc_ref FROM records GROUP BY acc_ref) r
SET saldo = IF(saldo<>r.s, r.s, saldo)
WHERE accounts.id = r.acc_ref;