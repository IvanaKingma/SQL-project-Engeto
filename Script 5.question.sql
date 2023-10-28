-----Má výška HDP vliv na změny ve mzdách a cenách potravin? 
Neboli, pokud HDP vzroste výrazněji v jednom roce,
projeví se to na cenách potravin či mzdách ve stejném nebo násdujícím roce výraznějším růstem?------

---rust HDP v jednotlivzch letech


WITH HDP_czech_republic AS (
SELECT
country,
`year` ,
HDP
FROM t_ivana_kingma_project_sql_secondary_final tikpssf 
WHERE country LIKE 'Czech Republic'
)
SELECT
h.country,
h.`year`,
h.HDP,
h2.`year` AS new_year,
h2.HDP AS new_HDP,
round((h2.HDP-h.HDP)/h.HDP*100,2) AS increase_year_HDP
FROM HDP_czech_republic h
JOIN HDP_czech_republic h2
ON h.`year`=h2.`year`-1
GROUP BY h.`year`
;

---tabulka s meyirocnimi ymenami HDP

CREATE TABLE t_ivana_kingma_project_question5_HDP_increase AS
WITH HDP_czech_republic AS (
SELECT
country,
`year` ,
HDP
FROM t_ivana_kingma_project_sql_secondary_final tikpssf 
WHERE country LIKE 'Czech Republic'
)
SELECT
h.country,
h.`year`,
h.HDP,
h2.`year` AS new_year,
h2.HDP AS new_HDP,
round((h2.HDP-h.HDP)/h.HDP*100,2) AS increase_year_HDP
FROM HDP_czech_republic h
JOIN HDP_czech_republic h2
ON h.`year`=h2.`year`-1
GROUP BY h.`year`
;

---meyirocni vyrust cen potravin a mzdy , pouzito z otazky 4.

CREATE TABLE t_ivana_kingma_project_question5 AS
WITH increase_year_table AS(
SELECT 
tikpq.product_name,
tikpq.average_product_price_per_year,
tikpq.`year`, 
tikpq.average_salary_per_year,
tikpq.industry_name,
tikpq2.average_product_price_per_year AS new_average_product_price_per_year,
tikpq2.`year` AS new_year, 
tikpq2.average_salary_per_year AS new_average_salary_per_year, 
round((tikpq2.average_product_price_per_year-tikpq.average_product_price_per_year)/tikpq.average_product_price_per_year *100,2)AS increase_year_price,
round((tikpq2.average_salary_per_year-tikpq.average_salary_per_year)/tikpq.average_salary_per_year *100,2) AS increase_year_salary
FROM t_ivana_kingma_project_question4 tikpq 
JOIN t_ivana_kingma_project_question4 tikpq2 
ON tikpq.`year` =tikpq2.`year` -1
WHERE tikpq.product_name=tikpq2.product_name AND 
tikpq.industry_name =tikpq2.industry_name
)
SELECT
`year`,
new_year,
round (avg(increase_year_price),2) AS average_increase_year_price,
round(avg(increase_year_salary),2) AS average_increase_year_salary
FROM increase_year_table
GROUP BY `year`,
new_year;


----propojeni increase price, salary a HDP

SELECT
tikpqhi.country ,
tikpqhi.`year` ,
tikpqhi.increase_year_HDP,
tikpqhi.new_year,
tikpq.average_increase_year_price ,
tikpq.average_increase_year_salary 
FROM t_ivana_kingma_project_question5_hdp_increase tikpqhi 
JOIN t_ivana_kingma_project_question5 tikpq 
ON tikpqhi.`year` =tikpq.`year` 
GROUP BY tikpqhi.`year`;


 