4.Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

--- yiskame prumerne rocni cenypotravin a meyd ya jednotlive rokz
SELECT 
product_name, 
round(avg(product_price),2) AS average_product_price_per_year,
`year` , 
round(avg(avg_gross_salary_in_czk),2) AS average_salary_per_year,
industry_name 
FROM t_ivana_kingma_project_sql_primary_final tikpspf 
GROUP BY industry_name,
product_name,
`year`  ;

----vytvoreni dane tabulky, abzchom mohli uyit joiny

CREATE TABLE t_ivana_kingma_project_question4 AS
SELECT 
product_name, 
round(avg(product_price),2) AS average_product_price_per_year,
`year` , 
round(avg(avg_gross_salary_in_czk),2) AS average_salary_per_year,
industry_name 
FROM t_ivana_kingma_project_sql_primary_final tikpspf 
GROUP BY industry_name,
product_name,
`year`  ;

----tabulka joinovana, urcujici navzseni cen potravin a platu v prubehu let

SELECT 
tikpq.product_name,
tikpq.average_product_price_per_year,
tikpq.`year`, 
tikpq.average_salary_per_year,
tikpq.industry_name,
tikpq2.average_product_price_per_year,
tikpq2.`year`,
tikpq2.average_salary_per_year 
FROM t_ivana_kingma_project_question4 tikpq 
JOIN t_ivana_kingma_project_question4 tikpq2 
ON tikpq.`year` =tikpq2.`year` -1
WHERE tikpq.product_name=tikpq2.product_name AND 
tikpq.industry_name =tikpq2.industry_name ;

---growth rate=(pres.-past)/past*100 vzorec-----spravnz vzorec

SELECT 
tikpq.product_name,
tikpq.average_product_price_per_year,
tikpq.`year`, 
tikpq.average_salary_per_year,
tikpq.industry_name,
tikpq2.average_product_price_per_year,
tikpq2.`year`,
tikpq2.average_salary_per_year, 
round((tikpq2.average_product_price_per_year-tikpq.average_product_price_per_year)/tikpq.average_product_price_per_year *100,2)AS increase_year_price,
round((tikpq2.average_salary_per_year-tikpq.average_salary_per_year)/tikpq.average_salary_per_year *100,2) AS increase_year_salary
FROM t_ivana_kingma_project_question4 tikpq 
JOIN t_ivana_kingma_project_question4 tikpq2 
ON tikpq.`year` =tikpq2.`year` -1
WHERE tikpq.product_name=tikpq2.product_name AND 
tikpq.industry_name =tikpq2.industry_name ;

----posledni slpoupec ukayuje meyiocni navzseni cen oprati mydam

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
round (avg(increase_year_price),2) AS average_increase_year_price,
round(avg(increase_year_salary),2) AS average_increase_year_salary,
`year`,
new_year,
round (avg(increase_year_price),2)-round(avg(increase_year_salary),2) AS difference_in_increase_betw_price_salary
FROM increase_year_table
GROUP BY `year`,
new_year;


