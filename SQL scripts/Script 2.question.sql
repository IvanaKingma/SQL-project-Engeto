---2.Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?
---počty za prvni srovnatelne obdobi---

SELECT
	product_name,
	`year`,
	round (avg(product_price),2) AS avarage_price_produkt, 
	round (avg (avg_gross_salary_in_czk),2) AS avarage_gross_salary,
	round(round (avg (avg_gross_salary_in_czk),2)/round (avg(product_price),2),0) AS amount_of_products_per_salary
FROM t_ivana_kingma_project_sql_primary_final tikpspf 
WHERE product_name LIKE '%chléb%' OR product_name LIKE '%mléko%'
GROUP BY 
	`year`,
	product_name 
ORDER BY `year` ASC  
LIMIT 2
;
----počty za posledni srovnatelne obdobi---

SELECT
	product_name,
	`year`,
	round (avg(product_price),2) AS avarage_price_produkt, 
	round (avg (avg_gross_salary_in_czk),2) AS avarage_gross_salary,
	round(round (avg (avg_gross_salary_in_czk),2)/round (avg(product_price),2),0) AS amount_of_products_per_salary
FROM t_ivana_kingma_project_sql_primary_final tikpspf  
WHERE product_name LIKE '%chléb%' OR product_name LIKE '%mléko%'
GROUP BY 
	`year`,
	product_name 
ORDER BY `year` desc  
LIMIT 2
;
 