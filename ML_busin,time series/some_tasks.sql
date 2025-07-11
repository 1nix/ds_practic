Составьте таблицу из полей:
name_of_fund — название фонда;
name_of_company — название компании;
amount — сумма инвестиций, которую привлекла компания в раунде.
В таблицу войдут данные о компаниях, 
в истории которых было больше шести важных этапов, а раунды финансирования проходили с 2012 по 2013 год включительно.


SELECT 
        f.name as name_of_fund,
        c.name as name_of_company,
    fr.raised_amount as amount
FROM investment as i
JOIN company as c ON i.company_id=c.id
JOIN fund as f ON i.fund_id = f.id
JOIN funding_round as fr ON i.funding_round_id=fr.id
WHERE   c.milestones > 6
        AND EXTRACT(YEAR FROM fr.funded_at::date) BETWEEN '2012' AND '2013'


Отберите данные по месяцам с 2010 по 2013 год, когда проходили инвестиционные раунды. 
Сгруппируйте данные по номеру месяца и получите таблицу, в которой будут поля:
номер месяца, в котором проходили раунды;
количество уникальных названий фондов из США, которые инвестировали в этом месяце;
количество компаний, купленных за этот месяц;
общая сумма сделок по покупкам в этом месяце.

WITH fm as (
        SELECT COUNT(DISTINCT fund.name) as uniqf,
            EXTRACT(MONTH FROM funding_round.funded_at::date) as m
        FROM funding_round 
        JOIN investment as i ON funding_round.id = i.funding_round_id
        JOIN fund ON i.fund_id = fund.id  
        WHERE country_code='USA' 
        AND EXTRACT(YEAR FROM funding_round.funded_at::date) BETWEEN '2010' AND '2013'
        GROUP BY m
),
buyed as (
    SELECT 
    COUNT(acquisition.acquiring_company_id) as cnameb,
    SUM(price_amount) as sb,
    EXTRACT(MONTH FROM acquired_at::date) as m
    FROM acquisition
    WHERE EXTRACT(YEAR FROM acquired_at::Date) BETWEEN '2010' AND '2013'
    GROUP BY m
)

SELECT  fm.m,
        uniqf,
        cnameb,
        sb
FROM fm 
JOIN buyed ON fm.m = buyed.m


Составьте сводную таблицу и выведите среднюю сумму инвестиций для стран, в которых есть стартапы, зарегистрированные 
в 2011, 2012 и 2013 годах. Данные за каждый год должны быть в отдельном поле.
Отсортируйте таблицу по среднему значению инвестиций за 2011 год от большего к меньшему.

WITH
     inv_2011 AS (
        SELECT AVG(funding_total) as avg2011,
        country_code
        FROM company
        WHERE EXTRACT(YEAR FROM founded_at::Date) = '2011'
        GROUP BY country_code
     ),  -- сформируйте первую временную таблицу
    inv_2012 AS (
        SELECT AVG(funding_total) as avg2012,
        country_code
        FROM company
        WHERE EXTRACT(YEAR FROM founded_at::Date) = '2012'
        GROUP BY country_code
    ),
    inv_2013 AS (
        SELECT AVG(funding_total) as avg2013,
        country_code
        FROM company
        WHERE EXTRACT(YEAR FROM founded_at::Date) = '2013'
        GROUP BY country_code
    )
        
SELECT  inv_2011.country_code,
        avg2011,
        avg2012,
        avg2013

       -- отобразите нужные поля
FROM inv_2011 -- укажите таблицу
INNER JOIN inv_2012 ON inv_2011.country_code=inv_2012.country_code -- присоедините таблицы
INNER JOIN inv_2013 ON inv_2011.country_code=inv_2013.country_code -- присоедините таблицы
ORDER BY avg2011 DESC
